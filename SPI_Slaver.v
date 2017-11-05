
/***********************************************************************
		****************** name:SPI_Slaver_Driver **************
***********************************************************************/
//use SPI 3 mode,CPOL = 0,CPHA = 1

module spi
(
input clk_100,
input RSTn,
input SPISTE,
input SCK,
input SPISIMO,
input  [15:0] txd_data,
output reg SPISOMI,
output reg [15:0] rxd_data,
output rxd_flag				//recieve done,please transmit data
); 


//-------------------------capture the sck-----------------------------          
reg sck_r0;
reg sck_r1;
//wire sck_n;
wire sck_p;
always@(posedge clk_100 or negedge RSTn)
begin
    if(!RSTn)
        begin
            sck_r0 <= 1'b1;   //sck of the idle state is high 
            sck_r1 <= 1'b1;
        end
    else
        begin
            sck_r0 <= SCK;
            sck_r1 <= sck_r0;
        end
end

//assign sck_n = (~sck_r0 & sck_r1)? 1'b1:1'b0;   //capture the sck negedge
assign sck_p = (~sck_r1 & sck_r0)? 1'b1:1'b0;   //capture the sck posedge

//-----------------------spi_slaver read data-------------------------------
reg rxd_flag_r;
reg [3:0] rxd_state;
always@(posedge clk_100 or negedge RSTn)
begin
    if(!RSTn)
        begin
            rxd_data <= 1'b0;
            rxd_flag_r <= 1'b0;
            rxd_state <= 1'b0;
        end
    else if(sck_p && !SPISTE)   
        begin
            case(rxd_state)
                4'd0:begin
                        rxd_data[15] <= SPISIMO;
                        rxd_flag_r <= 1'b0;   		//reset rxd_flag
                        rxd_state <= 4'd1;
                      end
                4'd1:begin
                        rxd_data[14] <= SPISIMO;
                        rxd_state <= 4'd2;
                      end
                4'd2:begin
                        rxd_data[13] <= SPISIMO;
                        rxd_state <= 4'd3;
                      end
                4'd3:begin
                        rxd_data[12] <= SPISIMO;
                        rxd_state <= 4'd4;
                      end
                4'd4:begin
                        rxd_data[11] <= SPISIMO;
                        rxd_state <= 4'd5;
                      end
                4'd5:begin
                        rxd_data[10] <= SPISIMO;
                        rxd_state <= 4'd6;
                      end
                4'd6:begin
                        rxd_data[9] <= SPISIMO;
                        rxd_state <= 4'd7;
                      end
                4'd7:begin
                        rxd_data[8] <= SPISIMO;
                        rxd_state <= 4'd8;
                      end
                4'd8:begin
                        rxd_data[7] <= SPISIMO;
                        rxd_state <= 4'd9;
                      end
                4'd9:begin
                        rxd_data[6] <= SPISIMO;
                        rxd_state <= 4'd10;
                      end
                4'd10:begin
                        rxd_data[5] <= SPISIMO;
                        rxd_state <= 4'd11;
                      end
                4'd11:begin
                        rxd_data[4] <= SPISIMO;
                        rxd_state <= 4'd12;
                      end
                4'd12:begin
                        rxd_data[3] <= SPISIMO;
                        rxd_state <= 4'd13;
                      end
                4'd13:begin
                        rxd_data[2] <= SPISIMO;
                        rxd_state <= 4'd14;
                      end
                4'd14:begin
                        rxd_data[1] <= SPISIMO;
                        rxd_state <= 4'd15;
                      end       
                4'd15:begin
                        rxd_data[0] <= SPISIMO;
                        rxd_flag_r <= 1'b1;  		//set rxd_flag
                        rxd_state <= 3'd0;
                      end
                default: ;
            endcase
        end
end


//--------------------capture spi_flag posedge,Tranmit next frame--------------------------------
reg rxd_flag_r0;
reg rxd_flag_r1;
always@(posedge clk_100 or negedge RSTn)
begin
    if(!RSTn)
        begin
            rxd_flag_r0 <= 1'b0;
            rxd_flag_r1 <= 1'b0;
        end
    else
        begin
            rxd_flag_r0 <= rxd_flag_r;
            rxd_flag_r1 <= rxd_flag_r0;
        end
end

assign rxd_flag = (~rxd_flag_r1 & rxd_flag_r0)? 1'b1:1'b0;   

//---------------------spi_slaver send data---------------------------
reg [3:0] txd_state;
reg	SPISTE_Older;
wire	a;
wire	b;
assign a = (sck_p && !SPISTE);
assign b = (SPISTE_Older && !SPISTE);

always@(posedge clk_100 or negedge RSTn)
begin
    if(!RSTn)
        begin
            txd_state <= 4'd0;
        end
    else if(SPISTE)
		begin
			txd_state <= 4'd0;
			SPISTE_Older <= 1'b1;
		end
    else if(a || b)
        begin
			SPISTE_Older <= 1'b0;
            case(txd_state)
                4'd0:begin
                        SPISOMI <= txd_data[15];
                        txd_state <= 4'd1;
                      end
                4'd1:begin
                        SPISOMI <= txd_data[14];
                        txd_state <= 4'd2;
                      end
                4'd2:begin
                        SPISOMI <= txd_data[13];
                        txd_state <= 4'd3;
                      end
                4'd3:begin
                        SPISOMI <= txd_data[12];
                        txd_state <= 4'd4;
                      end
                4'd4:begin
                        SPISOMI <= txd_data[11];
                        txd_state <= 4'd5;
                      end
                4'd5:begin
                        SPISOMI <= txd_data[10];
                        txd_state <= 4'd6;
                      end
                4'd6:begin
                        SPISOMI <= txd_data[9];
                        txd_state <= 4'd7;
                      end
                4'd7:begin
                        SPISOMI <= txd_data[8];
                        txd_state <= 4'd8;
                      end
                4'd8:begin
                        SPISOMI <= txd_data[7];
                        txd_state <= 4'd9;
                      end
                4'd9:begin
                        SPISOMI <= txd_data[6];
                        txd_state <= 4'd10;
                      end
                4'd10:begin
                        SPISOMI <= txd_data[5];
                        txd_state <= 4'd11;
                      end
                4'd11:begin
                        SPISOMI <= txd_data[4];
                        txd_state <= 4'd12;
                      end
                4'd12:begin
                        SPISOMI <= txd_data[3];
                        txd_state <= 4'd13;
                      end
                4'd13:begin
                        SPISOMI <= txd_data[2];
                        txd_state <= 4'd14;
                      end
                4'd14:begin
                        SPISOMI <= txd_data[1];
                        txd_state <= 4'd15;
                      end
                4'd15:begin
                        SPISOMI <= txd_data[0];
                        txd_state <= 4'd0;
                      end
                default: ;
            endcase
        end
    
end

endmodule
