// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.
//	data:2017/09/30		just for fun
module logical_RTL
(
	CLK,RSTn,
	//INV
	Inv_Pwm_U,Inv_Pwm_V,Inv_Pwm_W,
	Inv_CrossZero_U,Inv_CrossZero_V,Inv_CrossZero_W,
	Inv_Pwm_U1,Inv_Pwm_U2,Inv_Pwm_U3,Inv_Pwm_U4,
	Inv_Pwm_V1,Inv_Pwm_V2,Inv_Pwm_V3,Inv_Pwm_V4,	
	Inv_Pwm_W1,Inv_Pwm_W2,Inv_Pwm_W3,Inv_Pwm_W4,
	Inv_SPISOMI,Inv_SPISIMO,Inv_SPICLK,Inv_SPISTE,
	ModuleOK_LED,IGBT_Temp_OV,Module_Ready,LBS_SYNC,
	EPO,SER_BUS_TX,SER_BUS_RX,AUX_Fault,Inv_STS_DR,
	Module_Alarm_LED,Inv_KM_DR,Inv_HeatSink_OVTemp,
	Inv_FuseFault,Inv_Pwm_LMTU,Inv_Pwm_LMTV,Inv_Pwm_LMTW,
	Vout_CrossZero,
	//REC
	IchgN_LMT,IchgP_LMT,Rec_HeatSink_OVTemp,Rec_BoostSCR_OVTemp,Rec_Charger_OVTemp,
	Rec_SPICLK,Rec_SPISTE,Rec_SPISOMI,Rec_SPISIMO,
	RecSCR_AP,RecSCR_AN,RecSCR_BP,RecSCR_BN,RecSCR_CP,RecSCR_CN,
	RecCharger_OV,FAN_Fault,CHGP_SCR,CHGN_SCR,
	CHG_Pwm1,CHG_Pwm2,CHGPwm_P,CHGPwm_N,FAN_Pwm,Rec_SCIRX,Rec_SCITX,
	Rec_Pwm1,Rec_Pwm2,Rec_Pwm3,Rec_Pwm4,Rec_Pwm5,Rec_Pwm6,
	Rec_Pwm_AP,Rec_Pwm_AN,Rec_Pwm_BP,Rec_Pwm_BN,Rec_Pwm_CP,Rec_Pwm_CN,
	IAP_LMT,IAN_LMT,IBP_LMT,IBN_LMT,ICP_LMT,ICN_LMT,
	DCBUS_OV,BAT_SCR
);
	


	input	CLK;
	input	RSTn;
/************INV*************/	
	input	Inv_Pwm_U;
	input	Inv_Pwm_V;
	input	Inv_Pwm_W;
	
	input	Inv_CrossZero_U;
	input	Inv_CrossZero_V;
	input	Inv_CrossZero_W;
	
	input	Inv_SPICLK;
	input	Inv_SPISTE;
	input	Inv_SPISIMO;
	output	Inv_SPISOMI;

	input	Inv_Pwm_LMTU;
	input	Inv_Pwm_LMTV;
	input	Inv_Pwm_LMTW;
	
	input	Vout_CrossZero;
		
	input	IGBT_Temp_OV;
	input	Inv_HeatSink_OVTemp;	
	input	Module_Ready;

	input	EPO;

	input	Inv_FuseFault;
	input	AUX_Fault;
	
	output	Inv_Pwm_U1;
	output	Inv_Pwm_U2;
	output	Inv_Pwm_U3;
	output	Inv_Pwm_U4;
	
	output	Inv_Pwm_V1;
	output	Inv_Pwm_V2;
	output	Inv_Pwm_V3;
	output	Inv_Pwm_V4;
	
	output	Inv_Pwm_W1;
	output	Inv_Pwm_W2;
	output	Inv_Pwm_W3;
	output	Inv_Pwm_W4;


	output	LBS_SYNC;
	
	
	input	SER_BUS_RX;
	output	SER_BUS_TX;
	
	output	Inv_KM_DR;
	output	Inv_STS_DR;
	
	output	Module_Alarm_LED;
	output	ModuleOK_LED;
