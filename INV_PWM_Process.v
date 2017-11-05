module	pwm_deal_frominvdsp
(
	clk_100,RSTn,InvPwm_En,Inv_Pwm_X,Inv_CrossZero_X,Inv_Pwm_LMTX,
	Inv_Pwm_X1,Inv_Pwm_X2,Inv_Pwm_X3,Inv_Pwm_X4
);

	input		clk_100;
	input		RSTn;
	input		Inv_Pwm_X;
	input		Inv_CrossZero_X;
	input		InvPwm_En;		
	input		Inv_Pwm_LMTX;
	output		Inv_Pwm_X1;
	output		Inv_Pwm_X2;
	output		Inv_Pwm_X3;
	output		Inv_Pwm_X4;

	parameter	PWM_DEAD_TIME = 16'd200;	//200*10 = 2us

/******************PWM DeadTime Produce Module*****************/
	wire	[15:0] PosedgeDeadTimeCount;
	reg	isPosedgeCount;
	PWM_DeadTimeProduce	PosedgeDeadTimeProduce
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.isCount(isPosedgeCount),
		.PWM_DEAD_TIME(PWM_DEAD_TIME),
		.DeadTimeCount(PosedgeDeadTimeCount)
	);
	

	wire	[15:0] NegedgeDeadTimeCount;
	reg	isNegedgeCount;

	PWM_DeadTimeProduce	NegedgeDeadTimeProduce
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.isCount(isNegedgeCount),
		.PWM_DEAD_TIME(PWM_DEAD_TIME),
		.DeadTimeCount(NegedgeDeadTimeCount)
	);

	wire	[15:0] Inv_Pwm_LMTCount;
	reg		isPwm_LMTCount;
	
	PWM_DeadTimeProduce	Inv_Pwm_LMTProcess
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.isCount(isPwm_LMTCount),
		.PWM_DEAD_TIME(PWM_DEAD_TIME),
		.DeadTimeCount(Inv_Pwm_LMTCount)
	);

	wire	[15:0] InvOnOffCount;
	reg		isInvOnOffCount;
	PWM_DeadTimeProduce	InvOn_PwmProcess
	(
		.clk_100(clk_100),
		.RSTn(RSTn),
		.isCount(isPwm_LMTCount),
		.PWM_DEAD_TIME(PWM_DEAD_TIME),
		.DeadTimeCount(InvOnOffCount)
	);

/******************Inv Pwm Process Module******************/	
	reg	rInv_Pwm_X1;
	reg	rInv_Pwm_X2;
	reg	rInv_Pwm_X3;
	reg	rInv_Pwm_X4;
	
	reg	Inv_Pwm_X_Older;
	always @(posedge clk_100 or negedge RSTn)
   		if(!RSTn)
			begin
				rInv_Pwm_X1 <= 1'b0;
				rInv_Pwm_X2 <= 1'b0;
				rInv_Pwm_X3 <= 1'b0;
				rInv_Pwm_X4 <= 1'b0;
				isNegedgeCount <= 1'b0;
				isPosedgeCount <= 1'b0;
				isPwm_LMTCount <= 1'b0;
				isInvOnOffCount <= 1'b0;
				Inv_Pwm_X_Older <= 1'b0;
			end
		else if(InvPwm_En==1'b1 && Inv_Pwm_LMTX==1'b0)		//Current Limit	Process
			begin
				rInv_Pwm_X1 <= 1'b0;
				rInv_Pwm_X4 <= 1'b0;
				isNegedgeCount <= 1'b0;
				isPosedgeCount <= 1'b0;
				isPwm_LMTCount <= 1'b1;
				isInvOnOffCount <= 1'b0;
				if(Inv_Pwm_LMTCount==PWM_DEAD_TIME && isPwm_LMTCount)
					begin
						rInv_Pwm_X2 <= 1'b0;
						rInv_Pwm_X3 <= 1'b0;
						isPwm_LMTCount <= 1'b0;
					end
