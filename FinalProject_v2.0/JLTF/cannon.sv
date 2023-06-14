module  cannon ( input Reset, frame_clk, ballcollision, ballcollision2, shoot, shoot2,startscreen,flying,flying2,flip, input [9:0] SpriteX, SpriteX2, input [31:0] keycode,
               output [9:0]  BallX, BallY, BallX2, BallY2 );
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size, Ball_X_Pos2, Ball_X_Motion2, Ball_Y_Pos2, Ball_Y_Motion2, Ball_Size2;
	 
//    parameter [9:0] Ball_X_Center=200;
    parameter [9:0] Ball_Y_Center=340;
    parameter [9:0] Ball_X_Min=0;
    parameter [9:0] Ball_X_Max=639;
    parameter [9:0] Ball_Y_Min=0;
    parameter [9:0] Ball_Y_Max=479;
    parameter [9:0] Ball_X_Step=1;
    parameter [9:0] Ball_Y_Step=1;
	 
//    parameter [9:0] Ball_X_Center2=500;
    parameter [9:0] Ball_Y_Center2=340;
    parameter [9:0] Ball_X_Min2=0;
    parameter [9:0] Ball_X_Max2=639;
    parameter [9:0] Ball_Y_Min2=0;
    parameter [9:0] Ball_Y_Max2=479;
    parameter [9:0] Ball_X_Step2=1;
    parameter [9:0] Ball_Y_Step2=1;
	 
    assign Ball_Size = 4;
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
		  if(Reset) begin
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;		
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= (SpriteX + 40);		
		  end

//		  else if (Ball_X_Pos > 630) begin
//            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
//				Ball_X_Motion <= 10'd0; //Ball_X_Step;		
//				Ball_Y_Pos <= Ball_Y_Center;
//				Ball_X_Pos <= SpriteX;		  
//		  end
        else if(flying)
		  begin 
				if(flip) begin
					Ball_X_Motion <= 5;
					Ball_Y_Motion <= 0;
				end
			  else begin
					Ball_X_Motion <= -5;
					Ball_Y_Motion <= 0;
			  end
			  	Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
		  end  
        else //if (ballcollision || Ball_X_Pos > 630 || startscreen)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;		
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= (SpriteX + 40);	
        end
    end
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball2
		  if(Reset) begin
            Ball_Y_Motion2 <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion2 <= 10'd0; //Ball_X_Step;		
				Ball_Y_Pos2 <= Ball_Y_Center2;
				Ball_X_Pos2 <= (SpriteX2 + 40);		
		  end
        else if(flying2)
		  begin 
				if(flip) begin
				Ball_X_Motion2 <= -5;
				Ball_Y_Motion2 <= 0;
				end
			  else begin
					Ball_X_Motion2 <= 5;
					Ball_Y_Motion2 <= 0;
			  end
			  	Ball_Y_Pos2 <= (Ball_Y_Pos2 + Ball_Y_Motion2);  // Update ball position
				Ball_X_Pos2 <= (Ball_X_Pos2 + Ball_X_Motion2);
		  end  
        else //if (ballcollision || Ball_X_Pos > 630 || startscreen)  // Asynchronous Reset
        begin 
            Ball_Y_Motion2 <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion2 <= 10'd0; //Ball_X_Step;		
				Ball_Y_Pos2 <= Ball_Y_Center2;
				Ball_X_Pos2 <= (SpriteX2 + 40);	
        end
		  
    end
	 
    assign BallX = Ball_X_Pos;
    assign BallY = Ball_Y_Pos;
    assign BallS = Ball_Size;
	 
    assign BallX2 = Ball_X_Pos2;
    assign BallY2 = Ball_Y_Pos2;
    assign BallS2 = Ball_Size2;

endmodule
