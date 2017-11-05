module	inv_spi_process
(
	clk_100,RSTn,
	Inv_SPICLK,Inv_SPISIMO,Inv_SPISOMI,Inv_SPISTE,
	inv_data_out1,inv_data_out2,inv_data_out3,inv_data_out4,
	inv_data_in1,inv_data_in2,inv_data_in3
);

	input	clk_100;
	input	RSTn;
	
	input	Inv_SPICLK;
	input	Inv_SPISIMO;
	output	Inv_SPISOMI;
	input	Inv_SPISTE;

	input	[15:0] inv_data_out1;
	input	[15:0] inv_data_out2;
	input	[15:0] inv_data_out3;
	input	[15:0] inv_data_out4;

	output	[15:0] inv_data_in1;
	output	[15:0] inv_data_in2;
	output	[15:0] inv_data_in3;

	reg		[15:0] rinv_data_in1;
	reg		[15:0] rinv_data_in2;
	reg		[15:0] rinv_data_in3;
	
	reg		[15:0] inv_txd_data;
	wire	[15:0] inv_rxd_data;
	wire	inv_rxd_flag;
	

	initial
		begin
		
			rinv_data_in1 <= 16'd0;
			rinv_data_in2 <= 16'd0;
			rinv_data_in3 <= 16'd0;
			inv_txd_data <= 16'd0;

		end
/****************Inv SPI signal dispatch*********************/
	always @(posedge clk_100 or negedge RSTn)
		begin
			if(!RSTn)
				begin
					inv_txd_data <= 16'd0;
				end
			else if(inv_rxd_flag)
				begin
					case(inv_rxd_data[15:14])
						2'b00:
							begin
								inv_txd_data <= inv_data_out2;
							end
						2'b01:
							begin
								rinv_data_in1 <= inv_rxd_data;
								inv_txd_data <= inv_data_out3;
							end
						2'b10:
							begin
								rinv_data_in2 <= inv_rxd_data;
								inv_txd_data <= inv_data_out4;
							end
						2'b11:
							begin
								rinv_data_in3 <= inv_rxd_data;
								inv_txd_data <= inv_data_out1;
							end
						default:;
							
					endcase
				end
		end
/**********************invoking spi module****************************/		
	spi	Inv_SPI_Process
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.SCK(Inv_SPICLK),
		.SPISIMO(Inv_SPISIMO),
		.SPISOMI(Inv_SPISOMI),
		.SPISTE(Inv_SPISTE),
		.rxd_flag(inv_rxd_flag),
		.rxd_data(inv_rxd_data),
		.txd_data(inv_txd_data)
	);

	assign	inv_data_in1 = rinv_data_in1;
	assign	inv_data_in2 = rinv_data_in2;
	assign	inv_data_in3 = rinv_data_in3;
	
endmodule
