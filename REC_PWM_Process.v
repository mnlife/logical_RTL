/*******************rec pwm process**********************/
module	Pwm_Process_From_RECDSP
(
	clk_100,RSTn,PwmEn,Pwm1,Pwm2,IP_LMT,IN_LMT,Pwm_P,Pwm_N
);

	input	clk_100;
	input	RSTn;
	input	PwmEn;		
	input	Pwm1;
	input	Pwm2;
	
	input	IP_LMT;
	input	IN_LMT;

	output	Pwm_P;
	output	Pwm_N;

	reg		rPwm_P;
	reg		rPwm_N;
	
	parameter	RECPWM_Delay_TIME = 16'd2000;			//setup current limit delay on 
	wire	[15:0] RecPLMT_DelayCount;
	reg		isRecPLMTCount;

/*************positive delay on time set*****************/
	PWM_DeadTimeProduce	Rec_PLMT_Process
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.isCount(isRecPLMTCount),
		.PWM_DEAD_TIME(RECPWM_Delay_TIME),
		.DeadTimeCount(RecPLMT_DelayCount)
	);

	wire	[15:0] RecNLMT_DelayCount;
	reg		isRecNLMTCount;

/*************negetive delay on time set*****************/
	PWM_DeadTimeProduce	Rec_NLMT_Process
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.isCount(isRecNLMTCount),
		.PWM_DEAD_TIME(RECPWM_Delay_TIME),
		.DeadTimeCount(RecNLMT_DelayCount)
	);

/****************rec pwm process module*******************/	
	always @(posedge clk_100 or negedge RSTn)
	if(!RSTn)
		begin
			rPwm_P <= 1'b0;
			rPwm_N <= 1'b0;
			isRecPLMTCount <= 1'b0;
			isRecNLMTCount <= 1'b0;
		end
	else if(PwmEn)
		begin
			if(!IP_LMT)
				begin
					isRecPLMTCount <= 1'b1;
				end
			if(isRecPLMTCount)
				begin
					rPwm_P <= 1'b0;
					if(RecPLMT_DelayCount==RECPWM_Delay_TIME)
						isRecPLMTCount <= 1'b0;
				end
			else
				begin
					rPwm_P <= Pwm1;
				end


			if(!IN_LMT)
				begin
					isRecNLMTCount <= 1'b1;
				end
			if(isRecNLMTCount)
				begin
					rPwm_N <= 1'b0;
					if(RecNLMT_DelayCount==RECPWM_Delay_TIME)
						isRecNLMTCount <= 1'b0;
				end
			else
				begin
					rPwm_N <= Pwm2;
				end			
		end
	else if(!PwmEn)
		begin
			rPwm_P <= 1'b0;
			rPwm_N <= 1'b0;
			isRecPLMTCount <= 1'b0;
			isRecNLMTCount <= 1'b0;
		end

	assign	Pwm_P = rPwm_P;
	assign	Pwm_N = rPwm_N;
			
endmodule
