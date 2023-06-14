
module  playermovement2 ( input Reset, frame_clk, collision, start,
					input [31:0] keycode,
               output [9:0] SpriteX2, SpriteY2, SpriteS2,
					output stand2, crouch2, jump2, kick2, punch2, shoot2, block2, crouchpunch2);
    
    logic [9:0] Ball_X_Pos2, Ball_X_Motion2, Ball_Y_Pos2, Ball_Y_Motion2, Ball_Size2;
	 logic [9:0] jump_velocity2;
	 logic jump_on_ground2, ground2;
	 logic [7:0] b3,b2,b1,b0, l0, l1, l2, l3;
    assign b3 = keycode[31:24];
    assign b2 = keycode[23:16];
    assign b1 = keycode[15:8];
    assign b0 = keycode[7:0];
	 


    parameter [9:0] Ball_X_Center2=400;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center2=270;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min2=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max2=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min2=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max2=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step2=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step2=1;      // Step size on the Y axis
	 
    assign Ball_Size2 = 128;		
	
  
	always_ff @ (posedge Reset or posedge frame_clk ) begin: Move_Ball
	  if (Reset)  // Asynchronous Reset
	  begin 
			
			Ball_Y_Motion2 <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion2 <= 10'd0; //Ball_X_Step;
			Ball_Y_Pos2 <= Ball_Y_Center2;
			Ball_X_Pos2 <= Ball_X_Center2;
	  end

	  else if(start)
	  begin 

			stand2 <= 1;
			crouch2 <= 0;
			crouchpunch2 <= 0;
			jump2 <= 0;
			kick2 <= 0;
			punch2 <= 0;
			shoot2 <= 0;
			block2 <= 0;
			Ball_Y_Motion2 <= 0;
			Ball_X_Motion2 <= 0;
		  
