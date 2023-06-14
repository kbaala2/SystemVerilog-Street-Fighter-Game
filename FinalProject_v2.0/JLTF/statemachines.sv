//Two-always example for state machine
//state machine for character animation

module animation (input frame_clk, Reset, stand, stand2,
						output logic move, move2);

   enum logic [1:0] {A,B,C}   curr_state, next_state; 
	logic [5:0] counter, counter_next; 
		
   always_ff @ (posedge frame_clk or posedge Reset)  
    begin
        if (Reset)begin
            curr_state <= A;
				counter <= 0;
			end			
        else begin
            curr_state <= next_state;
				counter <= counter_next;
		  end
    end
	always_comb
    begin        
        unique case (curr_state) 
            A : if(counter < 20 && (stand||stand2))
						next_state = A;
					 else
						next_state = B;
								
            B : if(counter < 40 && (stand||stand2))
						next_state = B;
					 else
						next_state = C;
									
            C : next_state = A;
        endcase
   
        case (curr_state) 
	   	   A: 
	         begin
					move = 0;
					move2 = 0;
					counter_next = counter + 1;
		      end
				
	   	   B: 
		      begin
					move = 1;
					move2 = 1;
					counter_next = counter + 1;
		      end
				
	   	   C: 
		      begin
					move = 0;
					move2 = 0;
					counter_next = 0;
		      end
				
				
	   	   default:;
        endcase
    end
endmodule




// state machine for the starting screen ------------------------------------------------------------------

