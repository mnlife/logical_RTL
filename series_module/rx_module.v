module rx_module
(
    CLK, RSTn,
    Rx_Pin_In, Rx_En_Sig, Tx_Data,bus_idle_start_rx,Tx_Transmit_now,Tx_Pin_to_Rx,
	Rx_Done_Sig, Rx_Data, Tx_Cancel, start_rx
);

     input CLK;
	 input RSTn;
	 
	 input Rx_Pin_In;
	 input Rx_En_Sig;
	 input [31:0] Tx_Data;
	 input	bus_idle_start_rx;
	 input	Tx_Transmit_now;
	 input	Tx_Pin_to_Rx;
	 
	 output [31:0] Rx_Data;
	 output Rx_Done_Sig;
	 output Tx_Cancel;
	 output	start_rx;
	 
	 /**********************************/
	 
	 wire H2L_Sig;
	 
	 detect_module U1
	 (
	     .CLK( CLK ),
		 .RSTn( RSTn ),
		 .Rx_Pin_In( Rx_Pin_In ),    // input - from top
		 .H2L_Sig( H2L_Sig )         // output - to U3
	 );
	 
	 /**********************************/
	 
	 wire BPS_CLK;
	 
	 rx_bps_module U2
	 (
	     .CLK( CLK ),
		 .RSTn( RSTn ),
		 .Count_Sig( Count_Sig ),   // input - from U3
		 .BPS_CLK( BPS_CLK )        // output - to U3
	 );
	 
	 /**********************************/
	 
	 wire Count_Sig;
	 
	 rx_control_module U3
	 (
	     .CLK( CLK ),
		 .RSTn( RSTn ),
		  
		 .H2L_Sig( H2L_Sig ),      // input - from U1
		 .Rx_En_Sig( Rx_En_Sig ),  // input - from top
		 .Rx_Pin_In( Rx_Pin_In ),  // input - from top
		 .BPS_CLK( BPS_CLK ),      // input - from U2
		 .Tx_Data(Tx_Data),
		 .bus_idle_start_rx(bus_idle_start_rx),
		 .Tx_Transmit_now(Tx_Transmit_now),
		 .Tx_Pin_to_Rx(Tx_Pin_to_Rx),
		 
		 .Count_Sig( Count_Sig ),    // output - to U2
		 .Rx_Data( Rx_Data ),        // output - to top
		 .Rx_Done_Sig( Rx_Done_Sig ), // output - to top
		 .Tx_Cancel(Tx_Cancel),
		 .start_rx(start_rx)
		  
	 );
	 
	 /************************************/
	 

endmodule