//player2 keycodes-------------------------------------------------------------------------------------

			if((l3 == 8'h0C && b2 == 8'h0F) || (l3 == 8'h0C && b1 == 8'h0F) || (l3 == 8'h0C && b0 == 8'h0F) ||
                (l2 == 8'h0C && b1 == 8'h0F) || (l2 == 8'h0C && b0 == 8'h0F) ||
                (l1 == 8'h0C && b0 == 8'h0F) ||
                (b3 == 8'h0F && l2 == 8'h0C) || (b3 == 8'h0F && l1 == 8'h0C) || (b3 == 8'h0F && l0 == 8'h0C) ||
                (b2 == 8'h0F && l1 == 8'h0C) || (b2 == 8'h0F && l0 == 8'h0C) ||
                (b1 == 8'h0F && l0 == 8'h0C)) begin
            if(jump_on_ground2)
              stand2 <= 1;
            else
            begin
              stand2 <= 0;
              jump2 <= 1;
            end
            Ball_Y_Motion2 <= jump_velocity2;
            Ball_X_Motion2 <= 2; 
			end
			else if(((b3 == 8'h0D && l2 == 8'h0C) || (b3 == 8'h0D && l1 == 8'h0C) || (b3 == 8'h0D && l0 == 8'h0C) ||
                (b2 == 8'h0D && l1 == 8'h0C) || (b2 == 8'h0D && l0 == 8'h0C) ||
                (b1 == 8'h0D && l0 == 8'h0C) ||
                (l3 == 8'h0C && b2 == 8'h0D) || (l3 == 8'h0C && b1 == 8'h0D) || (l3 == 8'h0C && b0 == 8'h0D) ||
                (l2 == 8'h0C && b1 == 8'h0D) || (l2 == 8'h0C && b0 == 8'h0D) ||
                (l1 == 8'h0C && b0 == 8'h0D)))
			begin
            if(jump_on_ground2)
              stand2 <= 1;
            else
            begin
              stand2 <= 0;
              jump2 <= 1;
            end
            Ball_Y_Motion2 <= jump_velocity2;
            Ball_X_Motion2 <= -2; 
			end

			else if(ground2 && (b3 == 8'h0D || b2 == 8'h0D || b1 == 8'h0D || b0 == 8'h0D)) //J
			begin
				 stand2 <= 1;
				 if (Ball_X_Pos2 > 30) begin
					 Ball_X_Motion2 <= -2;//A
					 Ball_Y_Motion2 <= 0;
				 end
				 else begin
					 Ball_X_Motion2 <= 0;//A
					 Ball_Y_Motion2 <= 0;
				 end
			end

			else if(ground2 && (b3 == 8'h0F || b2 == 8'h0F || b1 == 8'h0F || b0 == 8'h0F)) //L
			begin
				 stand2 <= 1;
				 if (Ball_X_Pos2 < 550) begin
					 Ball_X_Motion2 <= 2;//D
					 Ball_Y_Motion2 <= 0;
				 end
				 else begin
					 Ball_X_Motion2 <= 0;//D
					 Ball_Y_Motion2 <= 0;
				 end
			end

			else if(ground2 && (b3 == 8'h0E || b2 == 8'h0E || b1 == 8'h0E || b0 == 8'h0E)) //K
			begin
				 crouch2 <= 1;
				 stand2 <= 0;
				 if (Ball_Y_Pos2 < 400) begin
					Ball_Y_Motion2 <= 0;//S
					Ball_X_Motion2 <= 0;
				 end
				 else begin
					 Ball_Y_Motion2 <= 0;//S
					 Ball_X_Motion2 <= 0;
				 end
			end
			
			else if(ground2 && (b3 == 8'h18 || b2 == 8'h18 || b1 == 8'h18 || b0 == 8'h18)) //U 
			begin
				 kick2 <= 1;
				 stand2 <= 0;
				 Ball_X_Motion2 <= 0;//Q
				 Ball_Y_Motion2 <= 0;
			end
			
			else if(ground2 && (b3 == 8'h12 || b2 == 8'h12 || b1 == 8'h12 || b0 == 8'h12)) //O 
			begin
				 punch2 <= 1;
				 stand2 <= 0;
				 Ball_X_Motion2 <= 0;
				 Ball_Y_Motion2 <= 0;
			end

			else if(ground2 && (b3 == 8'h1C || b2 == 8'h1C || b1 == 8'h1C || b0 == 8'h1C)) begin
				 stand2 <= 0;
				 shoot2 <= 1;
				 crouchpunch2 <= 1;
				 Ball_X_Motion2 <= 0; //Y
				 Ball_Y_Motion2 <= 0;
			end
        else if(ground2 && (b3 == 8'h0B || b2 == 8'h0B || b1 == 8'h0B || b0 == 8'h0B)) // H
        begin
            block2 <= 1;
            stand2 <= 0;
            Ball_X_Motion2 <= 0;
            Ball_Y_Motion2<= 0;
        end
		  else if(l0 == 8'h0C || l1 == 8'h0C || l2 == 8'h0C || l3 == 8'h0C) // I
		  begin
            if(jump_on_ground2)
              stand2 <= 1;
            else
            begin
              stand2 <= 0;
              jump2 <= 1;
            end
            Ball_Y_Motion2 <= jump_velocity2;
            Ball_X_Motion2 <= 0;

		  end
		  
		  Ball_Y_Pos2 <= (Ball_Y_Pos2 + Ball_Y_Motion2); // Update ball position
		  Ball_X_Pos2 <= (Ball_X_Pos2 + Ball_X_Motion2);
	 end
	 else begin
		stand2 <= 1;
		crouch2 <= 0;
		jump2 <= 0;
		kick2 <= 0;
		punch2 <= 0;
		shoot2 <= 0;
		block2 <= 0;
		Ball_Y_Motion2 <= 0;
		Ball_X_Motion2 <= 0;	 
	 end
	 
	end

	 
    assign SpriteX2 = Ball_X_Pos2;
    assign SpriteY2 = Ball_Y_Pos2;
    assign SpriteS2 = Ball_Size2;

	 jump_fsm j_fsm2 (.Clk(frame_clk), .Reset(Reset), .jumping(jump2), .jump_on_ground(jump_on_ground2), .on_ground(ground2), .velocity(jump_velocity2));

	 lastKeyPressedWW l5 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground2), .curr_key(b3), .last_key(l3));
	 lastKeyPressedWW l6 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground2), .curr_key(b2), .last_key(l2));
	 lastKeyPressedWW l7 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground2), .curr_key(b1), .last_key(l1));
	 lastKeyPressedWW l8 (.Clk(frame_clk), .Reset(Reset), .jump_on_ground(jump_on_ground2), .curr_key(b0), .last_key(l0));
	 
endmodule