/*************REC**********************/
	input	IchgP_LMT;
	input	IchgN_LMT;
	
	input	Rec_HeatSink_OVTemp;
	input	Rec_BoostSCR_OVTemp;
	input	Rec_Charger_OVTemp;
	input	RecCharger_OV;
	input	FAN_Fault;
	
	input	Rec_SPICLK;
	input	Rec_SPISTE;
	input	Rec_SPISIMO;
	output	Rec_SPISOMI;
	
	input	CHG_Pwm1;
	input	CHG_Pwm2;
	
	input	Rec_Pwm1;
	input	Rec_Pwm2;
	input	Rec_Pwm3;
	input	Rec_Pwm4;
	input	Rec_Pwm5;
	input	Rec_Pwm6;
	
	input	IAP_LMT;
	input	IAN_LMT;
	input	IBP_LMT;
	input	IBN_LMT;
	input	ICP_LMT;
	input	ICN_LMT;
	
	input	DCBUS_OV;

	output	RecSCR_AP;
	output	RecSCR_AN;
	output	RecSCR_BP;
	output	RecSCR_BN;
	output	RecSCR_CP;
	output	RecSCR_CN;
	output	BAT_SCR;
	output	CHGP_SCR;
	output	CHGN_SCR;
	
	output	CHGPwm_P;
	output	CHGPwm_N;
	
	output	FAN_Pwm;
	
	output	Rec_SCITX;
	input	Rec_SCIRX;
	
	
	output	Rec_Pwm_AP;
	output	Rec_Pwm_AN;
	output	Rec_Pwm_BP;
	output	Rec_Pwm_BN;
	output	Rec_Pwm_CP;
	output	Rec_Pwm_CN;


	initial
		begin
			mpu_func = 2'b01;
			mpu_version = 4'b0000;
			mpu_configdown = 1'b1;
		end
/*********************Clock Process module invoking***************/
	wire		clk_1;
	wire		clk_100;
	wire		clk_500;
	wire		pll_locked;
	Clock_Process	generate_100M_clock
	(
		.inclk0(CLK),
		.areset(~RSTn),
		.c0(clk_100),
		.c1(clk_500),
		.c2(clk_1),
		.locked(pll_locked)
	);

/***Phase A	Pwm Process***/

	
	pwm_deal_frominvdsp	INV_U
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.InvPwm_En(invpwmen),
		.Inv_Pwm_X(Inv_Pwm_U),
		.Inv_CrossZero_X(Inv_CrossZero_U),
		.Inv_Pwm_LMTX(Inv_Pwm_LMTU),
		.Inv_Pwm_X1(Inv_Pwm_U1),
		.Inv_Pwm_X2(Inv_Pwm_U2),
		.Inv_Pwm_X3(Inv_Pwm_U3),
		.Inv_Pwm_X4(Inv_Pwm_U4)
	);
	
/***Phase B	Pwm Process***/	

	
	pwm_deal_frominvdsp	INV_V
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.InvPwm_En(invpwmen),
		.Inv_Pwm_X(Inv_Pwm_V),
		.Inv_CrossZero_X(Inv_CrossZero_V),
		.Inv_Pwm_LMTX(Inv_Pwm_LMTV),
		.Inv_Pwm_X1(Inv_Pwm_V1),
		.Inv_Pwm_X2(Inv_Pwm_V2),
		.Inv_Pwm_X3(Inv_Pwm_V3),
		.Inv_Pwm_X4(Inv_Pwm_V4)
	);
	
	
/***Phase C	Pwm Process***/	

	
	pwm_deal_frominvdsp	INV_W
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.InvPwm_En(invpwmen),
		.Inv_Pwm_X(Inv_Pwm_W),
		.Inv_CrossZero_X(Inv_CrossZero_W),
		.Inv_Pwm_LMTX(Inv_Pwm_LMTW),
		.Inv_Pwm_X1(Inv_Pwm_W1),
		.Inv_Pwm_X2(Inv_Pwm_W2),
		.Inv_Pwm_X3(Inv_Pwm_W3),
		.Inv_Pwm_X4(Inv_Pwm_W4)
	);


/**************REC PWM	Process****************/

	Pwm_Process_From_RECDSP	REC_A
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.PwmEn(boostpwmen),
		.Pwm1(Rec_Pwm1),
		.Pwm2(Rec_Pwm2),
		.IP_LMT(IAP_LMT),
		.IN_LMT(IAN_LMT),
		.Pwm_P(Rec_Pwm_AP),
		.Pwm_N(Rec_Pwm_AN)
	);


	Pwm_Process_From_RECDSP	REC_B
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.PwmEn(boostpwmen),
		.Pwm1(Rec_Pwm3),
		.Pwm2(Rec_Pwm4),
		.IP_LMT(IBP_LMT),
		.IN_LMT(IBN_LMT),
		.Pwm_P(Rec_Pwm_BP),
		.Pwm_N(Rec_Pwm_BN)
	);


	Pwm_Process_From_RECDSP	REC_C
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.PwmEn(boostpwmen),
		.Pwm1(Rec_Pwm5),
		.Pwm2(Rec_Pwm6),
		.IP_LMT(ICP_LMT),
		.IN_LMT(ICN_LMT),
		.Pwm_P(Rec_Pwm_CP),
		.Pwm_N(Rec_Pwm_CN)
	);

	
