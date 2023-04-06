#include <termios.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <signal.h>
#include <stdint.h>
#include <linux/input.h>
#include <getopt.h>
#include <linux/types.h>
#include <sys/ioctl.h>

#define msleep(n) usleep(n*1000)

static char * test_name = "rs485";
static int frequency = 5;
static int timeout = 7;

volatile int fd_send;
volatile int fd_read;

static char *send_device = "/dev/ttyCH9344USB1";
static char *read_device = "/dev/ttyCH9344USB1";

unsigned char send_buffer[11]={"HELLOWORLD"};
unsigned char read_buffer[11]={""};

static int baudrate = 9600;

pthread_mutex_t mut;
fd_set rd;
int nread,retval;

volatile	pthread_t thread[2]; 
volatile	const int READ_THREAD_ID = 0;  
volatile	const int SEND_THREAD_ID = 1;
volatile	int COM_READ_STATU = 1;  
volatile	int COM_SEND_STATU = 1; 

volatile	int sendnum=1,sendnum_times=0,recenum=1,recenum_times=0,cornum=0,cornum_times=0;

static speed_t getBaudrate(int baudrate)
{
    switch(baudrate) {
        case 0: return B0;
        case 50: return B50;
        case 75: return B75;
        case 110: return B110;
        case 134: return B134;
        case 150: return B150;
        case 200: return B200;
        case 300: return B300;
        case 600: return B600;
        case 1200: return B1200;
        case 1800: return B1800;
        case 2400: return B2400;
        case 4800: return B4800;
        case 9600: return B9600;
        case 19200: return B19200;
        case 38400: return B38400;
        case 57600: return B57600;
        case 115200: return B115200;
        case 230400: return B230400;
        case 460800: return B460800;
        case 500000: return B500000;
        case 576000: return B576000;
        case 921600: return B921600;
        case 1000000: return B1000000;
        case 1152000: return B1152000;
        case 1500000: return B1500000;
        case 2000000: return B2000000;
        case 2500000: return B2500000;
        case 3000000: return B3000000;
        case 3500000: return B3500000;
        case 4000000: return B4000000;
        default: return -1;
    }
}

int OpenDev(char *Dev)
{
    speed_t speed;

    int i=0;
    int fdt,c=0,num;
    struct termios oldtio,newtio;

    if ( -1 == getBaudrate( baudrate ) ){
        printf( "%s test error in baudrate set\n",test_name );
        return -1;
    }

    fdt = open( Dev,O_RDWR | O_NONBLOCK| O_NOCTTY );
    if( fdt < 0 ) {
        printf("%s test error in open %s\n",test_name,Dev);
        return -1;
    }

    tcgetattr(fdt,&oldtio);
    bzero(&newtio,sizeof(newtio));
    newtio.c_cflag = speed|CS8|CLOCAL|CREAD;
    newtio.c_cflag &= ~CSTOPB;
    newtio.c_cflag &= ~PARENB;
    newtio.c_iflag = IGNPAR;  
    newtio.c_oflag = 0;
    newtio.c_cc[VTIME] = 0;
    newtio.c_cc[VMIN] = 11;
    tcflush(fdt,TCIFLUSH);  
    tcsetattr(fdt,TCSANOW,&newtio);  
    tcgetattr(fdt,&oldtio);

    return fdt;
}

void* com_read_thread(void* pstatu)  
{   
    int i = 0;

    while(1) {
        ssize_t nread = 0;

        pthread_mutex_lock(&mut);
        fcntl(fd_read, F_SETFL,0);
        nread = read( fd_read, read_buffer, sizeof(read_buffer) );
		if ( nread > 0 ) {
            i++;
            printf("%s test read data:%s times:%d\n",test_name,read_buffer,i);
            if (i == frequency)
                break;
		} else {
			printf("%s test error in read data\n",test_name);
        }
        pthread_mutex_unlock(&mut);
    }
    printf("%s test end ===================================================\n",test_name);
    pthread_exit(NULL); 
    exit(0);
}

void* com_send_thread(void* p)  
{
    ssize_t nwrite;

    for (int i = 0; i < frequency;i++) { 	
        printf("%s test send data:%s\n",test_name,send_buffer);
        nwrite = write(fd_send, send_buffer, sizeof(send_buffer));
        sleep(1);
    }

    pthread_exit(NULL);	
}

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

void alarm_signal_handler(int iSignNo)
{
    exit(-1);
}

static void print_usage(const char *prog)
{
	printf("Usage: %s [-n:s:r:b:t:f:]\n", prog);
	puts("  -n --testname     testname to use (default rs485)\n"
         "  -s --senddevice   senddevice to use (default /dev/ttyS0)\n"
	     "  -r --readdevice   readdevice to use (defalut /dev/ttyS1)\n"
         "  -b --baudrate     baudrate (defalut 9600)\n"
         "  -t --timeout      timeout (defalut 7(S))\n"
         "  -f --frequency    frequency (defalut 5 times)\n" );
	exit(1);
}

static void parse_opts(int argc, char *argv[])
{
	while (1) {
		static const struct option lopts[] = {
            { "testname",required_argument, NULL, 'n' },
			{ "senddevice",required_argument, NULL, 's' },
			{ "readdevice",required_argument, NULL, 'r' },
            { "baudrate",required_argument, NULL, 'b' },
            { "timeout",required_argument, NULL, 't' },
            { "frequency",required_argument, NULL, 'f' },
			{ NULL, no_argument, NULL, 0 },
		};

		int c;

		c = getopt_long(argc, argv, "n:s:r:b:t:f:", lopts, NULL);

		if (c == -1)
			break;

		switch (c) {
            case 'n':
                test_name = optarg;
                break;
            case 's':
                send_device = optarg;
                break;
            case 'r':
                read_device = optarg;
                break;
            case 'b':
                baudrate = atoi(optarg);
                break;
            case 't':
                timeout = atoi(optarg);
                break;
            case 'f':
                frequency = atoi(optarg);
                break;
            default:
                print_usage(argv[0]);
                break;
		}
	}
}

typedef void (*sighandler_t)(int);

int main(int argc, char **argv)
{
    sighandler_t halder = alarm_signal_handler;
    signal(SIGALRM,halder);

    parse_opts(argc, argv);

    alarm(timeout);
    
    printf("%s test begin ===================================================\n",test_name);

    if ( ( fd_send = OpenDev( send_device ) ) < 0 ) {
        return -1;
    }

    if ( ( fd_read = OpenDev( read_device ) ) < 0 ) {
        return -1;
    }
   
    pthread_mutex_init( &mut,NULL );

    if( start_thread_func(com_read_thread, (pthread_t*)&thread[READ_THREAD_ID],  (int *)&COM_READ_STATU) != 0 ){  
        printf( "%s test error in create com_read thread\n",test_name );  
        return -1;  
    }  

    if( start_thread_func(com_send_thread, (pthread_t*)&thread[SEND_THREAD_ID], (int *)&COM_SEND_STATU ) != 0 ){  
        printf( "%s test error in create com_send thread\n",test_name );
        return -1;  
    }  

    while(1);
}






