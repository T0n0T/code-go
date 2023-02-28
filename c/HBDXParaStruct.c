#include "source.h"

int Get_Dxz_Index_By_RFID(unsigned char *pRFID)
{
        int i;
        for (i = 0; i < g_DxzRecArraySize; i++)
        {
                if ((pRFID[0] == g_DxzRecArray[i].Rfid[0]) && (pRFID[1] == g_DxzRecArray[i].Rfid[1]) &&
                    (pRFID[2] == g_DxzRecArray[i].Rfid[2]) && (pRFID[3] == g_DxzRecArray[i].Rfid[3]) &&
                    (pRFID[4] == g_DxzRecArray[i].Rfid[4]))

                        return i;
        }

        return -1;
}

int Get_JDX_Index_By_Mac(unsigned char *pMac)
{
        int i;
        for (i = 0; i < g_JdxRecArraySize; i++)
        {
                if ((pMac[0] == g_JdxRecArray[i].m_dxMacAddr[0]) && (pMac[1] == g_JdxRecArray[i].m_dxMacAddr[1]) &&
                    (pMac[2] == g_JdxRecArray[i].m_dxMacAddr[2]) && (pMac[3] == g_JdxRecArray[i].m_dxMacAddr[3]) &&
                    (pMac[4] == g_JdxRecArray[i].m_dxMacAddr[4]) && (pMac[5] == g_JdxRecArray[i].m_dxMacAddr[5]) &&
                    (pMac[6] == g_JdxRecArray[i].m_dxMacAddr[6]) && (pMac[7] == g_JdxRecArray[i].m_dxMacAddr[7]))

                        return i;
        }
        return -1;
}

int Get_JDX_LoraUID_by_index(int nIndex, unsigned char *uid)
{
        if (nIndex < 0 || nIndex > g_JdxRecArraySize)
                return -1;
        memcpy(uid, g_JdxRecArray[nIndex].m_dxMacAddr, 8);
        return 0;
}

// 通过闭锁桩编号找到对应的索引
int Get_JDX_index_by_bszNo(unsigned char num)
{
        int i;
        for (i = 0; i < g_JdxRecArraySize; i++)
        {
                if (g_JdxRecArray[i].m_bszNo == num)
                        return i;
        }
        return -1;
}

// 通过闭锁桩索引找到对应的编号
int Get_JDX_bszNo_by_index(unsigned char nIndex)
{
        if (nIndex < 0 || nIndex > g_JdxRecArraySize)
                return -1;
        return g_JdxRecArray[nIndex].m_bszNo;
}
void init_lora_para()
{
        memset(&g_LoraRec, 0, sizeof(LORA_REC));

        g_LoraRec.m_bsptype = 0;       // bsp类型:0-A40I,1:ESM6800
        g_LoraRec.m_ServerPort = 1883; // 默认=1883
        g_LoraRec.m_nRes1 = 0;
        g_LoraRec.m_nRes2 = 0;

        strcpy(g_LoraRec.m_ServerIP, "localhost");
        strcpy(g_LoraRec.m_ApplicationID, "ApplicationID"); // 设备标识
        strcpy(g_LoraRec.m_szRes1, "res1");                 // 设备类型
        strcpy(g_LoraRec.m_szRes2, "res2");
        strcpy(g_LoraRec.m_szRes3, "res3");
        strcpy(g_LoraRec.m_szRes4, "res4");
}

void init_dxk_para()
{
        memset(&g_DxkRec, 0, sizeof(DXK_REC));
        g_DxkRec.m_ServerPort = 4001;
        g_DxkRec.m_bszTotalNum = 0;

        g_DxkRec.m_dxkNo = 0;
        g_DxkRec.m_UpTxEQTimer = 1800;

        strcpy(g_DxkRec.devSN, "cyycdxk001"); // 设备标识
        strcpy(g_DxkRec.devType, "GCW");      // 设备类型
        strcpy(g_DxkRec.devName, "dixianku");
        strcpy(g_DxkRec.mfginfo, "cygc");
        strcpy(g_DxkRec.hardVersion, "hw v1.0");
        strcpy(g_DxkRec.m_ServerIP, "192.168.1.100");
}

void init_mqttclient_para()
{
        memset(&g_MqttClientRec, 0, sizeof(MQTTCLIENT_REC));
        g_MqttClientRec.m_ifSSL = 0;

        strcpy(g_MqttClientRec.m_ServerIP, "192.168.1.100");
        g_MqttClientRec.m_ServerPort = 1883;

        strcpy(g_MqttClientRec.caFile, "ca.pem");
        strcpy(g_MqttClientRec.ClientCertificateFile, "client.pem");
        strcpy(g_MqttClientRec.ClientkeyFile, "client.key");
}

int read_lora_para_file()
{
        int nReadSize;
        int nResult = 0;
        char szFileName[256];
        // sprintf(szFileName,"%s/dx/%s",A40I_CCU_CONF_HBDX, DX_LORA_FILENAME);
        sprintf(szFileName, "%s", "/home/tiger/Desktop/code/vscode/demo/c/lorapara.dat");

        char *szFile = szFileName;
        FILE *fp = fopen(szFile, "rb");
        if (!fp)
        {
                return -1;
        }
        DX_FILE_HEAD hd;
        memset(&hd, 0, sizeof(DX_FILE_HEAD));
        nReadSize = fread(&hd, sizeof(unsigned char), sizeof(DX_FILE_HEAD), fp);

        if (nReadSize == sizeof(DX_FILE_HEAD))
        {                
                int nCount = hd.m_PointsNum;
                printf("%d\n", sizeof(hd));
                if (nCount == 1)
                {
                        LORA_REC st;
                        memset(&st, 0, sizeof(LORA_REC));
                        nReadSize = fread(&st, sizeof(unsigned char), sizeof(st), fp);
                        if (nReadSize == sizeof(st))
                                g_LoraRec = st;
                        else
                        {
                                nResult = -1;
                        }
                }
        }

        fclose(fp);
        return nResult;
}