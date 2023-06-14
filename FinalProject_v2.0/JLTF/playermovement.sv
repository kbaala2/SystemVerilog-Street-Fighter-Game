
module  playermovement ( input Reset, frame_clk, collision, start, input [9:0] SpriteX2,
					input [31:0] keycode,
               output [9:0]  SpriteX, SpriteY, SpriteS,
					output stand, crouch, jump, kick, punch, flip, shoot, block, crouchpunch);
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size;
	 logic [9:0] jump_velocity;
	 logic jump_on_ground, ground;
	 logic [7:0] b3,b2,b1,b0, l0, l1, l2, l3;
    assign b3 = keycode[31:24];
    assign b2 = keycode[23:16];
    assign b1 = keycode[15:8];
    assign b0 = keycode[7:0];
	 
    parameter [9:0] Ball_X_Center=150;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=260;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

	 
    assign Ball_Size = 128;
	
  
	always_ff @ (posedge Reset or posedge frame_clk ) begin: Move_Ball
	  if (Reset)  // Asynchronous Reset
	  begin 
			Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
			Ball_Y_Pos <= Ball_Y_Center;
			Ball_X_Pos <= Ball_X_Center;
	  end

	  else if(start)
	  begin 
			stand <= 1;
			crouch <= 0;
			jump <= 0;
			kick <= 0;
			punch <= 0;
			shoot <= 0;
			block <= 0;
			crouchpunch <= 0;
			Ball_Y_Motion <= 0;
			Ball_X_Motion <= 0;
			flip <= 0;
			if((Ball_X_Pos+10)<SpriteX2)
				flip <= 1;
//player1 keycodes ------------------------------------------------------------------------------------------

			if(((l3 == 8'h1A && b2 == 8'h07) || (l3 == 8'h1A && b1 == 8'h07) || (l3 == 8'h1A && b0 == 8'h07) ||
                (l2 == 8'h1A && b1 == 8'h07) || (l2 == 8'h1A && b0 == 8'h07) ||
                (l1 == 8'h1A && b0 == 8'h07) || 
                (b3 == 8'h07 && l2 == 8'h1A) || (b3 == 8'h07 && l1 == 8'h1A) || (b3 == 8'h07 && l0 == 8'h1A) ||
                (b2 == 8'h07 && l1 == 8'h1A) || (b2 == 8'h07 && l0 == 8'h1A) ||
                (b1 == 8'h07 && l0 == 8'h1A))) // W + D, D + W
				begin
            if(jump_on_ground)
              stand <= 1;
            else
            begin
              stand <= 0;
              jump <= 1;
            end
            Ball_Y_Motion <= jump_velocity;
            Ball_X_Motion <= 2;
        end
			else if(((l3 == 8'h1A && b2 == 8'h04) || (l3 == 8'h1A && b1 == 8'h04) || (l3 == 8'h1A && b0 == 8'h04) ||
                (l2 == 8'h1A && b1 == 8'h04) || (l2 == 8'h1A && b0 == 8'h04) ||
                (l1 == 8'h1A && b0 == 8'h04) ||
                (b3 == 8'h04 && l2 == 8'h1A) || (b3 == 8'h04 && l1 == 8'h1A) || (b3 == 8'h04 && l0 == 8'h1A) ||
                (b2 == 8'h04 && l1 == 8'h1A) || (b2 == 8'h04 && l0 == 8'h1A) ||
                (b1 == 8'h04 && l0 == 8'h1A))) // W + A, A + W
				begin
//            if (Ball_X_Pos > 10) begin
              if(jump_on_ground)
                stand <= 1;
              else
              begin
                stand <= 0;
                jump <= 1;
              end
              Ball_Y_Motion <= jump_velocity;
              Ball_X_Motion <= -2; 
