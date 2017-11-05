/******************PWM DeadTime Produce Module*****************/
module PWM_DeadTimeProduce
(
	clk_100,RSTn,isCount,DeadTimeCount,PWM_DEAD_TIME
);
	input	clk_100;
	input	RSTn;
	input	isCount;
	input	[15:0] PWM_DEAD_TIME;
	output	[15:0] DeadTimeCount;

	reg	[15:0] rDeadTimeCount;
	always @(posedge clk_100 or negedge RSTn)
		if(!RSTn)
			rDeadTimeCount <= 16'd0;
		else if(isCount && rDeadTimeCount==PWM_DEAD_TIME)
			rDeadTimeCount <= 16'd0;
		else if(isCount)
			rDeadTimeCount <= rDeadTimeCount+1'b1;
		else if(!isCount)
			rDeadTimeCount <= 16'd0;	
			
			
	assign	DeadTimeCount = rDeadTimeCount;

endmodule

