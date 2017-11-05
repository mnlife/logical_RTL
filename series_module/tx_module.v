module tx_module
(
     CLK, RSTn,
	 Tx_Data, Tx_En_Sig,Tx_Cancel,Rx_Done_Sig,bus_idle_start_tx,
	 Tx_Done_Sig, Tx_Pin_Out, Tx_Transmit_now
);
 
      input CLK;
	  input RSTn;
	  input [31:0] Tx_Data;
	  input Tx_En_Sig;
	  input Tx_Cancel;
	  input Rx_Done_Sig;

	  input	 bus_idle_start_tx;
	  
	  output Tx_Done_Sig;
	  output Tx_Pin_Out;
	  output Tx_Transmit_now;
	  
	  /********************************/
	  
	  wire BPS_CLK;
	  
	  tx_bps_module U1
	  (
	        .CLK( CLK ),
			.RSTn( RSTn ),
			.Count_Sig( bus_idle_start_tx&&Tx_En_Sig ),    // input - from U2
			.BPS_CLK( BPS_CLK )         // output - to U2
	  );
	  
	  /*********************************/
	  
	  tx_control_module U2
	  (
	        .CLK( CLK ),
			.RSTn( RSTn ),
			.Tx_En_Sig( Tx_En_Sig ),    // input - from top
			.Tx_Data( Tx_Data ),        // input - from top
			.BPS_CLK( BPS_CLK ),        // input - from U2
			.Tx_Cancel(Tx_Cancel),
			.Rx_Done_Sig(Rx_Done_Sig),
			.bus_idle_start_tx(bus_idle_start_tx),
			.Tx_Transmit_now(Tx_Transmit_now),
			
			.Tx_Done_Sig( Tx_Done_Sig ),  // output - to top
			.Tx_Pin_Out( Tx_Pin_Out )     // output - to top
	  );
	  
	  /***********************************/

endmodule

