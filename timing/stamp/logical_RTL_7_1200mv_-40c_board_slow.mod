/*
 Copyright (C) 2017  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and its AMPP partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel MegaCore Function License Agreement, or other 
 applicable license agreement, including, without limitation, 
 that your use is for the sole purpose of programming logic 
 devices manufactured by Intel and sold by Intel or its 
 authorized distributors.  Please refer to the applicable 
 agreement for further details.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part 10M04SCE144I7G
 with speed grade 7, core voltage 1.2V, and temperature -40 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "logical_RTL";
DATE "11/03/2017 14:22:01";
PROGRAM "Quartus Prime";



INPUT RSTn;
INPUT CLK;
INPUT Inv_Pwm_LMTU;
INPUT Inv_Pwm_U;
INPUT Inv_SPICLK;
INPUT Inv_SPISTE;
INPUT Inv_SPISIMO;
INPUT Inv_Pwm_V;
INPUT Inv_Pwm_LMTV;
INPUT Inv_Pwm_W;
INPUT Inv_Pwm_LMTW;
INPUT SER_BUS_RX;
INPUT Rec_SPICLK;
INPUT Rec_SPISTE;
INPUT Rec_SPISIMO;
INPUT IchgP_LMT;
INPUT IchgN_LMT;
INPUT IAP_LMT;
INPUT IAN_LMT;
INPUT IBP_LMT;
INPUT IBN_LMT;
INPUT ICP_LMT;
INPUT ICN_LMT;
INPUT Inv_CrossZero_U;
INPUT Inv_CrossZero_V;
INPUT Inv_CrossZero_W;
INPUT DCBUS_OV;
INPUT EPO;
INPUT Inv_FuseFault;
INPUT Module_Ready;
INPUT Inv_HeatSink_OVTemp;
INPUT AUX_Fault;
INPUT IGBT_Temp_OV;
INPUT Rec_Charger_OVTemp;
INPUT RecCharger_OV;
INPUT Rec_HeatSink_OVTemp;
INPUT Rec_BoostSCR_OVTemp;
INPUT FAN_Fault;
INPUT CHG_Pwm1;
INPUT CHG_Pwm2;
INPUT Rec_Pwm1;
INPUT Rec_Pwm2;
INPUT Rec_Pwm3;
INPUT Rec_Pwm4;
INPUT Rec_Pwm5;
INPUT Rec_Pwm6;
INPUT altera_reserved_tdi;
INPUT altera_reserved_tck;
INPUT altera_reserved_tms;
INPUT Vout_CrossZero;
INPUT Rec_SCIRX;
OUTPUT Inv_Pwm_U1;
OUTPUT Inv_Pwm_U2;
OUTPUT Inv_Pwm_U3;
OUTPUT Inv_Pwm_U4;
OUTPUT Inv_Pwm_V1;
OUTPUT Inv_Pwm_V2;
OUTPUT Inv_Pwm_V3;
OUTPUT Inv_Pwm_V4;
OUTPUT Inv_Pwm_W1;
OUTPUT Inv_Pwm_W2;
OUTPUT Inv_Pwm_W3;
OUTPUT Inv_Pwm_W4;
OUTPUT Inv_SPISOMI;
OUTPUT ModuleOK_LED;
OUTPUT LBS_SYNC;
OUTPUT SER_BUS_TX;
OUTPUT Inv_STS_DR;
OUTPUT Module_Alarm_LED;
OUTPUT Inv_KM_DR;
OUTPUT Rec_SPISOMI;
OUTPUT RecSCR_AP;
OUTPUT RecSCR_AN;
OUTPUT RecSCR_BP;
OUTPUT RecSCR_BN;
OUTPUT RecSCR_CP;
OUTPUT RecSCR_CN;
OUTPUT CHGP_SCR;
OUTPUT CHGN_SCR;
OUTPUT CHGPwm_P;
OUTPUT CHGPwm_N;
OUTPUT FAN_Pwm;
OUTPUT Rec_SCITX;
OUTPUT Rec_Pwm_AP;
OUTPUT Rec_Pwm_AN;
OUTPUT Rec_Pwm_BP;
OUTPUT Rec_Pwm_BN;
OUTPUT Rec_Pwm_CP;
OUTPUT Rec_Pwm_CN;
OUTPUT BAT_SCR;
OUTPUT altera_reserved_tdo;

/*Arc definitions start here*/
pos_AUX_Fault__CLK_20M__setup:		SETUP (POSEDGE) AUX_Fault CLK_20M ;
pos_CHG_Pwm1__CLK_20M__setup:		SETUP (POSEDGE) CHG_Pwm1 CLK_20M ;
pos_CHG_Pwm2__CLK_20M__setup:		SETUP (POSEDGE) CHG_Pwm2 CLK_20M ;
pos_DCBUS_OV__CLK_20M__setup:		SETUP (POSEDGE) DCBUS_OV CLK_20M ;
pos_EPO__CLK_20M__setup:		SETUP (POSEDGE) EPO CLK_20M ;
pos_FAN_Fault__CLK_20M__setup:		SETUP (POSEDGE) FAN_Fault CLK_20M ;
pos_IAN_LMT__CLK_20M__setup:		SETUP (POSEDGE) IAN_LMT CLK_20M ;
pos_IAP_LMT__CLK_20M__setup:		SETUP (POSEDGE) IAP_LMT CLK_20M ;
pos_IBN_LMT__CLK_20M__setup:		SETUP (POSEDGE) IBN_LMT CLK_20M ;
pos_IBP_LMT__CLK_20M__setup:		SETUP (POSEDGE) IBP_LMT CLK_20M ;
pos_ICN_LMT__CLK_20M__setup:		SETUP (POSEDGE) ICN_LMT CLK_20M ;
pos_ICP_LMT__CLK_20M__setup:		SETUP (POSEDGE) ICP_LMT CLK_20M ;
pos_IGBT_Temp_OV__CLK_20M__setup:		SETUP (POSEDGE) IGBT_Temp_OV CLK_20M ;
pos_IchgN_LMT__CLK_20M__setup:		SETUP (POSEDGE) IchgN_LMT CLK_20M ;
pos_IchgP_LMT__CLK_20M__setup:		SETUP (POSEDGE) IchgP_LMT CLK_20M ;
pos_Inv_CrossZero_U__CLK_20M__setup:		SETUP (POSEDGE) Inv_CrossZero_U CLK_20M ;
pos_Inv_CrossZero_V__CLK_20M__setup:		SETUP (POSEDGE) Inv_CrossZero_V CLK_20M ;
pos_Inv_CrossZero_W__CLK_20M__setup:		SETUP (POSEDGE) Inv_CrossZero_W CLK_20M ;
pos_Inv_FuseFault__CLK_20M__setup:		SETUP (POSEDGE) Inv_FuseFault CLK_20M ;
pos_Inv_HeatSink_OVTemp__CLK_20M__setup:		SETUP (POSEDGE) Inv_HeatSink_OVTemp CLK_20M ;
pos_Inv_Pwm_LMTU__CLK_20M__setup:		SETUP (POSEDGE) Inv_Pwm_LMTU CLK_20M ;
pos_Inv_Pwm_LMTV__CLK_20M__setup:		SETUP (POSEDGE) Inv_Pwm_LMTV CLK_20M ;
pos_Inv_Pwm_LMTW__CLK_20M__setup:		SETUP (POSEDGE) Inv_Pwm_LMTW CLK_20M ;
pos_Inv_Pwm_U__CLK_20M__setup:		SETUP (POSEDGE) Inv_Pwm_U CLK_20M ;
pos_Inv_Pwm_V__CLK_20M__setup:		SETUP (POSEDGE) Inv_Pwm_V CLK_20M ;
pos_Inv_Pwm_W__CLK_20M__setup:		SETUP (POSEDGE) Inv_Pwm_W CLK_20M ;
pos_Inv_SPICLK__CLK_20M__setup:		SETUP (POSEDGE) Inv_SPICLK CLK_20M ;
pos_Inv_SPISIMO__CLK_20M__setup:		SETUP (POSEDGE) Inv_SPISIMO CLK_20M ;
pos_Inv_SPISTE__CLK_20M__setup:		SETUP (POSEDGE) Inv_SPISTE CLK_20M ;
pos_Module_Ready__CLK_20M__setup:		SETUP (POSEDGE) Module_Ready CLK_20M ;
pos_RSTn__CLK_20M__setup:		SETUP (POSEDGE) RSTn CLK_20M ;
pos_RecCharger_OV__CLK_20M__setup:		SETUP (POSEDGE) RecCharger_OV CLK_20M ;
pos_Rec_BoostSCR_OVTemp__CLK_20M__setup:		SETUP (POSEDGE) Rec_BoostSCR_OVTemp CLK_20M ;
pos_Rec_Charger_OVTemp__CLK_20M__setup:		SETUP (POSEDGE) Rec_Charger_OVTemp CLK_20M ;
pos_Rec_HeatSink_OVTemp__CLK_20M__setup:		SETUP (POSEDGE) Rec_HeatSink_OVTemp CLK_20M ;
pos_Rec_Pwm1__CLK_20M__setup:		SETUP (POSEDGE) Rec_Pwm1 CLK_20M ;
pos_Rec_Pwm2__CLK_20M__setup:		SETUP (POSEDGE) Rec_Pwm2 CLK_20M ;
pos_Rec_Pwm3__CLK_20M__setup:		SETUP (POSEDGE) Rec_Pwm3 CLK_20M ;
pos_Rec_Pwm4__CLK_20M__setup:		SETUP (POSEDGE) Rec_Pwm4 CLK_20M ;
pos_Rec_Pwm5__CLK_20M__setup:		SETUP (POSEDGE) Rec_Pwm5 CLK_20M ;
pos_Rec_Pwm6__CLK_20M__setup:		SETUP (POSEDGE) Rec_Pwm6 CLK_20M ;
pos_Rec_SPICLK__CLK_20M__setup:		SETUP (POSEDGE) Rec_SPICLK CLK_20M ;
pos_Rec_SPISIMO__CLK_20M__setup:		SETUP (POSEDGE) Rec_SPISIMO CLK_20M ;
pos_Rec_SPISTE__CLK_20M__setup:		SETUP (POSEDGE) Rec_SPISTE CLK_20M ;
pos_SER_BUS_RX__CLK_20M__setup:		SETUP (POSEDGE) SER_BUS_RX CLK_20M ;
pos_altera_reserved_tdi__altera_reserved_tck__setup:		SETUP (POSEDGE) altera_reserved_tdi altera_reserved_tck ;
pos_altera_reserved_tms__altera_reserved_tck__setup:		SETUP (POSEDGE) altera_reserved_tms altera_reserved_tck ;
pos_AUX_Fault__CLK_20M__hold:		HOLD (POSEDGE) AUX_Fault CLK_20M ;
pos_CHG_Pwm1__CLK_20M__hold:		HOLD (POSEDGE) CHG_Pwm1 CLK_20M ;
pos_CHG_Pwm2__CLK_20M__hold:		HOLD (POSEDGE) CHG_Pwm2 CLK_20M ;
pos_DCBUS_OV__CLK_20M__hold:		HOLD (POSEDGE) DCBUS_OV CLK_20M ;
pos_EPO__CLK_20M__hold:		HOLD (POSEDGE) EPO CLK_20M ;
pos_FAN_Fault__CLK_20M__hold:		HOLD (POSEDGE) FAN_Fault CLK_20M ;
pos_IAN_LMT__CLK_20M__hold:		HOLD (POSEDGE) IAN_LMT CLK_20M ;
pos_IAP_LMT__CLK_20M__hold:		HOLD (POSEDGE) IAP_LMT CLK_20M ;
pos_IBN_LMT__CLK_20M__hold:		HOLD (POSEDGE) IBN_LMT CLK_20M ;
pos_IBP_LMT__CLK_20M__hold:		HOLD (POSEDGE) IBP_LMT CLK_20M ;
pos_ICN_LMT__CLK_20M__hold:		HOLD (POSEDGE) ICN_LMT CLK_20M ;
pos_ICP_LMT__CLK_20M__hold:		HOLD (POSEDGE) ICP_LMT CLK_20M ;
pos_IGBT_Temp_OV__CLK_20M__hold:		HOLD (POSEDGE) IGBT_Temp_OV CLK_20M ;
pos_IchgN_LMT__CLK_20M__hold:		HOLD (POSEDGE) IchgN_LMT CLK_20M ;
pos_IchgP_LMT__CLK_20M__hold:		HOLD (POSEDGE) IchgP_LMT CLK_20M ;
pos_Inv_CrossZero_U__CLK_20M__hold:		HOLD (POSEDGE) Inv_CrossZero_U CLK_20M ;
pos_Inv_CrossZero_V__CLK_20M__hold:		HOLD (POSEDGE) Inv_CrossZero_V CLK_20M ;
pos_Inv_CrossZero_W__CLK_20M__hold:		HOLD (POSEDGE) Inv_CrossZero_W CLK_20M ;
pos_Inv_FuseFault__CLK_20M__hold:		HOLD (POSEDGE) Inv_FuseFault CLK_20M ;
pos_Inv_HeatSink_OVTemp__CLK_20M__hold:		HOLD (POSEDGE) Inv_HeatSink_OVTemp CLK_20M ;
pos_Inv_Pwm_LMTU__CLK_20M__hold:		HOLD (POSEDGE) Inv_Pwm_LMTU CLK_20M ;
pos_Inv_Pwm_LMTV__CLK_20M__hold:		HOLD (POSEDGE) Inv_Pwm_LMTV CLK_20M ;
pos_Inv_Pwm_LMTW__CLK_20M__hold:		HOLD (POSEDGE) Inv_Pwm_LMTW CLK_20M ;
pos_Inv_Pwm_U__CLK_20M__hold:		HOLD (POSEDGE) Inv_Pwm_U CLK_20M ;
pos_Inv_Pwm_V__CLK_20M__hold:		HOLD (POSEDGE) Inv_Pwm_V CLK_20M ;
pos_Inv_Pwm_W__CLK_20M__hold:		HOLD (POSEDGE) Inv_Pwm_W CLK_20M ;
pos_Inv_SPICLK__CLK_20M__hold:		HOLD (POSEDGE) Inv_SPICLK CLK_20M ;
pos_Inv_SPISIMO__CLK_20M__hold:		HOLD (POSEDGE) Inv_SPISIMO CLK_20M ;
pos_Inv_SPISTE__CLK_20M__hold:		HOLD (POSEDGE) Inv_SPISTE CLK_20M ;
pos_Module_Ready__CLK_20M__hold:		HOLD (POSEDGE) Module_Ready CLK_20M ;
pos_RSTn__CLK_20M__hold:		HOLD (POSEDGE) RSTn CLK_20M ;
pos_RecCharger_OV__CLK_20M__hold:		HOLD (POSEDGE) RecCharger_OV CLK_20M ;
pos_Rec_BoostSCR_OVTemp__CLK_20M__hold:		HOLD (POSEDGE) Rec_BoostSCR_OVTemp CLK_20M ;
pos_Rec_Charger_OVTemp__CLK_20M__hold:		HOLD (POSEDGE) Rec_Charger_OVTemp CLK_20M ;
pos_Rec_HeatSink_OVTemp__CLK_20M__hold:		HOLD (POSEDGE) Rec_HeatSink_OVTemp CLK_20M ;
pos_Rec_Pwm1__CLK_20M__hold:		HOLD (POSEDGE) Rec_Pwm1 CLK_20M ;
pos_Rec_Pwm2__CLK_20M__hold:		HOLD (POSEDGE) Rec_Pwm2 CLK_20M ;
pos_Rec_Pwm3__CLK_20M__hold:		HOLD (POSEDGE) Rec_Pwm3 CLK_20M ;
pos_Rec_Pwm4__CLK_20M__hold:		HOLD (POSEDGE) Rec_Pwm4 CLK_20M ;
pos_Rec_Pwm5__CLK_20M__hold:		HOLD (POSEDGE) Rec_Pwm5 CLK_20M ;
pos_Rec_Pwm6__CLK_20M__hold:		HOLD (POSEDGE) Rec_Pwm6 CLK_20M ;
pos_Rec_SPICLK__CLK_20M__hold:		HOLD (POSEDGE) Rec_SPICLK CLK_20M ;
pos_Rec_SPISIMO__CLK_20M__hold:		HOLD (POSEDGE) Rec_SPISIMO CLK_20M ;
pos_Rec_SPISTE__CLK_20M__hold:		HOLD (POSEDGE) Rec_SPISTE CLK_20M ;
pos_SER_BUS_RX__CLK_20M__hold:		HOLD (POSEDGE) SER_BUS_RX CLK_20M ;
pos_altera_reserved_tdi__altera_reserved_tck__hold:		HOLD (POSEDGE) altera_reserved_tdi altera_reserved_tck ;
pos_altera_reserved_tms__altera_reserved_tck__hold:		HOLD (POSEDGE) altera_reserved_tms altera_reserved_tck ;
pos_CLK_20M__BAT_SCR__delay:		DELAY (POSEDGE) CLK_20M BAT_SCR ;
pos_CLK_20M__CHGN_SCR__delay:		DELAY (POSEDGE) CLK_20M CHGN_SCR ;
pos_CLK_20M__CHGP_SCR__delay:		DELAY (POSEDGE) CLK_20M CHGP_SCR ;
pos_CLK_20M__CHGPwm_N__delay:		DELAY (POSEDGE) CLK_20M CHGPwm_N ;
pos_CLK_20M__CHGPwm_P__delay:		DELAY (POSEDGE) CLK_20M CHGPwm_P ;
pos_CLK_20M__FAN_Pwm__delay:		DELAY (POSEDGE) CLK_20M FAN_Pwm ;
pos_CLK_20M__Inv_KM_DR__delay:		DELAY (POSEDGE) CLK_20M Inv_KM_DR ;
pos_CLK_20M__Inv_Pwm_U1__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_U1 ;
pos_CLK_20M__Inv_Pwm_U2__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_U2 ;
pos_CLK_20M__Inv_Pwm_U3__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_U3 ;
pos_CLK_20M__Inv_Pwm_U4__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_U4 ;
pos_CLK_20M__Inv_Pwm_V1__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_V1 ;
pos_CLK_20M__Inv_Pwm_V2__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_V2 ;
pos_CLK_20M__Inv_Pwm_V3__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_V3 ;
pos_CLK_20M__Inv_Pwm_V4__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_V4 ;
pos_CLK_20M__Inv_Pwm_W1__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_W1 ;
pos_CLK_20M__Inv_Pwm_W2__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_W2 ;
pos_CLK_20M__Inv_Pwm_W3__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_W3 ;
pos_CLK_20M__Inv_Pwm_W4__delay:		DELAY (POSEDGE) CLK_20M Inv_Pwm_W4 ;
pos_CLK_20M__Inv_SPISOMI__delay:		DELAY (POSEDGE) CLK_20M Inv_SPISOMI ;
pos_CLK_20M__Inv_STS_DR__delay:		DELAY (POSEDGE) CLK_20M Inv_STS_DR ;
pos_CLK_20M__ModuleOK_LED__delay:		DELAY (POSEDGE) CLK_20M ModuleOK_LED ;
pos_CLK_20M__Module_Alarm_LED__delay:		DELAY (POSEDGE) CLK_20M Module_Alarm_LED ;
pos_CLK_20M__RecSCR_AN__delay:		DELAY (POSEDGE) CLK_20M RecSCR_AN ;
pos_CLK_20M__RecSCR_AP__delay:		DELAY (POSEDGE) CLK_20M RecSCR_AP ;
pos_CLK_20M__RecSCR_BN__delay:		DELAY (POSEDGE) CLK_20M RecSCR_BN ;
pos_CLK_20M__RecSCR_BP__delay:		DELAY (POSEDGE) CLK_20M RecSCR_BP ;
pos_CLK_20M__RecSCR_CN__delay:		DELAY (POSEDGE) CLK_20M RecSCR_CN ;
pos_CLK_20M__RecSCR_CP__delay:		DELAY (POSEDGE) CLK_20M RecSCR_CP ;
pos_CLK_20M__Rec_Pwm_AN__delay:		DELAY (POSEDGE) CLK_20M Rec_Pwm_AN ;
pos_CLK_20M__Rec_Pwm_AP__delay:		DELAY (POSEDGE) CLK_20M Rec_Pwm_AP ;
pos_CLK_20M__Rec_Pwm_BN__delay:		DELAY (POSEDGE) CLK_20M Rec_Pwm_BN ;
pos_CLK_20M__Rec_Pwm_BP__delay:		DELAY (POSEDGE) CLK_20M Rec_Pwm_BP ;
pos_CLK_20M__Rec_Pwm_CN__delay:		DELAY (POSEDGE) CLK_20M Rec_Pwm_CN ;
pos_CLK_20M__Rec_Pwm_CP__delay:		DELAY (POSEDGE) CLK_20M Rec_Pwm_CP ;
pos_CLK_20M__Rec_SPISOMI__delay:		DELAY (POSEDGE) CLK_20M Rec_SPISOMI ;
pos_CLK_20M__SER_BUS_TX__delay:		DELAY (POSEDGE) CLK_20M SER_BUS_TX ;
pos_altera_reserved_tck__altera_reserved_tdo__delay:		DELAY (POSEDGE) altera_reserved_tck altera_reserved_tdo ;

ENDMODEL