/************Charger PWM Process***************/

	Pwm_Process_From_RECDSP	CHG
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.PwmEn(chgpwmen),
		.Pwm1(CHG_Pwm1),
		.Pwm2(CHG_Pwm2),
		.IP_LMT(IchgP_LMT),
		.IN_LMT(IchgN_LMT),
		.Pwm_P(CHGPwm_P),
		.Pwm_N(CHGPwm_N)
	);










/**************Inv signal from dsp******************/
	wire	inv_on;
	wire	invpwmen;
	wire	invtorec_relax_command;
	wire	[15:0] inv_data_in1;

	assign	invpwmen 	= inv_data_in1[0];
	assign	Inv_KM_DR	= inv_data_in1[1];
	assign	Inv_STS_DR	= inv_data_in1[2];
	assign	invtorec_relax_command = inv_data_in1[3];
	assign	inv_on		= inv_data_in1[4];
	assign	Module_Alarm_LED = inv_data_in1[5];
	assign	ModuleOK_LED = inv_data_in1[6];

	wire	[7:0] macid;
	wire	imc_enable;
	wire	[1:0] lbs_status;
	wire	[15:0] inv_data_in2;

	assign	macid = inv_data_in2[7:0];
	assign	imc_enable = inv_data_in2[11];
	assign	lbs_status = inv_data_in2[13:12];
	
	wire	inv_over_load;
	wire	system_unlock;
	wire	inv_on_standby;
	wire	inv_bp_status;
	wire	master_online;
	wire	module_online;
	wire	bpscr;
	wire	[15:0] inv_data_in3;

	assign	inv_over_load = inv_data_in3[0];
	assign	system_unlock = inv_data_in3[1];
	assign	inv_on_standby = inv_data_in3[2];
	assign	inv_bp_status = inv_data_in3[3];
	assign	master_online = inv_data_in3[4];
	assign	module_online  = inv_data_in3[5];
	assign	bpscr		  = inv_data_in3[13];


/**************************Inv signal to dsp********************/
	wire	q5;
	wire	q3bp;
//	wire	bp_fb_detect;
	wire	bpscr_frombp;
	wire	[15:0] inv_data_out1;
	
	assign	inv_data_out1[0] = AUX_Fault;
	assign	inv_data_out1[1] = IGBT_Temp_OV;
	assign	inv_data_out1[2] = DCBUS_OV;
	assign	inv_data_out1[3] = EPO;
	assign	inv_data_out1[4] = Inv_FuseFault;
	assign	inv_data_out1[5] = Module_Ready;
	assign	inv_data_out1[6] = Inv_HeatSink_OVTemp;
	assign	inv_data_out1[7] = rec_off;
	assign	inv_data_out1[8] = q5;
	assign	inv_data_out1[9] = q3bp;
	assign	inv_data_out1[10] = bp_fb_detect_f;
	assign	inv_data_out1[11] = inv_auto_on;
	assign	inv_data_out1[12] = bpscr_frombp;
	assign	inv_data_out1[13] = 1'b0;
	assign	inv_data_out1[14] = 1'b0;
	assign	inv_data_out1[15] = 1'b0;
	
	wire	[15:0] inv_data_out2;
	
	assign	inv_data_out2[1:0] = mpu_func;
	assign	inv_data_out2[5:2] = mpu_version;
	assign	inv_data_out2[6] = mpu_configdown;
	assign	inv_data_out2[13:7] = 7'b0000000;
	assign	inv_data_out2[15:14] = 2'b01;
	
	wire	[7:0] MACID_F;
	wire	[15:0] inv_data_out3;
	
	assign	inv_data_out3[7:0] = MACID_F;
	assign	inv_data_out3[15:14] = 2'b10;

	wire	inv_over_load_f;
	wire	system_unlock_f;
	wire	inv_on_standby_f;
	wire	inv_bp_status_f;
	wire	master_online_f;
	wire	leader_rack_f;
	wire	bp_fb_detect_f;
	wire	bpscr_f;
	wire	[15:0] inv_data_out4;
	
	assign	inv_data_out4[0] = inv_over_load_f;
	assign	inv_data_out4[1] = system_unlock_f;
	assign	inv_data_out4[2] = inv_on_standby_f;
	assign	inv_data_out4[3] = inv_bp_status_f;
	assign	inv_data_out4[4] = master_online_f;
	assign	inv_data_out4[5] = leader_rack_f;
	assign	inv_data_out4[6] = 1'b0;
	assign	inv_data_out4[7] = 1'b0;
	assign	inv_data_out4[8] = 1'b0;
	assign	inv_data_out4[9] = 1'b0;
	assign	inv_data_out4[10] = 1'b0;
	assign	inv_data_out4[11] = 1'b0;
	assign	inv_data_out4[12] = bp_fb_detect_f;
	assign	inv_data_out4[13] = bpscr_f;
	assign	inv_data_out4[14] = 1'b1;
	assign	inv_data_out4[15] = 1'b1;



	inv_spi_process	inv_spi_signal
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
	
		.Inv_SPICLK(Inv_SPICLK),
		.Inv_SPISIMO(Inv_SPISIMO),
		.Inv_SPISOMI(Inv_SPISOMI),
		.Inv_SPISTE(Inv_SPISTE),
		
		.inv_data_out1(inv_data_out1),
		.inv_data_out2(inv_data_out2),
		.inv_data_out3(inv_data_out3),
		.inv_data_out4(inv_data_out4),
		
		.inv_data_in1(inv_data_in1),
		.inv_data_in2(inv_data_in2),
		.inv_data_in3(inv_data_in3)
	);






