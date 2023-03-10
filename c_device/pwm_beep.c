#include<stdint.h>
#include<string.h>
#include<fcntl.h>
#include<unistd.h>
#include<stdio.h>
#include<linux/input.h>
#include <getopt.h>
#include <linux/types.h>
#include <stdlib.h>
#include <sys/ioctl.h>

static char *device = "/dev/input/event0";
static uint32_t period = 1000;
static uint32_t type = 0;

static void print_usage(const char *prog)
{
	printf("Usage: %s [-d:p:t:]\n", prog);
	puts("  -d --device   device to use (default /dev/input/event0)\n"
	     "  -p --period   period (defalut 1000 Hz)\n"
         "  -t --type     type (defalut 0 SND_BELL Hz,1 SND_TONE)\n" );
	exit(1);
}

static void parse_opts(int argc, char *argv[])
{
	while (1) {
		static const struct option lopts[] = {
			{ "device",  required_argument, NULL, 'd' },
			{ "period",  required_argument, NULL, 'p' },
            { "type",    required_argument, NULL, 't' },
			{ NULL, no_argument, NULL, 0 },
		};
		int c;

		c = getopt_long(argc, argv, "d:p:t:", lopts, NULL);

		if (c == -1)
			break;

		switch (c) {
		case 'd':
			device = optarg;
			break;
		case 'p':
			period = atoi(optarg);
			break;
        case 't':
            type = atoi(optarg);
            break;
		default:
			print_usage(argv[0]);
			break;
		}
	}
}

void beep_action(int i)
{
    int fd, ret;
    struct input_event event;

    if ((fd = open(device, O_RDWR)) < 0)    {
        perror("beep test wrong");
        return 1;
    }
    event.type = EV_SND;   
    event.code = SND_BELL;
    switch (i)
    {
    case 0:
        event.value = 0;
        ret = write(fd, &event, sizeof(struct input_event));
        break;
    case 1:        
        event.value = period;
        ret = write(fd, &event, sizeof(struct input_event));
        break;
    
    default:
        break;
    }
    close(fd);
}

int main(int argc, char *argv[])
{
    int fd, ret;
    struct input_event event;

    printf( "beep test begin ====================================================\n" );

    parse_opts( argc, argv );

    if (( fd = open( device, O_RDWR ) ) < 0) {
        perror("beep test wrong");
        return 1;
    }

    event.type = EV_SND;

    if ( type == 0 ){
        event.code = SND_BELL;
        event.value = period;
        ret = write(fd, &event, sizeof(struct input_event));
        sleep( 3 );
        event.value = 0;
        ret = write(fd, &event, sizeof(struct input_event));
        
    }else if ( type == 1 ){
        event.code = SND_TONE;
        event.value = period;
        ret = write( fd, &event, sizeof( struct input_event ) );
        sleep( 3 );
        event.value = 0;
        ret = write( fd, &event, sizeof( struct input_event ) );
    }

    close( fd );
    printf("beep test end ======================================================\n");
    return 0;
}