#include "HBDXParaStruct.h"
#include <string.h>
#include <stdio.h>

// DX_FILE_HEAD Head;
LORA_REC g_LoraRec;
DXK_REC g_DxkRec;
JDX_REC *g_JdxRecArray;
DXZREC *g_DxzRecArray; // 地线桩对象数组
MQTTCLIENT_REC g_MqttClientRec;

int g_JdxRecArraySize;
int g_DxzRecArraySize;

void init_lora_para();
int read_lora_para_file();
