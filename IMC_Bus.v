module	IMC_Bus
(
   clk_100, RSTn,CLK,
   imc_enable,
	Tx_Pin_Out,From_IMC_Bus,
	Rx_Pin_In,To_IMC_Bus
);

	input	clk_100;
	input	CLK;
	input	RSTn;
	input	imc_enable;
	
	output	[31:0] From_IMC_Bus;
	reg		[31:0] rFrom_IMC_Bus;
	output	Tx_Pin_Out;

	input	[31:0] To_IMC_Bus;
	input	Rx_Pin_In;

	reg		Tx_En_Sig;
	wire	Tx_Cancel;
	wire	Tx_Done_Sig;
	wire	Tx_Transmit_now;
	
	reg		Rx_En_Sig;
	reg		[31:0] rIMC_Data_ProcessID1;
	reg		[31:0] rIMC_Data_ProcessID2;
	reg		[31:0] rIMC_Data_ProcessID3;
	reg		[31:0] rIMC_Data_ProcessID4;
	reg		[31:0] rIMC_Data_ProcessID5;
	reg		[31:0] rIMC_Data_ProcessID6;
	reg		[31:0] rIMC_Data_ProcessID7;
	reg		[31:0] rIMC_Data_ProcessID8;
	reg		[31:0] rIMC_Data_ProcessID9;
	reg		[31:0] rIMC_Data_ProcessID10;
	wire	[31:0] Rx_Data;
	wire	Rx_Done_Sig;
	wire	start_rx;
	
	rx_module	rx_process
	(
		.CLK(clk_100),
		.RSTn(RSTn),
		.Rx_Pin_In(Rx_Pin_In),
		.Rx_En_Sig(Rx_En_Sig),
		.Rx_Done_Sig(Rx_Done_Sig),
		.Rx_Data(Rx_Data),
		.Tx_Transmit_now(Tx_Transmit_now),
		.bus_idle_start_rx(bus_idle_start_tx_rx[1]),
		.Tx_Cancel(Tx_Cancel),
		.start_rx(start_rx),
		.Tx_Pin_to_Rx(Tx_Pin_Out),
		.Tx_Data(To_IMC_Bus)
	);

	reg		[1:0] bus_idle_start_tx_rx;
	reg		[15:0] bus_idle_count;
	always @ (posedge clk_100 or negedge RSTn)
		if(!RSTn)
			begin
				bus_idle_count <= 16'd0;
				bus_idle_start_tx_rx <= 1'b0;
			end
		else if(Rx_Pin_In)
			begin
				if(bus_idle_count==16'd799)			//idle bit define 8*100		1000kbps
					begin
						bus_idle_start_tx_rx <= 2'b11;
						bus_idle_count <= 16'd0;
					end
				else
					bus_idle_count <= bus_idle_count+1'b1;
				if(Rx_Done_Sig)
					bus_idle_start_tx_rx[1] <= 1'b0;
				if(Tx_Done_Sig)
					bus_idle_start_tx_rx[0] <= 1'b0;
				if((!Tx_Transmit_now) && start_rx)
					bus_idle_start_tx_rx[0] <= 1'b0;
			end
		else 
			begin
				bus_idle_count <= 16'd0;
//				bus_idle_start_tx_rx <= 2'b00;
				if((!Tx_Transmit_now) && start_rx)
					bus_idle_start_tx_rx[0] <= 1'b0;				
			end
				
	tx_module	tx_process
	(
		.CLK(clk_100),
		.RSTn(RSTn),
		.Tx_Pin_Out(Tx_Pin_Out),
		.Tx_En_Sig(Tx_En_Sig),
		.Tx_Done_Sig(Tx_Done_Sig),
		
		.Tx_Transmit_now(Tx_Transmit_now),
		.bus_idle_start_tx(bus_idle_start_tx_rx[0]),
		.Tx_Data(To_IMC_Bus),
		.Tx_Cancel(Tx_Cancel),
		.Rx_Done_Sig(Rx_Done_Sig)
	);

	reg		isTxCount;
	reg		[15:0] Tx_SendPeriod;
	wire	[15:0] Tx_TimeCount;
	PWM_DeadTimeProduce	Tx_Dispatch
	(
		.clk_100(CLK),
		.RSTn(RSTn),
		.isCount(isTxCount),
		.PWM_DEAD_TIME(Tx_SendPeriod),
		.DeadTimeCount(Tx_TimeCount)
	);

	always @ (posedge clk_100 or negedge RSTn)
		if(!RSTn)
			begin
				Tx_En_Sig <= 1'b0;
				Rx_En_Sig <= 1'b0;
			end
		else if(imc_enable)
			begin
				Rx_En_Sig <= 1'b1;
				Tx_SendPeriod <= 16'd20000;		//define transmit period
				isTxCount <= 1;
				if(Tx_TimeCount== 16'd0)
					Tx_En_Sig <= 1'b1;
				if(Tx_Done_Sig)
					Tx_En_Sig <= 1'b0;
			end

/**********************receive from process*******************/
	reg	[15:0] Data_Fresh_Time_Count;
	always @ (posedge clk_100 or negedge RSTn)
		if(!RSTn)
			begin
				rIMC_Data_ProcessID1 <= 32'd0;
				rIMC_Data_ProcessID2 <= 32'd0;
				rIMC_Data_ProcessID3 <= 32'd0;
				rIMC_Data_ProcessID4 <= 32'd0;
				rIMC_Data_ProcessID5 <= 32'd0;
				rIMC_Data_ProcessID6 <= 32'd0;
				rIMC_Data_ProcessID7 <= 32'd0;
				rIMC_Data_ProcessID8 <= 32'd0;
				rIMC_Data_ProcessID9 <= 32'd0;
				rIMC_Data_ProcessID10 <= 32'd0;
				Data_Fresh_Time_Count <= 16'd0;
			end			
		else if(Rx_Done_Sig)
			begin
				if(Rx_Data[5]==1'b0 && Rx_Data[11]==1'b0 && Rx_Data[15]==1'b0 && 
					Rx_Data[21]==1'b0 && Rx_Data[27]==1'b0 && Rx_Data[31]==1'b0)
					begin
						case(Rx_Data[15:0])
							16'd1:
								rIMC_Data_ProcessID1 <= Rx_Data;
							16'd2:
								rIMC_Data_ProcessID2 <= Rx_Data;
							16'd4:
								rIMC_Data_ProcessID3 <= Rx_Data;
							16'd8:
								rIMC_Data_ProcessID4 <= Rx_Data;
							16'd16:
								rIMC_Data_ProcessID5 <= Rx_Data;
							16'd64:
								rIMC_Data_ProcessID6 <= Rx_Data;
							16'd128:
								rIMC_Data_ProcessID7 <= Rx_Data;
							16'd256:
								rIMC_Data_ProcessID8 <= Rx_Data;
							16'd512:
								rIMC_Data_ProcessID9 <= Rx_Data;
							16'd1024:
								rIMC_Data_ProcessID10 <= Rx_Data;
						endcase
						rFrom_IMC_Bus  <=  	rIMC_Data_ProcessID1 | rIMC_Data_ProcessID2 | rIMC_Data_ProcessID3 | 
											rIMC_Data_ProcessID4 | rIMC_Data_ProcessID5 | rIMC_Data_ProcessID6 | 
											rIMC_Data_ProcessID7 | rIMC_Data_ProcessID8 | rIMC_Data_ProcessID9 |
											rIMC_Data_ProcessID10;
						if(Data_Fresh_Time_Count==16'd10000)
							begin
								rIMC_Data_ProcessID1 <= 32'd0;
								rIMC_Data_ProcessID2 <= 32'd0;
								rIMC_Data_ProcessID3 <= 32'd0;
								rIMC_Data_ProcessID4 <= 32'd0;
								rIMC_Data_ProcessID5 <= 32'd0;
								rIMC_Data_ProcessID6 <= 32'd0;
								rIMC_Data_ProcessID7 <= 32'd0;
								rIMC_Data_ProcessID8 <= 32'd0;
								rIMC_Data_ProcessID9 <= 32'd0;
								rIMC_Data_ProcessID10 <= 32'd0;
								Data_Fresh_Time_Count <= 16'd0;
							end
						else 
							Data_Fresh_Time_Count <= Data_Fresh_Time_Count+1'b1;
					end
			end

				
	assign	From_IMC_Bus = rFrom_IMC_Bus;
	
endmodule