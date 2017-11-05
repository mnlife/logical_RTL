module tx_control_module
(
    CLK, RSTn,
	Tx_En_Sig, Tx_Data, BPS_CLK, Tx_Cancel, Rx_Done_Sig,bus_idle_start_tx,
    Tx_Done_Sig, Tx_Pin_Out,Tx_Transmit_now
	 
);

     input CLK;
	 input RSTn;
	 
	 input Tx_En_Sig;
	 input [31:0] Tx_Data;
	 input BPS_CLK;
	 input Tx_Cancel;
	 input Rx_Done_Sig;

	 input	bus_idle_start_tx;
	 
	 output Tx_Done_Sig;
	 output Tx_Pin_Out;
	 output	Tx_Transmit_now;
	 reg	rTx_Transmit_now;
	 /********************************************************/

	 reg [7:0] i;
	 reg rTx;
	 reg isDone;
	 reg Tx_Start;
	 
	 always @ ( posedge CLK or negedge RSTn )
	 	begin
	 		if(!RSTn)
	 			Tx_Start <= 1'b1;
			else if(Tx_Cancel)
				Tx_Start <= 1'b0;	
			else
				Tx_Start <= 1'b1;
		end
				
	 always @ ( posedge CLK or negedge RSTn )
	     if( !RSTn )
		    begin
		        i <= 8'd0;
				rTx <= 1'b1;
				isDone <= 1'b0;
				rTx_Transmit_now <= 1'b0;
			end
		 else if( Tx_En_Sig && Tx_Start )
			begin
				if(bus_idle_start_tx)
					begin
		  				case ( i )
				
			    			8'd0 :
					 			if( BPS_CLK ) 
					 				begin 
					 					i <= i + 1'b1; 
					 					rTx <= 1'b0; 
					 					rTx_Transmit_now <= 1'b1;
					 				end
					 
							8'd1,  8'd2 , 8'd3 , 8'd4, 8'd5 , 8'd6 , 8'd7 , 8'd8 , 8'd9 , 8'd10, 
							8'd11, 8'd12, 8'd13,8'd14, 8'd15, 8'd16, 8'd17, 8'd18, 8'd19, 8'd20, 
							8'd21, 8'd22, 8'd23,8'd24, 8'd25, 8'd26, 8'd27, 8'd28, 8'd29, 8'd30, 
							8'd31, 8'd32 :
					 			if( BPS_CLK ) 
					 				begin 
					 					i <= i + 1'b1; 
					 					rTx <= Tx_Data[ i - 1 ]; 
					 				end
					 
							8'd33 :
					 			if( BPS_CLK ) begin i <= i + 1'b1; rTx <= 1'b1; rTx_Transmit_now <= 1'b0; end
					 			 
							8'd34 :
					 			if( BPS_CLK ) begin i <= i + 1'b1; rTx <= 1'b1; end
					 
							8'd35 :
					 			if( BPS_CLK ) begin i <= i + 1'b1; isDone <= 1'b1; end
					 
							8'd36 :
					 			begin i <= 8'd0; isDone <= 1'b0; end
				 
						endcase
					end
				else	
					begin
						rTx <= 1'b1;
						i <= 8'd0;
					end
			end
		else	
			begin
				rTx <= 1'b1;
				i <= 8'd0;
			end
    /********************************************************/
	 
	 assign Tx_Pin_Out = rTx;
	 assign Tx_Done_Sig = isDone;
	 assign	Tx_Transmit_now = rTx_Transmit_now;
	 
	 /*********************************************************/
	 
endmodule

