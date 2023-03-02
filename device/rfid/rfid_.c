#include "stdio.h"
#include "unistd.h"
#include "sys/types.h"
#include "sys/stat.h"
#include "sys/ioctl.h"
#include "fcntl.h"
#include "stdlib.h"
#include "string.h"
#include <poll.h>
#include <sys/select.h>
#include <sys/time.h>
#include <signal.h>
#include <fcntl.h>

/*
 * @description		: main主程序
 * @param - argc 	: argv数组元素个数
 * @param - argv 	: 具体参数
 * @return 		: 0 成功;其他 失败
 */
int ArrayToStr(unsigned char *Buff, unsigned int BuffLen, char *OutputStr)
{
	int i = 0;
	char TempBuff[128] = {0};
	char strBuff[256] = {0};

	for (i = 0; i < BuffLen; i++) {
		sprintf(
		    TempBuff, "%02x",
		    Buff[i]); //以十六进制格式输出到TempBuff，宽度为2
		strncat(
		    strBuff, TempBuff,
		    BuffLen * 2); //将TempBuff追加到strBuff结尾
	}
	strncpy(OutputStr, strBuff, BuffLen * 2); //将strBuff复制到OutputStr
	return BuffLen * 2;
}

int main(int argc, char *argv[])
{
	int fd;
	char i = 0;
	int lostTimes = 0;
	int testTimes = 0;
	unsigned char databuf[5] = {0};
	unsigned char lastData[5] = {0};
	unsigned char nullData[5] = {0};
	char *filename;
	char strout[128] = {0};
	int ret = 0;

	if (argc != 3) {
		printf("Error Usage!                               	"
		       "		        XXX.\r\n");
		return -1;
	}
	filename = argv[1];

	fd = open(filename, O_RDWR);
	if (fd < 0) {

		printf(
		    "RFID test times: %d  lostTimes:%d   		"
		    "			XXX. \r\n",
		    testTimes, lostTimes);
		close(fd);
		return -1;
	}

	testTimes = atoi(argv[2]);

	for (; i < testTimes; i++) {
		ret = read(fd, databuf, sizeof(databuf));
		if (ret == 5) {
			if (i != 0) {
				if (0 !=
				    memcmp(
					lastData, databuf, sizeof(lastData))) {
					lostTimes++;
				}
			}
			if (0 == memcmp(nullData, databuf, sizeof(databuf))) {
				lostTimes++;
			}
			memcpy(lastData, databuf, sizeof(databuf));
			ArrayToStr(databuf, sizeof(databuf), strout);
			printf("RFID:0x%s\r\n", strout);
		} else {
			lostTimes++;
		}
	}
	if (lostTimes == 0 && i == testTimes) {
		printf(
		    "RFID Attest  test times: %d                               "
		    "              OK. \r\n",
		    testTimes);
	} else {
		printf(
		    "RFID Attest  test times: %d    lostTimes:%d 	"
		    "			XXX. \r\n",
		    testTimes, lostTimes);
	}
	close(fd); /* 关闭文件 */
	return 0;
}
