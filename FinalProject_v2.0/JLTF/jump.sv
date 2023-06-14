module jump_fsm(input logic Clk, Reset, jumping,
                output logic jump_on_ground, on_ground,
				output logic [9:0] velocity);

enum logic [4:0] {Idle, jump1, jump2, jump3, jump4, jump5, jump6, jump7, jump8,
                        jump9, jump10, jump11, jump12, jump13, jump14, jump15, jump16,
                        fall1, fall2, fall3, fall4, fall5, fall6, fall7, fall8,
                        fall9, fall10, fall11, fall12, fall13, fall14, Done} Curr_state, Next_state;



always_ff @ (posedge Clk)
begin
    if(Reset)
        Curr_state <= Idle;
    else
        Curr_state <= Next_state;
end

always_comb
begin
    jump_on_ground = 0;
    on_ground = 0;
    unique case(Curr_state)
        Idle: if(jumping)
                    Next_state = jump1;
					else
					Next_state = Idle;
        jump1: Next_state = jump2;
        jump2: Next_state = jump3;
        jump3: Next_state = jump4;
        jump4: Next_state = jump5;
        jump5: Next_state = jump6;
        jump6: Next_state = jump7;
        jump7: Next_state = jump8;
        jump8: Next_state = jump9;
        jump9: Next_state = jump10;
        jump10: Next_state = jump11;
        jump11: Next_state = jump12;
        jump12: Next_state = jump13;
        jump13: Next_state = jump14;
        jump14: Next_state = jump15;
        jump15: Next_state = jump16;
        jump16: Next_state = fall1;
        fall1:  Next_state = fall2;
        fall2:  Next_state = fall3;
        fall3:  Next_state = fall4;
        fall4:  Next_state = fall5;
        fall5:  Next_state = fall6;
        fall6:  Next_state = fall7;
        fall7:  Next_state = fall8;
        fall8:  Next_state = fall9;
        fall9:  Next_state = fall10;
        fall10: Next_state = fall11;
        fall11: Next_state = fall12;
        fall12: Next_state = fall13;
        fall13: Next_state = fall14;
        fall14: Next_state = Done;
        Done: if(jumping)
                Next_state = Done;
             else
                Next_state = Idle;
    endcase

    case(Curr_state)
        Idle: begin
            velocity = 0;
            on_ground = 1;
        end
        jump1: velocity = -10;
        jump2: velocity = -10;
        jump3: velocity = -10;
        jump4: velocity = -10;
        jump5: velocity = -8;
        jump6: velocity = -8;
        jump7: velocity = -8;
        jump8: velocity = -6;
        jump9: velocity = -6;
        jump10: velocity = -6;
        jump11: velocity = -4;
        jump12: velocity = -4;
        jump13: velocity = -2;
        jump14: velocity = -2;
        jump15: velocity = 0;
        jump16: velocity = 0;
        fall1: velocity = 2;
        fall2: velocity = 2;
        fall3: velocity = 4;
        fall4: velocity = 4;
        fall5: velocity = 6;
        fall6: velocity = 6;
        fall7: velocity = 6;
        fall8: velocity = 8;
        fall9: velocity = 8;
        fall10: velocity = 8; 
        fall11: velocity = 10;
        fall12: velocity = 10;
        fall13: velocity = 10;
        fall14: velocity = 10;
        Done: begin
            velocity = 0;
            jump_on_ground = 1;
            on_ground = 1;
        end
		  default: ;
    endcase
end


endmodule


module lastKeyPressedBat(input logic Clk, Reset, jump_on_ground,
                        input logic [7:0] curr_key,
                        output logic [7:0] last_key);


    logic [7:0] last_key_reg;

    always_ff @ (posedge Clk)
        begin
            if(Reset)
                last_key_reg <= 0;
            else if(jump_on_ground) 
                last_key_reg <= 0;
            else if(curr_key == 8'h1A)
                last_key_reg <= curr_key;
        end

    assign last_key = last_key_reg;

endmodule

module lastKeyPressedWW(input logic Clk, Reset, jump_on_ground,
                        input logic [7:0] curr_key,
                        output logic [7:0] last_key);


    logic [7:0] last_key_reg;

    always_ff @ (posedge Clk)
        begin
            if(Reset)
                last_key_reg <= 0;
            else if(jump_on_ground) 
                last_key_reg <= 0;
            else if(curr_key == 8'h0C)
                last_key_reg <= curr_key;
        end

    assign last_key = last_key_reg;

endmodule

module lastKeyPressed1(input logic Clk, Reset,
                        input logic [7:0] curr_key,
                        output logic [7:0] last_key);


    logic [7:0] last_key_reg;

    always_ff @ (posedge Clk)
        begin
            if(Reset)
                last_key_reg <= 0;
            else if(curr_key == 8'h1E || curr_key == 8'h1F || curr_key == 8'h20 || curr_key == 8'h21)
                last_key_reg <= curr_key;
        end

    assign last_key = last_key_reg;

endmodule

module lastKeyPressed2(input logic Clk, Reset, p1choice,
                        input logic [7:0] curr_key,
                        output logic [7:0] last_key);


    logic [7:0] last_key_reg;

    always_ff @ (posedge Clk)
        begin
            if(Reset)
                last_key_reg <= 0;
            else if(curr_key == p1choice)
                last_key_reg <= 0;
            else if(curr_key == 8'h1E || curr_key == 8'h1F || curr_key == 8'h20 || curr_key == 8'h21)
                last_key_reg <= curr_key;
        end

    assign last_key = last_key_reg;

endmodule
