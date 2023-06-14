
module  color_mapper ( input [9:0] spritex, spritey, spritex2, spritey2, DrawX, DrawY, sprite_size, sprite_size2, BallX, BallY, BallX2, BallY2,
							  input [31:0] keycode,
							  input pixel_Clk, frame_clk, blank, Reset, crouch, crouchpunch, stand, jump, kick, punch, crouchpunch2, crouch2, stand2, jump2, kick2, punch2, flip, shoot, shoot2,block,block2,
                       output logic [3:0]  Red, Green, Blue,
							  output logic collision, ballcollision, ballcollision2,startscreen,flying,flying2,start, gameover, gameover2);
    
    logic sprite_on, sprite_on2, bar1, bar2, countdown3, countdown2, countdown1, fight, background_on, ball_on, ball_on2;
	 logic animation, animation2, shootready, shootready2 ;
	 int unsigned barlength1, barlength2, special_length1, special_length2;
	 logic [3:0] red1, green1, blue1, red2, green2, blue2, background_red, background_green, background_blue, graphics_red, graphics_green, graphics_blue;
	 logic characterselect, one_1, two_1, three_1, four_1, one_2, two_2, three_2, four_2;
	 logic [7:0] p1choice, p2choice;

    int unsigned DistX, DistY, Size, DistX2, DistY2, Size2, DistX_ball, DistY_ball, DistX_ball2, DistY_ball2;
	 assign DistX = DrawX - spritex;
    assign DistY = DrawY - spritey;
    assign Size = sprite_size;
	 assign DistX2 = DrawX - spritex2;
    assign DistY2 = DrawY - spritey2;
    assign Size2 = sprite_size2;
	 assign DistX_ball = DrawX - BallX;
    assign DistY_ball = DrawY - BallY;
	 assign DistX_ball2 = DrawX - BallX2;
    assign DistY_ball2 = DrawY - BallY2;
	 
    always_comb
    begin:player1
        if (DistX < Size & DistY < Size && (red1 < 4'h6 || green1 > 4'h1 || blue1 < 4'h7)) begin //&& (red1 != 4'h6 || green1 != 4'h0 || blue1 != 4'h7)
            sprite_on = 1'b1;
		  end
		  else begin
            sprite_on = 1'b0;
		  end
     end 

    always_comb
    begin:player2
        if (DistX2 < Size2 & DistY2 < Size2 && (red2 < 4'h8 || green2 > 4'h1 || blue2 < 4'h5)) begin
            sprite_on2 = 1'b1;
		  end
		  else begin
            sprite_on2 = 1'b0;
		  end
    end 

    always_comb
    begin:collide
        if (sprite_on == 1'b1 && sprite_on2 == 1'b1) begin
            collision = 1'b1;
		  end
		  else begin
            collision = 1'b0;
		  end
    end 

 
    always_comb
    begin:Ball1
        if ((( DistX_ball*DistX_ball + DistY_ball*DistY_ball) <= (8 * 8))) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
    end 
    always_comb
    begin:Ball2
        if ((( DistX_ball2*DistX_ball2 + DistY_ball2*DistY_ball2) <= (8 * 8)))
            ball_on2 = 1'b1;
        else 
            ball_on2 = 1'b0;
    end 
    always_comb
    begin:ballcollide
        if (ball_on == 1'b1 && sprite_on2 == 1'b1 && flying) begin
            ballcollision = 1'b1;
		  end
		  else begin
            ballcollision = 1'b0;
		  end
    end 
    always_comb
    begin:ballcollide2
        if (sprite_on == 1'b1 && ball_on2 == 1'b1 && flying2) begin
            ballcollision2 = 1'b1;
		  end
		  else begin
            ballcollision2 = 1'b0;
		  end
    end	 

	 
	 // setting the RGB values
    always_comb
    begin:RGB_Display
		  if(!blank)
		  begin
			Red = 4'h0;
			Green = 4'h0;
			Blue = 4'h0;
		  end
		  
		  if(startscreen) begin
			Red = background_red;
			Green = background_green; // startscreen
			Blue = background_blue;
		  end
		  else if(characterselect) begin
			Red = background_red;
			Green = background_green; // characterselect
			Blue = background_blue;
		  end
		  else if(countdown3 && (DrawX >= 256 && DrawX <= 383 && DrawY >= 150 && DrawY <=277) && (graphics_red != 4'h0 || graphics_green != 4'hE || graphics_blue != 4'h0)) begin
			Red = graphics_red;
			Green = graphics_green; // countdown3
			Blue = graphics_blue;
		  end
		  else if(countdown2 && (DrawX >= 256 && DrawX <= 383 && DrawY >= 150 && DrawY <=277) && (graphics_red != 4'h0 || graphics_green != 4'hE || graphics_blue != 4'h0)) begin
			Red = graphics_red;
			Green = graphics_green; // countdown2
			Blue = graphics_blue;
		  end
		  else if(countdown1 && (DrawX >= 256 && DrawX <= 383 && DrawY >= 150 && DrawY <=277) && (graphics_red != 4'h0 || graphics_green != 4'hE || graphics_blue != 4'h0)) begin
			Red = graphics_red;
			Green = graphics_green; // countdown1
			Blue = graphics_blue;
		  end
		  else if(fight && (DrawX >= 220 && DrawX <= 419 && DrawY >= 150 && DrawY <=249) && (graphics_red != 4'h0 || graphics_green != 4'hE || graphics_blue != 4'h0)) begin
			Red = graphics_red;
			Green = graphics_green; // fight!
			Blue = graphics_blue;
		  end
		  else if((gameover || gameover2) && (DrawX >= 120 && DrawX <= 519 && DrawY >= 150 && DrawY <=349) && (graphics_red <= 4'h9 || graphics_green != 4'h0 || graphics_blue <= 4'h9)) begin
            Red = graphics_red; 
            Green = graphics_green;
            Blue = graphics_blue;
		  end
		  else if((sprite_on == 1'b1)) begin // player1
				Red = red1;
				Green = green1;
				Blue = blue1;
		  end
		  else if ((sprite_on2 == 1'b1)) begin // player2
				Red = red2;
				Green = green2;
				Blue = blue2;
		  end
		  else if ((DrawX >= 10 && DrawX <= (barlength1+9) && DrawY >= 30 && DrawY <=50) || (DrawX >= (430+200-barlength2) && DrawX <= 629 && DrawY >= 30 && DrawY <=50)) begin // healthbar1 & healthbar2
				Red = 4'h0;
				Green = 4'hF; // healthbars
				Blue = 4'h0;
		  end
		  else if ((DrawX>= 10 && DrawX<=209 && DrawY>= 30 && DrawY<=50) || DrawX>=430 && DrawX<=629 && DrawY>=30 && DrawY<=50) begin
				Red = 4'hF;
				Green = 4'h0;
				Blue = 4'h0;
		  end
		  else if((DrawX >= 9 && DrawX <= 210 && DrawY >= 29 && DrawY <=51) || (DrawX >= 429 && DrawX <= 630 && DrawY >= 29 && DrawY <=51)) begin
				Red = 4'h0;
				Green = 4'h0; // healthbar outline
				Blue = 4'h0;
		  end
		  else if ((DrawX>=10 && DrawX<=(special_length1+9) && DrawY>=51 && DrawY<=60) || (DrawX>=(430+200-special_length2) && DrawX <= 629 && DrawY >= 51 && DrawY <=60)) begin
				Red = 4'h0;
				Green = 4'hF; // special attack bars
				Blue = 4'hF;
		  end
        else if ((ball_on == 1'b1) && flying) 
        begin 
				Red = 4'hF;
				Green = 4'h0;
				Blue = 4'h0;
        end
        else if ((ball_on2 == 1'b1) && flying2) 
        begin 
				Red = 4'hF;
				Green = 4'h0;
				Blue = 4'h0;
        end   
        else 
        begin 
            Red = background_red; // background
            Green = background_green;
            Blue = background_blue;
        end      
    end 
	 

	healthbar healthbar1(.pixel_Clk(pixel_Clk), .Reset(Reset), .kick(kick), .punch(punch), .collision(collision), .ballcollision(ballcollision),.block(block2), .length(barlength2), .gameover(gameover));
	healthbar healthbar2(.pixel_Clk(pixel_Clk), .Reset(Reset), .kick(kick2), .punch(punch2), .collision(collision), .ballcollision(ballcollision2),.block(block), .length(barlength1), .gameover(gameover2));

	player1_example player_1 (.DrawX(DrawX), .DrawY(DrawY), .vga_clk(pixel_Clk), .blank(blank), .spritex(spritex), .spritey(spritey), .red(red1), .green(green1), .blue(blue1), .batchoose(one_1), .wwchoose(three_1), .despchoose(two_1), .zfochoose(four_1),
			.stand(stand), .crouch(crouch), .jump(jump), .kick(kick), .punch(punch), .flip(flip), .crouchpunch(crouchpunch), .move(animation), .block(block), .dead(gameover2));

	player2_example player_2 (.DrawX(DrawX), .DrawY(DrawY), .vga_clk(pixel_Clk), .blank(blank), .spritex(spritex2), .spritey(spritey2), .red(red2), .green(green2), .blue(blue2), .batchoose(one_2), .wwchoose(three_2), .despchoose(two_2), .zfochoose(four_2),
			.stand(stand2), .crouch(crouch2), .jump(jump2), .kick(kick2), .punch(punch2), .flip(flip), .crouchpunch(crouchpunch2), .move(animation2), .block(block2), .dead(gameover));
	
	characterpicker cp1 (.choice(p1choice), .one(one_1), .two(two_1), .three(three_1), .four(four_1));

	characterpicker cp2(.choice(p2choice), .one(one_2), .two(two_2), .three(three_2), .four(four_2));
											
	background_example background(.DrawX(DrawX), .DrawY(DrawY), .vga_clk(pixel_Clk), .blank(blank),
		.red(background_red), .green(background_green), .blue(background_blue), .startscreen(startscreen), .characterselect(characterselect)
		);
	
	graphics grphs(.vga_clk(pixel_Clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .countdown3(countdown3), .countdown2(countdown2), .countdown1(countdown1), .fight(fight),
		.red(graphics_red), .green(graphics_green), .blue(graphics_blue), .ko(gameover || gameover2));
		
	animation a1(.frame_clk(frame_clk), .Reset(Reset), .stand(stand), .stand2(stand2), .move(animation), .move2(animation2));	

	initialscreen screen (.frame_clk(frame_clk), .Reset(Reset), .keycode(keycode), .startscreen(startscreen), .characterselect(characterselect), .p1choice(p1choice), .p2choice(p2choice),
					.countdown3(countdown3), .countdown2(countdown2), .countdown1(countdown1), .fight(fight), .background_on(background_on), .start(start), .ko(gameover || gameover2));
						
	specialattack sa1(.frame_clk(frame_clk), .Reset(Reset), .shoot(shoot), .start(start), .shootready(shootready), .length(special_length1));
	specialattack sa2(.frame_clk(frame_clk), .Reset(Reset), .shoot(shoot2), .start(start), .shootready(shootready2), .length(special_length2));

	ballflying bf1(.frame_clk(frame_clk), .Reset(Reset), .shootready(shootready), .shoot(shoot), .flip(flip), .sprite_pos(spritex2), .ball_pos(BallX), .flying(flying));
	ballflying2 bf2(.frame_clk(frame_clk), .Reset(Reset), .shootready(shootready2), .shoot(shoot2), .flip(flip),.sprite_pos(spritex), .ball_pos(BallX2), .flying(flying2));

endmodule
