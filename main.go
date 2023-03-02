package main

//#include <./c/source.h>
//
// DX_FILE_HEAD Head;
// LORA_REC g_LoraRec;
// DXK_REC g_DxkRec;
// MQTTCLIENT_REC g_MqttClientRec;
// JDX_REC *g_JdxRecArray = NULL;
// int g_JdxRecArraySize = 0;
// DXZREC *g_DxzRecArray=NULL;
// int g_DxzRecArraySize = 0;
//void init_lora_para( )
// {
// 	 memset( &g_LoraRec,0,sizeof(LORA_REC) );
// 	 g_LoraRec.m_bsptype = 0;//bsp类型:0-A40I,1:ESM6800
// 	 g_LoraRec.m_ServerPort = 1883;//默认=1883
// 	 g_LoraRec.m_nRes1 = 0;
// 	 g_LoraRec.m_nRes2 = 0;
// 	 strcpy( g_LoraRec.m_ServerIP,"localhost");
// 	 strcpy( g_LoraRec.m_ApplicationID,"ApplicationID");//设备标识
// 	 strcpy( g_LoraRec.m_szRes1,"res1");//设备类型
// 	 strcpy( g_LoraRec.m_szRes2,"res2");
// 	 strcpy( g_LoraRec.m_szRes3,"res3");
// 	 strcpy( g_LoraRec.m_szRes4,"res4");
// }
//  int read_lora_para_file()
//  {
//          int nReadSize;
//          int nResult = 0;
//          char szFileName[256];
//          // sprintf(szFileName,"%s/dx/%s",A40I_CCU_CONF_HBDX, DX_LORA_FILENAME);
//          sprintf(szFileName, "%s", "./c/lorapara.dat");
//          char *szFile = szFileName;
//          FILE *fp = fopen(szFile, "rb");
//          if (!fp)
//          {
//                 return -1;
//          }
//          DX_FILE_HEAD hd;
//          memset(&hd, 0, sizeof(DX_FILE_HEAD));
//          nReadSize = fread(&hd, sizeof(unsigned char), sizeof(DX_FILE_HEAD), fp);
//          if (nReadSize == sizeof(DX_FILE_HEAD))
//          {
//                 int nCount = hd.m_PointsNum;
//				   Head = hd;
//	 			   //printf("%u\n", sizeof(hd));
//                 if (nCount == 1)
//                 {
//                                 LORA_REC st;
//                                 memset(&st, 0, sizeof(LORA_REC));
//								   //printf("%u\n", sizeof(st));
//                                 nReadSize = fread(&st, sizeof(unsigned char), sizeof(st), fp);
//                                 if (nReadSize == sizeof(st))
//                                         g_LoraRec = st;
//                                 else
//                                 {
//                                         nResult = -1;
//                                 }
//                 }
//          }
//          fclose(fp);
//          return nResult;
//  }
import "C"
import (
	"fmt"
	"readfile/parse"
)

func lora_init() {
	C.init_lora_para()
	C.read_lora_para_file()

	// fmt.Printf("%X\n", C.Head)
	// fmt.Printf("%X\n", C.g_LoraRec)
}

func main() {
	lora_init()

	fmt.Println("---------------------------------")
	test := parse.Config{Path: "./c/lorapara.dat", Kind: "LORA_REC"}

	err := test.ReadConfig()
	if err != nil {
		fmt.Println(err.Error())
	}
	test.WriterConfig()

}