/********************from recdsp*******************************/	
	wire	chgpwmen;
	wire	boostpwmen;
	wire	[15:0] rec_data_in1;	//from rec dsp data in 1
	
	assign	RecSCR_AP = rec_data_in1[0];
	assign	RecSCR_AN = rec_data_in1[1];
	assign	RecSCR_BP = rec_data_in1[2];
	assign	RecSCR_BN = rec_data_in1[3];
	assign	RecSCR_CP = rec_data_in1[4];
	assign	RecSCR_CN = rec_data_in1[5];
	assign	BAT_SCR   = rec_data_in1[6];
	assign	CHGN_SCR  = rec_data_in1[7];
	assign	CHGP_SCR  = rec_data_in1[8];
	assign	chgpwmen  = rec_data_in1[9];
	assign	boostpwmen = rec_data_in1[10];
	
	wire	rec_off;				//bit 0
	wire	[1:0] rec_runstatus;	//bit 1-2
	wire	fanmanu_en;				//bit 4
	wire	[3:0] fanmanu_duty;		//bit 5-8
	wire	[2:0] fanspeed;			//bit 9-11
	wire	inv_auto_on;			//bit 12
	wire	[15:0] rec_data_in2;	//from rec dsp data in 2

	assign	rec_off 	  = rec_data_in2[0];
	assign	rec_runstatus = rec_data_in2[2:1];
	assign	fanmanu_en	  = rec_data_in2[4];
	assign	fanmanu_duty  = rec_data_in2[8:5];
	assign	fanspeed	  = rec_data_in2[11:9];
	assign	inv_auto_on	  = rec_data_in2[12];




/****************************to recdsp******************************/
	wire	[15:0] rec_data_out1;

	assign	rec_data_out1[0] = AUX_Fault;
	assign	rec_data_out1[1] = IGBT_Temp_OV;
	assign	rec_data_out1[2] = DCBUS_OV;
	assign	rec_data_out1[3] = EPO;
	assign	rec_data_out1[4] = Rec_Charger_OVTemp;
	assign	rec_data_out1[5] = Module_Ready;
	assign	rec_data_out1[6] = RecCharger_OV;
	assign	rec_data_out1[7] = Rec_HeatSink_OVTemp;
	assign	rec_data_out1[8] = FAN_Fault;
	assign	rec_data_out1[9] = Rec_BoostSCR_OVTemp;
	assign	rec_data_out1[10] = 1'b0;//Inv_HeatSink_OVTemp;
	assign	rec_data_out1[11] = 1'b0;
	assign	rec_data_out1[12] = 1'b0;
	assign	rec_data_out1[13] = 1'b0;
	assign	rec_data_out1[14] = 1'b1;
	assign	rec_data_out1[15] = 1'b0;

	reg		[1:0] mpu_func;
	reg		[3:0] mpu_version;
	reg		mpu_configdown;
	wire	[15:0] rec_data_out2;

	assign	rec_data_out2[1:0] = mpu_func;
	assign	rec_data_out2[5:2] = mpu_version;
	assign	rec_data_out2[6] = mpu_configdown;
	assign	rec_data_out2[7] = inv_on;
	assign	rec_data_out2[8] = invtorec_relax_command;
	assign	rec_data_out2[9] = 1'b0;
	assign	rec_data_out2[10] = 1'b0;
	assign	rec_data_out2[11] = 1'b0;
	assign	rec_data_out2[12] = 1'b0;
	assign	rec_data_out2[13] = 1'b0;
	assign	rec_data_out2[14] = 1'b0;
	assign	rec_data_out2[15] = 1'b1;


	rec_spi_process	rec_spi_signal
	(
		.clk_100(clk_100),
		.RSTn(RSTn),

		.Rec_SPICLK(Rec_SPICLK),
		.Rec_SPISIMO(Rec_SPISIMO),
		.Rec_SPISOMI(Rec_SPISOMI),
		.Rec_SPISTE(Rec_SPISTE),

		.rec_data_in1(rec_data_in1),
		.rec_data_in2(rec_data_in2),
		.rec_data_out1(rec_data_out1),
		.rec_data_out2(rec_data_out2)
	);
	