//				if(Inv_Pwm_X==1'b1)
//					Inv_Pwm_X_Older <= 1'b0;
//				else
//					Inv_Pwm_X_Older <= 1'b1;
			end
		else if(InvPwm_En)
			begin
				isPwm_LMTCount <= 1'b0;
				if(Inv_CrossZero_X == 1'b0)					//Positive PWM Process
					begin
						rInv_Pwm_X2 <= 1'b1;
						rInv_Pwm_X4 <= 1'b0;
						if(Inv_Pwm_X==1'b1 && Inv_Pwm_X_Older==1'b0)
							begin
								rInv_Pwm_X3 <= 1'b0;
								isPosedgeCount <= 1'b1;
							end
						if(PosedgeDeadTimeCount==PWM_DEAD_TIME && isPosedgeCount &&	Inv_Pwm_X==1'b1)
							begin
								rInv_Pwm_X1 <= 1'b1;
								isPosedgeCount <= 1'b0;
							end
						else if(PosedgeDeadTimeCount==PWM_DEAD_TIME && isPosedgeCount && Inv_Pwm_X==1'b0)
							begin
								rInv_Pwm_X1 <= 1'b0;
								isPosedgeCount <= 1'b0;
							end
						if(Inv_Pwm_X==1'b0 && Inv_Pwm_X_Older==1'b1)
							begin
								rInv_Pwm_X1 <= 1'b0;
								isNegedgeCount <= 1'b1;
							end
						if(NegedgeDeadTimeCount==PWM_DEAD_TIME && isNegedgeCount && Inv_Pwm_X==1'b0)
							begin
								rInv_Pwm_X3 <= 1'b1;
								isNegedgeCount <= 1'b0;
							end
						else if(NegedgeDeadTimeCount==PWM_DEAD_TIME && isNegedgeCount && Inv_Pwm_X==1'b1)
							begin
								rInv_Pwm_X3 <= 1'b0;
								isNegedgeCount <= 1'b0;
							end
					end
				else if(Inv_CrossZero_X == 1'b1)				//Negetive	PWM Process
					begin
						rInv_Pwm_X1 <= 1'b0;
						rInv_Pwm_X3 <= 1'b1;
				
						if(Inv_Pwm_X==1'b1 && Inv_Pwm_X_Older==1'b0)
							begin
								rInv_Pwm_X2 <= 1'b0;
								isPosedgeCount <= 1'b1;
							end
						if(PosedgeDeadTimeCount==PWM_DEAD_TIME && isPosedgeCount && Inv_Pwm_X==1'b1)
							begin
								rInv_Pwm_X4 <= 1'b1;
								isPosedgeCount <= 1'b0;
							end
						else if(PosedgeDeadTimeCount==PWM_DEAD_TIME && isPosedgeCount && Inv_Pwm_X==1'b0)
							begin
								rInv_Pwm_X4 <= 1'b0;
								isPosedgeCount <= 1'b0;
							end
						if(Inv_Pwm_X==1'b0 && Inv_Pwm_X_Older==1'b1)
							begin
								rInv_Pwm_X4 <= 1'b0;
								isNegedgeCount <= 1'b1;
							end
						if(NegedgeDeadTimeCount==PWM_DEAD_TIME && isNegedgeCount && Inv_Pwm_X==1'b0)
							begin
								rInv_Pwm_X2 <= 1'b1;
								isNegedgeCount <= 1'b0;
							end
						else if(NegedgeDeadTimeCount==PWM_DEAD_TIME && isNegedgeCount && Inv_Pwm_X==1'b1)
							begin
								rInv_Pwm_X2 <= 1'b0;
								isNegedgeCount <= 1'b0;
							end
					end
				Inv_Pwm_X_Older <= Inv_Pwm_X;	
			end			
		else
			begin
				rInv_Pwm_X1 <= 1'b0;
				rInv_Pwm_X4	<= 1'b0;
				Inv_Pwm_X_Older <= 1'b0;
				isNegedgeCount <= 1'b0;
				isPosedgeCount <= 1'b0;
				isPwm_LMTCount <= 1'b0;
				isInvOnOffCount <= 1'b1;
				if(InvOnOffCount==PWM_DEAD_TIME && isInvOnOffCount)
					begin
						rInv_Pwm_X2 <= 1'b0;
						rInv_Pwm_X3 <= 1'b0;
						isInvOnOffCount <= 1'b0;
					end
			end			
			
	assign	Inv_Pwm_X1 = rInv_Pwm_X1;
	assign	Inv_Pwm_X2 = rInv_Pwm_X2;
	assign	Inv_Pwm_X3 = rInv_Pwm_X3;
	assign	Inv_Pwm_X4 = rInv_Pwm_X4;
	
endmodule

