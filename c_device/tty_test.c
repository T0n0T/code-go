/*forlinx serial port test*/
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

#define msleep(n) usleep(n * 1000)

volatile int fd;
char *dev = NULL;
char *baudrate = NULL;

pthread_mutex_t mut;
fd_set rd;
int nread, retval;
unsigned char msg[512];
unsigned char buffer[129];
struct timeval timeout = {0, 100};

unsigned long recvTotal = 0;
volatile pthread_t thread[2];
volatile const int READ_THREAD_ID = 0;
volatile const int SEND_THREAD_ID = 1;
volatile int COM_READ_STATU = 1;
volatile int COM_SEND_STATU = 1;

volatile int sendnum = 1, sendnum_times = 0, recenum = 1, recenum_times = 0, cornum = 0, cornum_times = 0;

static speed_t getBaudrate(int baudrate)
{
    switch (baudrate)
    {
    case 0:
        return B0;
    case 50:
        return B50;
    case 75:
        return B75;
    case 110:
        return B110;
    case 134:
        return B134;
    case 150:
        return B150;
    case 200:
        return B200;
    case 300:
        return B300;
    case 600:
        return B600;
    case 1200:
        return B1200;
    case 1800:
        return B1800;
    case 2400:
        return B2400;
    case 4800:
        return B4800;
    case 9600:
        return B9600;
    case 19200:
        return B19200;
    case 38400:
        return B38400;
    case 57600:
        return B57600;
    case 115200:
        return B115200;
    case 230400:
        return B230400;
    case 460800:
        return B460800;
    case 500000:
        return B500000;
    case 576000:
        return B576000;
    case 921600:
        return B921600;
    case 1000000:
        return B1000000;
    case 1152000:
        return B1152000;
    case 1500000:
        return B1500000;
    case 2000000:
        return B2000000;
    case 2500000:
        return B2500000;
    case 3000000:
        return B3000000;
    case 3500000:
        return B3500000;
    case 4000000:
        return B4000000;
    default:
        return -1;
    }
}

#define ERR 1