/******************fan pwm process invoking*********************/
	fan_pwm_process	fan_pwmdo
	(
		.CLK(CLK),
		.RSTn(RSTn),
		.fanmanu_en(fanmanu_en),
		.fanmanu_duty(fanmanu_duty),
		.fanspeed(fanspeed),
		.fan_pwm(FAN_Pwm)
	);



	wire	[31:0]	From_IMC_Bus_Data1;

	assign	MACID_F[4:0] = From_IMC_Bus_Data1[4:0];
	assign	MACID_F[7:5] = From_IMC_Bus_Data1[8:6];
	assign	inv_over_load_f = From_IMC_Bus_Data1[16];
	assign	system_unlock_f = From_IMC_Bus_Data1[17];
	assign	inv_on_standby_f = From_IMC_Bus_Data1[18];
	assign	inv_bp_status_f = From_IMC_Bus_Data1[19];
	assign	master_online_f = From_IMC_Bus_Data1[20];
	
	assign	leader_rack_f = From_IMC_Bus_Data1[23];
	assign	bp_fb_detect_f = From_IMC_Bus_Data1[24];
	assign	bpscr_f = From_IMC_Bus_Data1[25];
	assign	q3bp = From_IMC_Bus_Data1[26];
	assign	q5 = From_IMC_Bus_Data1[28];
	assign	bpscr_frombp = From_IMC_Bus_Data1[29];		
	
	wire	[31:0]	To_IMC_Bus_Data1;
//	assign	To_IMC_Bus_Data1 = 32'd1431655765;
//bit	5,11,15,21,27,31	=   0
	assign	To_IMC_Bus_Data1[4:0] = macid[4:0];
	assign	To_IMC_Bus_Data1[5] = 1'b0;			//padding bit
	assign	To_IMC_Bus_Data1[8:6] = macid[7:5];
	assign	To_IMC_Bus_Data1[10:9] = 2'b00;
	assign	To_IMC_Bus_Data1[11] = 1'b0;		//padding bit
	assign	To_IMC_Bus_Data1[14:12] = 3'b000;
	assign	To_IMC_Bus_Data1[15] = 1'b0;		//padding bit
	assign	To_IMC_Bus_Data1[16] = inv_over_load;
	assign	To_IMC_Bus_Data1[17] = system_unlock;
	assign	To_IMC_Bus_Data1[18] = inv_on_standby;
	assign	To_IMC_Bus_Data1[19] = inv_bp_status;
	assign	To_IMC_Bus_Data1[20] = master_online;
	assign	To_IMC_Bus_Data1[21] = 1'b0;		//padding bit
	assign	To_IMC_Bus_Data1[22] = module_online;
	assign	To_IMC_Bus_Data1[24:23] = 2'b00;
	assign	To_IMC_Bus_Data1[25] = bpscr;
	assign	To_IMC_Bus_Data1[26] = 1'b0;
	assign	To_IMC_Bus_Data1[27] = 1'b0;		//padding bit
	assign	To_IMC_Bus_Data1[30:28] = 3'b000;
	assign	To_IMC_Bus_Data1[31] = 1'b0;		//padding bit

	
/****************Discrete Signal Process*********************/
	IMC_Bus	IMC_Signal_Process
	(
		.clk_100(clk_100),
		.CLK(CLK),
		.RSTn(RSTn),
		.imc_enable(imc_enable),
		.Tx_Pin_Out(SER_BUS_TX),
		.From_IMC_Bus(From_IMC_Bus_Data1),
		.Rx_Pin_In(SER_BUS_RX),
		.To_IMC_Bus(To_IMC_Bus_Data1)
	);
		
		
endmodule
