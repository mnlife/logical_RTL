module rx_control_module
(
    CLK, RSTn,
	H2L_Sig, Rx_Pin_In, BPS_CLK, Rx_En_Sig, Tx_Data,bus_idle_start_rx,Tx_Transmit_now,Tx_Pin_to_Rx,
    Count_Sig, Rx_Data, Rx_Done_Sig, Tx_Cancel, start_rx
	 
);

     input CLK;
	 input RSTn;
	 
	 input H2L_Sig;
	 input Rx_En_Sig;
	 input Rx_Pin_In;
	 input BPS_CLK;
	 input [31:0] Tx_Data;
	
	 input	bus_idle_start_rx;
	 input	Tx_Transmit_now;
	 input	Tx_Pin_to_Rx;
	 
	 output Count_Sig;
	 output [31:0] Rx_Data;
	 output Rx_Done_Sig;
	 output Tx_Cancel;
	 output start_rx;
	 
	 /********************************************************/

	 reg [7:0] i;
	 reg [31:0] rData;
	 reg isCount;
	 reg isDone;
	 reg rTx_Cancel;
	 reg rstart_rx;
	
	 always @ ( posedge CLK or negedge RSTn )
	     if( !RSTn )
		      begin 
		          i <= 8'd0;
				  rData <= 31'd0;
				  isCount <= 1'b0;
				  isDone <= 1'b0;
				  rTx_Cancel <= 1'b0;
				  rstart_rx <= 1'b0;
			  end
		  else if(Rx_En_Sig && bus_idle_start_rx)
		  	case ( i )
		      	8'd0 :
					 if( H2L_Sig )
					 	begin 
					 		i <= i + 1'b1; 
					 		isCount <= 1'b1; 
					 		rstart_rx <= 1'b1;
					 	end	 
				8'd1 : 
					 if( BPS_CLK ) 
					 	begin 
					 		i <= i + 1'b1;
					 		rstart_rx <= 1'b0;
					 	end
				8'd2 , 8'd3 , 8'd4, 8'd5 , 8'd6 , 8'd7 , 8'd8 , 8'd9 , 8'd10, 8'd11, 
				8'd12, 8'd13,8'd14, 8'd15, 8'd16, 8'd17, 8'd18, 8'd19, 8'd20, 8'd21,
				8'd22, 8'd23,8'd24, 8'd25, 8'd26, 8'd27, 8'd28, 8'd29, 8'd30, 8'd31,
				8'd32, 8'd33 :
					 if( BPS_CLK ) 
					 	begin
					 		i <= i + 1'b1; 
					 		rData[ i - 2 ] <= Rx_Pin_In;					 		
					 		if((Tx_Pin_to_Rx!=Rx_Pin_In)&&(Tx_Transmit_now))
					 			begin
									rTx_Cancel <= 1'b1;
					 			end
					 	end
				8'd34 :
					 if( BPS_CLK ) 
					 	begin 
					 		i <= i + 1'b1; 
					 	end
				8'd35 :
					 if( BPS_CLK ) 
					 	begin 
					 		i <= i + 1'b1; 
					 	end
				8'd36 :
					 begin 
					 	i <= i + 1'b1; 
					 	isDone <= 1'b1; 					 	
					 	isCount <= 1'b0; 
					 	rTx_Cancel <= 1'b0;

					 end
					 
				8'd37 :
					 begin 
					 	i <= 8'd0; 
					 	isDone <= 1'b0;	 	
					 end
			endcase
				
    /********************************************************/
	 
	 assign Count_Sig = isCount;
	 assign Rx_Data = rData;
	 assign Rx_Done_Sig = isDone;
	 assign Tx_Cancel = rTx_Cancel;
	 assign	start_rx = rstart_rx;
	 
	 /*********************************************************/
	 
endmodule

