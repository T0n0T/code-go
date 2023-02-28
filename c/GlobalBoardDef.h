#ifndef _Global_Board_Def_H
#define _Global_Board_Def_H

//板类型定义
//===================================================
// 成都英利(Emlinix) arm em9460
// 成都英利(Emlinix) arm em9280
// 成都英利(Emlinix) arm em335x

#define ARM_BOARD_EMLINIX  //定义 成都英利(Emlinix)的ARM 核心板

 //   #define EM_BOARD_9280      //9280板卡
//    #define EM_BOARD_9280_D    //调试板卡

 //   #define EM_BOARD_9460    //9460板卡
 //   #define EM_BOARD_9460_D    //调试板卡

  //    #define EM_BOARD_335X    //EM335X?忨
 //   #define EM_BOARD_335X_D    //EM335X????忨

  #define ESM_BOARD_6800   1 //EM335X?忨
 //   #define ESM_BOARD_6800_D    //EM335X????忨
//===================================================
// ??????   arm vds400???
//#define    EM_BOARD_VDS400
//===================================================
// ???????          -  SBS pc104
// ???????        -  SNK pc104
//#define    EM_BOARD_PC104
//#define    EM_BOARD_SBS_PC104
//#define    EM_BOARD_SNK_PC104
//===================================================
//A40I-ccu
#define    A40I_CCU       "/A40I/ccu"
#define    A40I_CCU_BIN   "/A40I/ccu/bin"
#define    A40I_CCU_CONF  "/A40I/ccu/conf"
#define    A40I_CCU_DLL   "/A40I/ccu/dll"
#define    A40I_CCU_RUN   "/A40I/ccu/run"
#define    A40I_CCU_LOG   "/A40I/ccu/log"
#define    A40I_CCU_LIB   "/A40I/ccu/lib"
#define    A40I_CCU_CONF_HBDX  "/A40I/ccu/conf/hbdx"
#define    A40I_CCU_CONF_SCMU   "/A40I/ccu/conf/scmu"
#define    A40I_CCU_CONF_WXDX  "/A40I/ccu/conf/wxdx"
//==================================================================
//??????????? ?ж?????·??

#if (   ( defined EM_BOARD_9280 ) || ( defined EM_BOARD_9280_D ) )
    #define    SYSFILE_RUN_DIR   BOARD_DEF_EM9280_DIR
#endif

#if (  ( defined EM_BOARD_9460 )  || ( defined EM_BOARD_9460_D ) )
    #define    SYSFILE_RUN_DIR   BOARD_DEF_EM9460_DIR
#endif

#if (  ( defined EM_BOARD_335X )  || ( defined EM_BOARD_335X_D ) )
    #define    SYSFILE_RUN_DIR   BOARD_DEF_EM335X_DIR
#endif

//===================================================
#ifdef EM_BOARD_VDS400
    #define    SYSFILE_RUN_DIR   BOARD_DEF_vds400_DIR
#endif

#ifdef EM_BOARD_VDS400
    #define    SYSFILE_RUN_DIR   BOARD_DEF_PC104_DIR
#endif
//==================================================================
//?????
//EM_BOARD_9XXX ?????
//EM_BOARD_335X ?????
 #define	WATCHDOG_IOCTL_BASE	'W'
 #define	WDIOC_KEEPALIVE		_IOR(WATCHDOG_IOCTL_BASE, 5, int)
 #define    WDIOC_SETTIMEOUT _IOWR(WATCHDOG_IOCTL_BASE, 6, int)
//==================================================================

//=============================================================EMLINIX BOARD Start def ================================================
    #ifdef ARM_BOARD_EMLINIX
        //==================================================================
        //BOARD_9280D (??????)????
        #ifdef EM_BOARD_9280_D

            # define    EM9280_BEEP_LED  GPIO0
            # define    EM9280_RUN_LED   GPIO1

            #define    Emlinix_GPIO_DEV_STR    EM9280_GPIO_DEV_STR
            #define    Emlinix_BEEP_LED        EM9280_BEEP_LED
            #define    Emlinix_RUN_LED         EM9280_RUN_LED

        #endif
        //==================================================================
        //BOARD_9280 (?????)????
        #ifdef EM_BOARD_9280

            # define    EM9280_BEEP_LED  GPIO13
            # define    EM9280_RUN_LED   GPIO12

            #define    Emlinix_GPIO_DEV_STR    EM9280_GPIO_DEV_STR
            #define    Emlinix_BEEP_LED        EM9280_BEEP_LED
            #define    Emlinix_RUN_LED         EM9280_RUN_LED

        #endif

        //==================================================================
        //BOARD_9460_D (??????)????
        #ifdef EM_BOARD_9460_D

            # define    EM9460_BEEP_LED  GPIO9
            # define    EM9460_RUN_LED   GPIO8

            #define    Emlinix_GPIO_DEV_STR    EM9460_GPIO_DEV_STR
            #define    Emlinix_BEEP_LED        EM9460_BEEP_LED
            #define    Emlinix_RUN_LED         EM9460_RUN_LED

        #endif

        //==================================================================
        //BOARD_9460 (?????)????
        #ifdef EM_BOARD_9460

            # define    EM9460_BEEP_LED  GPIO9
            # define    EM9460_RUN_LED   GPIO8

            #define    Emlinix_GPIO_DEV_STR    EM9460_GPIO_DEV_STR
            #define    Emlinix_BEEP_LED        EM9460_BEEP_LED
            #define    Emlinix_RUN_LED         EM9460_RUN_LED

        #endif





    #endif
//=============================================================EMLINIX BOARD Start def ================================================
#endif
