module	rec_spi_process
(
	clk_100,RSTn,
	Rec_SPICLK,Rec_SPISIMO,Rec_SPISOMI,Rec_SPISTE,
	rec_data_in1,rec_data_in2,
	rec_data_out1,rec_data_out2
);

	input	clk_100;
	input	RSTn;
	
	input	Rec_SPICLK;
	input	Rec_SPISIMO;
	output	Rec_SPISOMI;
	input	Rec_SPISTE;

	input	[15:0] rec_data_out1;
	input	[15:0] rec_data_out2;

	output	[15:0] rec_data_in1;
	output	[15:0] rec_data_in2;
	reg		[15:0] rrec_data_in1;
	reg		[15:0] rrec_data_in2;
	
	initial
		begin
			rrec_data_in1 <= 16'd0;
			rrec_data_in2 <= 16'd0;
			rec_txd_data <= 16'd0;
		end
	
/******************signal dispatch**********************/
	always @(posedge clk_100 or negedge RSTn)
		begin
			if(!RSTn)
				begin
					rec_txd_data <= 16'd0;
				end
			else if(rec_rxd_flag)
				begin
					if(rec_rxd_data[15:14]==2'b01)
						begin
							rrec_data_in1 <= rec_rxd_data;
							rec_txd_data <= rec_data_out2;
						end
					else if(rec_rxd_data[15:14]==2'b10)
						begin
							rrec_data_in2 <= rec_rxd_data;
							rec_txd_data <= rec_data_out1;
						end
					
				end
		end

	
	reg		[15:0] rec_txd_data;
	wire	[15:0] rec_rxd_data;
	wire	rec_rxd_flag;

	spi	Rec_SPI_Process
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.SCK(Rec_SPICLK),
		.SPISIMO(Rec_SPISIMO),
		.SPISOMI(Rec_SPISOMI),
		.SPISTE(Rec_SPISTE),
		.rxd_flag(rec_rxd_flag),
		.rxd_data(rec_rxd_data),
		.txd_data(rec_txd_data)
	);

	assign	rec_data_in1 = rrec_data_in1;
	assign	rec_data_in2 = rrec_data_in2;

endmodule

