#ifndef HBDX_HBDX_PARA_STRUCT_H_
#define HBDX_HBDX_PARA_STRUCT_H_

#define DX_LORA_FILENAME   "lorapara.dat"
#define DX_DXK_FILENAME   "dxkpara.dat"
#define DX_JDX_FILENAME   "jdxpara.dat"
#define DX_DXZ_FILENAME   "dxzpara.dat"
#define DX_MQTTC_FILENAME   "mqttclient.dat"

#define DX_FILE_CODE     0xE1E2E3E4  //文件起始特征码
#define DX_FILE_DBVER  0x01000001  //文件版本

#define DX_DXKZQ_MAX     1   //最大个数
#define DX_JDX_MAX       84 //地线集器最大个数
#define DX_DXZ_RFID_MAX        4096  //地线桩最大个数

/*大小 64 字节*/
typedef struct _DX_FILE_HEAD
{
	unsigned int	  m_StartCode;    //0 起始特征码
	unsigned int      m_DbFileVison;  //1 数据库文件版本
	short   m_wYear;     //2 年
	unsigned char     m_Month;      //月
	unsigned char     m_Day;//日
	unsigned char     m_Hour;      //3 时
	unsigned char     m_Minute;//分
	unsigned char     m_Second;//秒
	unsigned char     m_byRes;//保留
	unsigned int     m_PointsNum;//4 点数
	unsigned int     m_dwRes5;
	unsigned int     m_dwRes6;
	unsigned int     m_dwRes7;
}DX_FILE_HEAD;

//Lora网关参数结构
typedef struct _LORA_REC
{
	int  m_bsptype;      //bsp类型:0-A40I,1:ESM6800
	int  m_ServerPort;      //远方端口1 默认=1883
	int  m_nRes1;      //地线库编号，默认0
	int  m_nRes2;

	char m_ServerIP[64];      //localhost
	char m_ApplicationID[64]; //appid标识
	char m_szRes1[64];
	char m_szRes2[64];
	char m_szRes3[64];
	char m_szRes4[64];
}LORA_REC;

//地线控制器配置参数结构
typedef struct _DXK_REC  
{
	int  m_ServerPort;      //远方端口1 默认=4001
	int  m_bszTotalNum;      //闭锁桩数目
	int  m_dxkNo;      //地线库编号，默认0
	int  m_UpTxEQTimer;      //上传采集器电量周期时间
	
	char devSN[64]; //设备标识
	char devType[64];//设备类型
	char devName[64];
	char mfginfo[64];
	char hardVersion[64];
	char m_ServerIP[64];      //远方IP1 默认=192.168.0.1
		
}DXK_REC;


typedef struct _JDX_REC  //接地线配置参数结构
{
	int PointNo;//点号

	unsigned char m_dxkNo;//地线库编号
	unsigned char m_bszNo;//闭锁桩编号
	unsigned char m_byRes1;//保留1
	unsigned char m_byRes2;//保留2

	char devSN[64]; //设备标识
	char devType[64];//设备类型
	char devName[64];
	char mfginfo[64];
	char hardVersion[64];
	char groundWireNo[64];//接地线编号		
	unsigned char  m_dxMacAddr[8];//采集器Lora Mac UID
	unsigned char  m_dxctRfid[8];//地线插头RFID
	char m_bszDisplayNo[64];//闭锁桩显示编号	
}JDX_REC;
//typedef CArray< JDX_REC, JDX_REC&> CJdxRecArray;
//typedef CArray< DXZREC, DXZREC&> CDxzRecArray;
typedef struct _DXZREC  //接地桩参数结构
{
	int PointNo;//点号
	unsigned char Rfid[8];//接地桩RFID
	char groundPileWireNo[64];//接地桩编号
	char description[64];//接地桩地理位置描述,例如:魏都区1号厂房1号桩
}DXZREC;

//-------------------------------------
//TO边缘代理配置参数结构
typedef struct _MQTTCLIENT_REC  
{
	int  m_ifSSL;
	int  m_ServerPort;     
	char m_ServerIP[32];  //远方IP1 默认=192.168.0.1
	int  m_UpTxEQTimer;      //上传采集器电量周期时间
	char caFile[64];  //CA File
	char ClientCertificateFile[64];//Client Certificate File
	char ClientkeyFile[64];//Client key file
	unsigned char reserv[128];	
		
}MQTTCLIENT_REC;
//---------------------------
// extern  LORA_REC      g_LoraRec;
// extern  DXK_REC       g_DxkRec;
// extern  JDX_REC       *g_JdxRecArray;
// extern  DXZREC        *g_DxzRecArray;//地线桩对象数组
// extern  MQTTCLIENT_REC g_MqttClientRec;

// extern int g_JdxRecArraySize;
// extern int g_DxzRecArraySize;

// extern void init_mqttclient_para( );
// extern int  read_mqttclient_para_file( );
// //extern int  wirte_mqttclient_para_file( );

// // extern void init_lora_para( );
// // extern int  read_lora_para_file( );

// extern void init_dxk_para( );
// extern int  read_dxk_para_file( );
// //extern int  wirte_dxk_para_file( );

// extern int  read_jdx_para_file( );
// //extern int  wirte_jdx_para_file( );

// extern int  read_dxz_para_file( );
// //extern int  wirte_dxz_para_file( );

// extern int Get_JDX_Index_By_Mac(  unsigned char  * pMac);  
// extern int Get_JDX_LoraUID_by_index(int nIndex,unsigned char *uid);
// extern int Get_JDX_index_by_bszNo(unsigned char num);
// extern int Get_JDX_bszNo_by_index(unsigned char nIndex);
// extern int Get_Dxz_Index_By_RFID( unsigned char  * pRFID );//获取RFID索引
#endif /* HBDX_HBDXPARASTRUCT_H_ */
