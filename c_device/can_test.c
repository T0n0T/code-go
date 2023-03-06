#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <linux/can.h>
#include <linux/can/raw.h>
#include <stdint.h>
#include <fcntl.h>
#include <getopt.h>
#include <linux/types.h>
#include <termios.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <pthread.h>
#include <sys/time.h>
#include <signal.h>
#include <linux/input.h>

static char *senddevice = "can0";
static char *readdevice = "can1";
static char *bitrate = "125000";
static char set_bitrate_command[100]={0};
static int  frequency = 5;
static int  timeout = 7;

volatile	pthread_t thread[2]; 
volatile	const int READ_THREAD_ID = 0;  
volatile	const int SEND_THREAD_ID = 1;
volatile	int COM_READ_STATU = 1;  
volatile	int COM_SEND_STATU = 1;

// static void print_usage(const char *prog)
// {
// 	printf("Usage: %s [-s:r:b:f:t:]\n", prog);
// 	puts("  -s --senddevice  senddevice to use (default can0)\n"
//          "  -r --readdevice  readdevice to use (default can1)\n"
//          "  -b --bitrate     bitrate(defalut 125000)\n"
//          "  -f --frequency   frequency(defalut 5)\n" 
//          "  -t --timeout     timeout(defalut 7)\n");
// 	exit(1);
// }

// static void parse_opts(int argc, char *argv[])
// {
// 	while (1) {
// 		static const struct option lopts[] = {
// 			{ "senddevice",required_argument, NULL, 's' },
//             { "readdevice",required_argument, NULL, 'r' },
// 			{ "bitrate",required_argument, NULL, 'b' },
//             { "frequency",required_argument, NULL, 'f' },
//             { "timeout",required_argument, NULL, 't' },
// 			{ NULL, no_argument, NULL, 0 },
// 		};
// 		int c;

// 		c = getopt_long(argc, argv,"s:r:b:f:t:", lopts, NULL);

// 		if (c == -1)
// 			break;

// 		switch (c) {
//         case 's':
// 			senddevice = optarg;
// 		case 'r':
// 			readdevice = optarg;
// 			break;
//         case 'b':
//             bitrate = optarg;
//             break;
//         case 'f':
// 			frequency = atoi(optarg);
// 			break;
//         case 't':
// 			timeout  = atoi(optarg);
// 			break;
// 		default:
// 			print_usage(argv[0]);
// 			break;
// 		}
// 	}
// }

int start_thread_func(void*(*func)(void*), pthread_t* pthread, void* par)  
{    
    memset(pthread, 0, sizeof(pthread_t));  
    int temp = 0;  
     
    if( (temp = pthread_create(pthread, NULL, func, par) ) != 0 ){
        printf("creat thread failer!\n");
    }else{  
        int id = pthread_self();   
    }  

    return temp;  
} 

void* com_read_thread(void* pstatu)  
{   
    int s, nbytes;
    int times;
    struct sockaddr_can addr;
    struct ifreq ifr;
    struct can_frame frame = {0};
    s = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    strcpy(ifr.ifr_name, readdevice );
    ioctl(s, SIOCGIFINDEX, &ifr); 
    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    bind(s, (struct sockaddr *)&addr, sizeof(addr));
    
    while(1) {
            nbytes = read(s, &frame, sizeof(frame));//接收总线上的报文保存在frame[1]中
            times++;
            printf("receive data:%s,the nbytes:%d,length:%d,ID:0x%X DLC:%d,times:%d\n",frame.data,nbytes,sizeof(frame),frame.can_id, frame.can_dlc,times); 
            if (times >= frequency){
                break;
            } 
    }

    close(s);
    printf("can test end ===================================================\n");
    pthread_exit(NULL); 
    exit(0);
}

void* com_send_thread(void* p)  
{
    int s, nbytes;
    struct sockaddr_can addr;
    struct ifreq ifr;
    struct can_frame frame={0};

    s = socket(PF_CAN, SOCK_RAW, CAN_RAW);//创建套接字
    strcpy(ifr.ifr_name, senddevice );
    ioctl(s, SIOCGIFINDEX, &ifr); //指定 can0 设备
    addr.can_family = AF_CAN;
    addr.can_ifindex = ifr.ifr_ifindex;
    bind(s, (struct sockaddr *)&addr, sizeof(addr));//将套接字与 can0 绑定
    //setsockopt(s, SOL_CAN_RAW, CAN_RAW_FILTER, NULL, 0);//设置过滤规则，取消当前注释为禁用过滤规则，即不接收所有报文，不设置此项（即如当前代码被注释）为接收所有ID的报文。

    frame.can_id = 0x666;
    frame.can_dlc = 6;
    frame.data[0] = 72;
    frame.data[1] = 69;
    frame.data[2] = 76;
    frame.data[3] = 76;
    frame.data[4] = 79;
    frame.data[5] = 0;

    for( int i=0; i<frequency; i++ )
    {
        printf("send date:%s,times:%d\n",frame.data,i);
        nbytes = write(s, &frame, sizeof(frame));
        if( nbytes != sizeof(frame) ) {
            printf("can test send error frame\n!");
        }
        sleep(1);
    }
    close(s);
    pthread_exit(NULL);	
}

void alarm_signal_handler(int iSignNo)
{
    exit(-1);
}

typedef void (*sighandler_t)(int);

int main(int argc, char *argv[])
{
    sighandler_t halder = alarm_signal_handler;
    signal(SIGALRM,halder);
    alarm(timeout);

    parse_opts( argc, argv );
    sprintf(set_bitrate_command,"/sbin/ip link set %s up type can bitrate %s restart-ms 5000",senddevice,bitrate);
    printf("%s\n",set_bitrate_command);
    system(set_bitrate_command);

    sprintf(set_bitrate_command,"/sbin/ip link set %s up type can bitrate %s restart-ms 5000",readdevice,bitrate);
    printf("%s\n",set_bitrate_command);
    system(set_bitrate_command);

    if( start_thread_func(com_read_thread, (pthread_t*)&thread[READ_THREAD_ID],  (int *)&COM_READ_STATU) != 0 ){  
        printf( "can test error in create com_read thread\n");  
        return -1;  
    }  

    if( start_thread_func(com_send_thread, (pthread_t*)&thread[SEND_THREAD_ID], (int *)&COM_SEND_STATU ) != 0 ){  
        printf( "can test error in create com_send thread\n");
        return -1;  
    }  
     
    while (1);
    
    return 0;
}