int OpenDev(char *dev, int baudrate, int data_bits, char parity, int stop_bits)
{
    int fd = open(dev, O_RDWR | O_NOCTTY);
    if (fd < 0)
    {
        perror("open dev fail\n");
        return ERR;
    }
    struct termios opt;
    int speed;
    if (tcgetattr(fd, &opt) != 0)
    {
        perror("tcgetattr");
        return ERR;
    }

    /* 设置字符大小*/
    // opt = opt;
    // cfmakeraw(&opt);
    // 配置为原始模式
    // opt.c_cflag &= ~CSIZE;
    // c_cflag 控制模式标志

    /* 波特率 */
    switch (baudrate)
    {
    case 2400:
        speed = B2400;
        break;
    case 4800:
        speed = B4800;
        break;
    case 9600:
        speed = B9600;
        break;
    case 19200:
        speed = B19200;
        break;
    case 38400:
        speed = B38400;
        break;
    default:
        speed = B115200;
        break;
    }
    cfsetispeed(&opt, speed);
    cfsetospeed(&opt, speed);
    tcsetattr(fd, TCSANOW, &opt);
    opt.c_cflag &= ~CSIZE;
    /* 数据位 */
    switch (data_bits)
    {
    case 5:
        opt.c_cflag |= CS5;
        break;
    case 6:
        opt.c_cflag |= CS6;
        break;
    case 7:
        opt.c_cflag |= CS7;
        break;
    default:
        opt.c_cflag |= CS8;
        break;
    }

    /* 奇偶校验 */
    switch (parity)
    {
    /* 无校验 */
    case 'n':
    case 'N':
    {
        opt.c_cflag &= ~PARENB;
        opt.c_cflag &= ~CSTOPB;
        opt.c_cflag &= ~CSIZE;
        opt.c_cflag |= CS8;
    }
    break;
    /* 奇校验 */
    case 'o':
    case 'O':
    {
        opt.c_cflag |= PARENB;
        opt.c_cflag |= PARODD;
        opt.c_cflag &= ~CSTOPB;
        opt.c_cflag &= ~CSIZE;
        opt.c_cflag |= CS7;
    }
    break;
    /* 偶校验 */
    case 'e':
    case 'E':
    {
        opt.c_cflag |= PARENB;
        opt.c_cflag &= ~PARODD;
        opt.c_cflag &= ~CSTOPB;
        opt.c_cflag &= ~CSIZE;
        opt.c_cflag |= CS7;
    }
    break;
    /* Space parity */
    case 's':
    case 'S':
    {
        opt.c_cflag &= ~PARENB;
        opt.c_cflag &= ~CSTOPB;
        opt.c_cflag &= ~CSIZE;
        opt.c_cflag |= CS8;
    }
    break;
    default:
    {
        opt.c_cflag &= ~PARENB;
        opt.c_cflag &= ~CSTOPB;
        opt.c_cflag &= ~CSIZE;
        opt.c_cflag |= CS8;
    }
    break;
    }
    /* 停止位 */
    switch (stop_bits)
    {
    case 1:
        opt.c_cflag &= ~CSTOPB;
        break;
    case 2:
        opt.c_cflag |= CSTOPB;
        break;
    default:
        opt.c_cflag &= ~CSTOPB;
        break;
    }
    /* 处理未接收的字符 */
    tcflush(fd, TCIFLUSH);

    /* 等待时间和最小接收字符 */
    opt.c_cc[VTIME] = 1;
    opt.c_cc[VMIN] = 0;

    /* 关闭回显 */
    opt.c_lflag &= ~(ICANON | ECHO | ECHOE | ECHOK | ECHONL | NOFLSH);

    /* 应用新配置 */
    if ((tcsetattr(fd, TCSANOW, &opt)) != 0)
    {
        perror("tcsetattr");
        return ERR;
    }

    return fd;
}

// int OpenDev(char *Dev)
// {
//     speed_t speed;

//     int i=0;
//     int fdt,c=0,num;
//     struct termios oldtio,newtio;

//     speed = getBaudrate(atoi(baudrate));
//     fdt=open(Dev,O_RDWR | O_NONBLOCK| O_NOCTTY | O_NDELAY);
//     if(fdt<0)
//     {
//         perror(Dev);
//         exit(1);
//     }
//     //save to oldtio
//     tcgetattr(fdt,&oldtio);
//     //clear newtio
//     bzero(&newtio,sizeof(newtio));
//     //newtio.c_cflag = speed|CS8|CLOCAL|CREAD|CRTSCTS;
//     newtio.c_cflag = speed|CS8|CLOCAL|CREAD;
//     //    newtio.c_cflag &= ~CSIZE;
//     newtio.c_cflag &= ~CSTOPB;
//     newtio.c_cflag &= ~PARENB;
//     newtio.c_iflag = IGNPAR;
//     newtio.c_oflag = 0;
//     //printf("newtio.c_cflag=%x\n",newtio.c_cflag);
//     tcflush(fdt,TCIFLUSH);
//     tcsetattr(fdt,TCSANOW,&newtio);
//     tcgetattr(fdt,&oldtio);
//     //printf("oldtio.c_cflag=%x\n",oldtio.c_cflag);
//     return fdt;
// }

void read_port(void)
{
    int i = 0, j = 1, num_read;
    FD_ZERO(&rd);
    FD_SET(fd, &rd);
    // timeout.tv_sec = 1;
    // timeout.tv_usec = 0;
    retval = select(fd + 1, &rd, NULL, NULL, &timeout);
    switch (retval)
    {
    case 0:
        // printf("no data input within  1s.\n");
        break;
    case -1:
        perror("select");
        break;
    default:
        if ((nread = read(fd, msg, sizeof(msg))) > 0)
        {
            recvTotal += nread;
            // recvTotal+=strlen(msg);
            printf("recvTotal=%4ld num = %2d recv = %s \n", recvTotal, recenum, msg);
            printf("hex:");
            // for(i=0;i<strlen(msg);i++)
            for (i = 0; i < nread; i++)
            {
                printf("0x%x ", msg[i]);
            }
            printf("\n");
            memset(msg, '\0', sizeof(msg));
            //		printf("%s",msg);
            if (recenum < 65535)
            {
                recenum++;
            }
            else
            {
                recenum_times++;
                recenum = 1;
            }
        }
        break;
    }
}

