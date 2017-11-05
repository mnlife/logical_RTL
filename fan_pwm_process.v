//fan pwm process
module	fan_pwm_process
(
	CLK,RSTn,
	fanmanu_en,fanmanu_duty,fanspeed,
	fan_pwm
);
	input	CLK;
	input	RSTn;
	input	fanmanu_en;
	input	[3:0] fanmanu_duty;
	input	[2:0] fanspeed;
	output	fan_pwm;

	reg		isfanenCount;
	wire	[15:0] fan_pwm_ctr;
	reg		[15:0] fan_pwm_cmp;
	parameter fan_pwm_period = 16'd20000;

	PWM_DeadTimeProduce	fan_pwm_generate
	(
		.clk_100(CLK),
		.RSTn(RSTn),
		.isCount(isfanenCount),
		.PWM_DEAD_TIME(fan_pwm_period),
		.DeadTimeCount(fan_pwm_ctr)
	);
		
/******************fan duty ratio select module********************/
	always	@(posedge CLK or negedge RSTn)
		begin
			if(!RSTn)
				isfanenCount <= 1'b0;
			else if(fanmanu_en)
				begin
					isfanenCount <= 1'b1;
					case(fanmanu_duty)
						4'd0:	
							fan_pwm_cmp <= 16'd2000;
						4'd1:
							fan_pwm_cmp <= 16'd4000;
						4'd2:
							fan_pwm_cmp <= 16'd6000;
						4'd3:
							fan_pwm_cmp <= 16'd8000;
						4'd4:
							fan_pwm_cmp <= 16'd10000;
						4'd5:
							fan_pwm_cmp <= 16'd12000;
						4'd6:
							fan_pwm_cmp <= 16'd14000;
						4'd7:
							fan_pwm_cmp <= 16'd16000;
						4'd8:
							fan_pwm_cmp <= 16'd18000;
						4'd9:
							fan_pwm_cmp <= 16'd20000;
						default:
							fan_pwm_cmp <= 16'd20000;
					endcase
				end
			else
				begin
					isfanenCount <= 1'b1;
					case(fanspeed)
						3'd0:
							fan_pwm_cmp <= 16'd4000;
						3'd1:
							fan_pwm_cmp <= 16'd8000;
						3'd2:
							fan_pwm_cmp <= 16'd12000;
						3'd3:
							fan_pwm_cmp <= 16'd16000;
						3'd4:
							fan_pwm_cmp <= 16'd20000;
						default:
							fan_pwm_cmp <= 16'd20000;
					endcase
				end
		end

	assign	fan_pwm = (fan_pwm_ctr<fan_pwm_cmp)?1'b1:1'b0;
endmodule