//            end
//            else begin
//              Ball_X_Motion <= 0;
//              Ball_Y_Motion <= 0;
//            end
        end






			else if(ground && (b3 == 8'h07 || b2 == 8'h07 || b1 == 8'h07 || b0 == 8'h07)) begin
				 stand <= 1;
				 if (Ball_X_Pos < 550) begin
					 Ball_X_Motion <= 2;//D
					 Ball_Y_Motion <= 0;
				 end
				 else begin
					 Ball_X_Motion <= 0;//D
					 Ball_Y_Motion <= 0;
				 end
			end
		  else if(ground && (b3 == 8'h04 || b2 == 8'h04 || b1 == 8'h04 || b0 == 8'h04)) begin // A
			 stand <= 1;
			 if (Ball_X_Pos > 30) begin
				 Ball_X_Motion <= -2;//A
				 Ball_Y_Motion<= 0;
			 end
			 else begin
				 Ball_X_Motion <= 0;//A
				 Ball_Y_Motion<= 0;
			 end
		  end

			else if(ground && (b3 == 8'h16 || b2 == 8'h16 || b1 == 8'h16 || b0 == 8'h16)) begin
				 crouch <= 1;
				 stand <= 0;
				 if (Ball_Y_Pos < 400) begin
					Ball_Y_Motion <= 0;//S
					Ball_X_Motion <= 0;
				 end
				 else begin
					 Ball_Y_Motion <= 0;//S
					 Ball_X_Motion <= 0;
				 end
			end
			else if(ground && (b3 == 8'h14 || b2 == 8'h14 || b1 == 8'h14 || b0 == 8'h14)) begin
				 kick <= 1;
				 stand <= 0;
//				 shoot <= 1;
				 Ball_X_Motion <= 0;//Q
				 Ball_Y_Motion<= 0;
			end
			
			else if(ground && (b3 == 8'h08 || b2 == 8'h08 || b1 == 8'h08 || b0 == 8'h08)) begin
				 punch <= 1;
				 stand <= 0;
				 Ball_X_Motion <= 0;//E
				 Ball_Y_Motion<= 0;
			end

			else if(ground && (b3 == 8'h15 || b2 == 8'h15 || b1 == 8'h15 || b0 == 8'h15)) begin
				 stand <= 0;
				 shoot <= 1;
				 crouchpunch <= 1;
				 Ball_X_Motion <= 0; //R
				 Ball_Y_Motion<= 0;
			end

			
        else if(ground && (b3 == 8'h09 || b2 == 8'h09 || b1 == 8'h09 || b0 == 8'h09))
        begin
            block <= 1;
            stand <= 0;
            Ball_X_Motion <= 0;
            Ball_Y_Motion<= 0;
        end
		  
		  
		  else if(l3 == 8'h1A || l2 == 8'h1A || l1 == 8'h1A || l0 == 8'h1A) begin // W
            if(jump_on_ground)
              stand <= 1;
            else
            begin
              stand <= 0;
              jump <= 1;
            end
            Ball_Y_Motion <= jump_velocity;
            Ball_X_Motion <= 0;
		  end



		  Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion); // Update ball position
		  Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
		  
	 end
	 else begin
		stand <= 1;
		crouch <= 0;
		jump <= 0;
		kick <= 0;
		punch <= 0;
		shoot <= 0;
		block <= 0;
		Ball_Y_Motion <= 0;
		Ball_X_Motion <= 0;
		if((Ball_X_Pos+10)<SpriteX2)
			flip <= 1;
		Ball_X_Motion <= 0;
		Ball_Y_Motion <= 0;
	 end
	end


       
    assign SpriteX = Ball_X_Pos;
    assign SpriteY = Ball_Y_Pos;
    assign SpriteS = Ball_Size;


	 jump_fsm j_fsm (.Clk(frame_clk), .Reset(Reset), .jumping(jump), .jump_on_ground(jump_on_ground), .on_ground(ground), .velocity(jump_velocity));

	 lastKeyPressedBat last1 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground), .curr_key(b3), .last_key(l3));
	 lastKeyPressedBat last2 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground), .curr_key(b2), .last_key(l2));
	 lastKeyPressedBat last3 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground), .curr_key(b1), .last_key(l1));
	 lastKeyPressedBat last4 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground), .curr_key(b0), .last_key(l0));

	 
endmodule