void *com_read(void *pstatu)
{
    int o;
    while (COM_READ_STATU)
    {
        pthread_mutex_lock(&mut);
        read_port();
        pthread_mutex_unlock(&mut);
    }
    pthread_exit(NULL);
}

void *com_send(void *p)
{
    int ii;
    unsigned int j = 0;
    unsigned long sendTotal = 0;
    while (COM_SEND_STATU)
    {
        j = write(fd, buffer, 9);
        sendTotal += j;
        printf("sendTotal= %4d num = %4d send = %s\n", sendTotal, sendnum, buffer);
        if (sendnum < 65535)
        {
            sendnum++;
        }
        else
        {
            sendnum_times++;
            sendnum = 1;
        }
        msleep(1000);
    }
    pthread_exit(NULL);
}

int start_thread_func(void *(*func)(void *), pthread_t *pthread, void *par, int *COM_STATU)
{
    *COM_STATU = 1;
    memset(pthread, 0, sizeof(pthread_t));
    int temp;
    /*creat thread*/
    if ((temp = pthread_create(pthread, NULL, func, par)) != 0)
    {
        printf("creat thread failer!\n");
    }
    else
    {
        int id = pthread_self();
        printf("%s,creat thread %lu sucess\n", dev, *pthread);
    }
    return temp;
}

void SignHandler(int iSignNo)
{
    int tmp_t = 0;

    COM_SEND_STATU = 0;
    msleep(1000);
    COM_READ_STATU = 0;

    msleep(1000);

    // printf("%s,stop send,sendnum=%d,receivenum=%d\n",dev,sendnum*32,recenum);
    while (tmp_t < 50000)
    {
        read_port();
        tmp_t++;
    }
    printf("\n%s,Send: %d ,Receive: %d \n", dev, (sendnum_times * 65535 + sendnum - 1), (recenum_times * 65535 + recenum - 1));
    exit(1);
}

int main(int argc, char **argv)
{
    buffer[0] = 'C';
    buffer[1] = 'Y';
    buffer[2] = 'G';
    buffer[3] = 'H';
    buffer[4] = 'e';
    buffer[5] = 'l';
    buffer[6] = 'l';
    buffer[7] = 'o';
    buffer[8] = '\0';

    signal(SIGINT, SignHandler);
    dev = argv[1];

    databit = atoi(argv[3]) if (dev == NULL)
    {
        printf("Please input serial device name ,for exmaple /dev/ttyS2.\n");
        exit(1);
    }

    fd = OpenDev(dev, atoi(argv[2]), atoi(argv[3]), 'N', 1);

    if (fd > 0)
    {
    }
    else
    {

        printf("Can't Open Serial Port %s \n", dev);
        exit(0);
    }

    printf("\nWelcome to TTYtest! Press Ctrl + 'c' to stop.\n\n");

    pthread_mutex_init(&mut, NULL);

    //		funct_select();

    if (start_thread_func(com_read, (pthread_t *)&thread[READ_THREAD_ID], (int *)&COM_READ_STATU, (int *)&COM_READ_STATU) != 0)
    {
        printf("error to leave\n");
        return -1;
    }

    if (start_thread_func(com_send, (pthread_t *)&thread[SEND_THREAD_ID], (int *)&COM_SEND_STATU, (int *)&COM_SEND_STATU) != 0)
    {
        printf("error to leave\n");
        return -1;
    }

    while (1)
    {
    }
}
