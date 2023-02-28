#include <stdio.h>
#include "source.h"
#include "HBDXParaStruct.h"

int main(int argc, char const *argv[])
{
    init_lora_para();
    if (read_lora_para_file() < 0)
    {
        printf("read lora para file failed \r\n");
        return -1;
    }
    return 0;
}