module initialscreen (input frame_clk, Reset, ko,
							input [31:0] keycode,
							output logic background_on, startscreen, characterselect, countdown3, countdown2, countdown1, fight, start,
							output logic [7:0] p1choice, p2choice);

	// lastKeyPressed1 (.Clk(frame_clk), .Reset(Reset), .curr_key(keycode[31:24]), .last_key(p1choice));

	// lastKeyPressed2 (.Clk(frame_clk), .Reset(Reset), .p1choice(p1choice), .curr_key(keycode[31:24]), .last_key(p2choice));

   enum logic [3:0] {starting, p1s, p1sp, p2s, p2sp, c3, c2, c1, fighting, playing, done}   curr_state, next_state; 
	logic [7:0] counter, counter_next; 
		
   always_ff @ (posedge frame_clk or posedge Reset)  
    begin
        if (Reset)begin
            curr_state <= starting;
				counter <= 0;
			end			
        else begin
            curr_state <= next_state;
				counter <= counter_next;
		  end
    end

	always_ff @(posedge frame_clk or posedge Reset)
	begin
		if(Reset)begin
			p1choice <= 0;
			p2choice <= 0;
		end
		else if(curr_state == p1s)
			p1choice <= keycode[31:24];
		else if(curr_state == p2s)
			p2choice <= keycode[31:24];
	end

	always_comb
    begin        
        unique case (curr_state) 
			starting : if(keycode == 32'h28000000)
							next_state = p1s;
						else
							next_state = starting;
			p1s : if(keycode == 32'h1E000000 || keycode == 32'h1F000000 || keycode == 32'h20000000 || keycode == 32'h21000000)
					next_state = p1sp;
				  else
				  	next_state = p1s;

			p1sp : if(keycode != 32'h1E000000 && keycode != 32'h1F000000 && keycode != 32'h20000000 && keycode != 32'h21000000)
					next_state = p2s;
				  else
				  	next_state = p1sp;

			p2s : if(keycode[31:24] != p1choice && (keycode == 32'h1E000000 || keycode == 32'h1F000000 || keycode == 32'h20000000 || keycode == 32'h21000000))
					next_state = p2sp;
				  else
				  	next_state = p2s;

			p2sp : if(keycode != 32'h1E000000 && keycode != 32'h1F000000 && keycode != 32'h20000000 && keycode != 32'h21000000)
					next_state = c3;
				  else
				  	next_state = p2sp;

            c3 : if(counter < 60)
						next_state = c3;
					 else
						next_state = c2;
								
            c2 : if(counter < 120)
						next_state = c2;
					 else
						next_state = c1;
									
            c1 : if(counter < 180)
						next_state = c1;
					 else
						next_state = fighting;
            fighting : if(counter < 240)
								next_state = fighting;
							  else
								next_state = playing;
				playing : if(!ko)
								next_state = playing;
							 else
								next_state = done;
				done: next_state = done;
        endcase
   
        case (curr_state) 
				
				starting: 
	         begin
				startscreen = 1;
				characterselect = 0;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = 0;
				background_on = 0;
				start = 0;
		      end

				p1s: 
	         begin
				startscreen = 0;
				characterselect = 1;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = 0;
				background_on = 0;
				start = 0;
		      end

				p1sp: 
	         begin
				startscreen = 0;
				characterselect = 1;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = 0;
				background_on = 0;
				start = 0;
		      end

				p2s: 
	         begin
				startscreen = 0;
				characterselect = 1;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = 0;
				background_on = 0;
				start = 0;
		      end

				p2sp: 
	         begin
				startscreen = 0;
				characterselect = 1;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = 0;
				background_on = 0;
				start = 0;
		      end
				
				c3: 
	         begin
				startscreen = 0;
				characterselect = 0;
				countdown3 = 1;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = counter + 1;
				background_on = 1;
				start = 0;
		      end
				
	   	   c2: 
		      begin
				startscreen = 0;
				characterselect = 0;
				countdown3 = 0;
				countdown2 = 1;
				countdown1 = 0;
				fight = 0;
				counter_next = counter + 1;
				background_on = 1;
				start = 0;
		      end
				
	   	   c1: 
		      begin
				startscreen = 0;
				characterselect = 0;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 1;
				fight = 0;
				counter_next = counter + 1;
				background_on = 1;
				start = 0;
		      end

	   	   fighting: 
		      begin
				startscreen = 0;
				characterselect = 0;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 1;
				counter_next = counter + 1;
				background_on = 1;
				start = 0;
		      end
				
				playing:
				begin
				startscreen = 0;
				characterselect = 0;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = 0;
				background_on = 1;
				start = 1;
				end
				
				done:
				begin
				startscreen = 0;
				characterselect = 0;
				countdown3 = 0;
				countdown2 = 0;
				countdown1 = 0;
				fight = 0;
				counter_next = 0;
				background_on = 1;
				start = 0;
				end
	   	   default:;
        endcase
    end
endmodule


// state machine that outputs the signal for the cannon to fly

module ballflying (input frame_clk, Reset, shootready, shoot, flip, input[9:0] sprite_pos, ball_pos,
						output logic flying);

   enum logic [1:0] {A,B,B2}   curr_state, next_state; 
	logic [5:0] counter, counter_next; 
		
   always_ff @ (posedge frame_clk or posedge Reset)  
    begin
        if (Reset)begin
            curr_state <= A;
				counter <= 0;
			end			
        else begin
            curr_state <= next_state;
				counter <= counter_next;
		  end
    end
	always_comb
    begin        
        unique case (curr_state) 
            A : if(shootready && shoot && flip)
						next_state = B;
					 else if(shootready && shoot && !flip)
						next_state = B2;
					 else
						next_state = A;
								
            B : if(counter < 50  && (ball_pos-60)<sprite_pos)
						next_state = B;
					 else
						next_state = A;
									
            B2 : if(counter < 50  && (ball_pos-60)>sprite_pos)
						next_state = B2;
					 else
						next_state = A;
        endcase
   
        case (curr_state) 
	   	   A: 
	         begin
					flying = 0;
					counter_next = 0;
		      end
				
	   	   B: 
		      begin
					flying = 1;
					counter_next = counter+1;
		      end
				
	   	   B2: 
		      begin
					flying = 1;
					counter_next = counter+1;
		      end
				
				
	   	   default:;
        endcase
    end
endmodule


module ballflying2 (input frame_clk, Reset, shootready, shoot, flip, input[9:0] sprite_pos, ball_pos,
						output logic flying);

   enum logic [1:0] {A,B,B2}   curr_state, next_state; 
	logic [5:0] counter, counter_next; 
		
   always_ff @ (posedge frame_clk or posedge Reset)  
    begin
        if (Reset)begin
            curr_state <= A;
				counter <= 0;
			end			
        else begin
            curr_state <= next_state;
				counter <= counter_next;
		  end
    end
	always_comb
    begin        
        unique case (curr_state) 
            A : if(shootready && shoot && flip)
						next_state = B;
					 else if(shootready && shoot && !flip)
						next_state = B2;
					 else
						next_state = A;
								
            B : if(counter < 50 && (ball_pos-60)>sprite_pos) // && (ball_pos+60)>sprite_pos
						next_state = B;
					 else
						next_state = A;
									
            B2 : if(counter < 50 && (ball_pos-60)<sprite_pos)//&& (ball_pos-60)<sprite_pos 
						next_state = B2;
					 else
						next_state = A;
        endcase
   
        case (curr_state) 
	   	   A: 
	         begin
					flying = 0;
					counter_next = 0;
		      end
				
	   	   B: 
		      begin
					flying = 1;
					counter_next = counter+1;
		      end
				
	   	   B2: 
		      begin
					flying = 1;
					counter_next = counter+1;
		      end
				
				
	   	   default:;
        endcase
    end
endmodule



// state machine for special attacks ------------------------------------------------------------------

module specialattack (input frame_clk, Reset, shoot, start,
								output shootready,	output int unsigned length);
	enum logic [1:0] {A, B, B2, C} curr_state, next_state;
	int unsigned counter, counter_next; 

	always_ff @ (posedge frame_clk or posedge Reset) begin
		if(Reset) begin
			curr_state <= C;
			counter <= 0;
		end
		else begin
			curr_state <= next_state;
			counter <= counter_next;
		end
	end
	
	always_comb
    begin        
        unique case (curr_state) 
            A : if(counter < 800)
						next_state = A;
					 else
						next_state = B;
								
            B : if(shoot)
						next_state = B2;
					 else
						next_state = B;
				B2: if(!shoot)
						next_state = C;
					 else
						next_state = B2;
            C : if(!shoot && start)// 
						next_state = A;
					 else
						next_state = C;
        endcase
   
        case (curr_state) 
	   	   A: 
	         begin
					length = counter >> 2;
					counter_next = counter + 1;
					shootready = 0;
		      end
				
	   	   B: 
		      begin
					length = 200;
					counter_next = counter;
					shootready = 1;
		      end
				
				B2:
				begin
					length = 0;
					counter_next = 0;
					shootready = 1;
				end
				
	   	   C: 
		      begin
					length = 0;
					counter_next = 0;
					shootready = 0;
		      end
				
	   	   default:;
        endcase
    end
endmodule






//state machine for the health bars
//simple state machine to convert a keyboard input to one clock cycle long event

module healthbar (	input pixel_Clk, Reset, kick, punch, collision, ballcollision, block,
						output int unsigned length,
						output logic gameover);

//	   logic [9:0] barlength;
		enum logic [2:0] {A,B,B2,B3,C,C2,D} curr_state, next_state;
		int unsigned length_next;
		always_ff @ (posedge pixel_Clk or posedge Reset) begin
			if (Reset) begin
				curr_state <= A; 
				length <= 200;
			end
			else begin
				curr_state <= next_state;
				length <= length_next;
			end
		end
		always_comb
		 begin        
			  unique case (curr_state) 
					A : next_state = B;
					B : if((kick || punch) && collision && !block)
							next_state = B2;
						 else if(ballcollision && !block)
							next_state = B3;
						 else
							next_state = B;
					B2: if(length > 10)
							next_state = C;
						 else
							next_state = D;	
					B3: if(length > 20)
							next_state = C2;
						 else
							next_state = D;
					C : if(!kick && !punch)
							next_state = B;
						 else
							next_state = C;
					C2: if(!ballcollision)
							next_state = B;
						 else
							next_state = C2;
					D : next_state = D;
			  endcase
		
			  case (curr_state) 
					A: 
					begin
						length_next = 200;
						gameover = 1'b0;
					end
					
					B: 
					begin
						length_next = length;
						gameover = 1'b0;
					end
					
					B2:
					begin
						length_next = length - 10;
						gameover = 1'b0;
					end
					B3:
					begin
						length_next = length - 20;
						gameover = 1'b0;					
					end
					C: 
					begin
						length_next = length;
						gameover = 1'b0;
					end
					C2:
					begin
						length_next = length;
						gameover = 1'b0;					
					end
					D:
					begin
						length_next = 0;
						gameover = 1'b1;
					end
					
					default:;
			  endcase
		 end
endmodule

