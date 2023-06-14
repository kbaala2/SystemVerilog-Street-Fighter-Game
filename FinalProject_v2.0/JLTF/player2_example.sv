module player2_example (
	input logic vga_clk,
	input logic [9:0] DrawX, DrawY, spritex, spritey,
	input logic blank, batchoose, despchoose, wwchoose, zfochoose, stand, crouch, jump, kick, punch, flip, crouchpunch, move, block, dead,
	output logic [3:0] red, green, blue
);

logic [11:0] rom_address;
logic [3:0] rom_q_crouch, rom_q_stand, rom_q_jump, rom_q_kick, rom_q_punch, rom_q_crouchpunch, rom_q_move, rom_q_b, rom_q_d,
			rom_q_crouch2, rom_q_stand2, rom_q_jump2, rom_q_kick2, rom_q_punch2, rom_q_crouchpunch2, rom_q_move2, rom_q_b2, rom_q_d2,
			rom_q_crouch3, rom_q_stand3, rom_q_jump3, rom_q_kick3, rom_q_punch3, rom_q_crouchpunch3, rom_q_move3, rom_q_b3, rom_q_d3,
			rom_q_crouch4, rom_q_stand4, rom_q_jump4, rom_q_kick4, rom_q_punch4, rom_q_crouchpunch4, rom_q_move4, rom_q_b4, rom_q_d4;

logic [3:0] crouch_red,crouch_green,crouch_blue,stand_red,stand_green,stand_blue,jump_red,jump_green,jump_blue,kick_red,kick_green,kick_blue,punch_red,punch_green,punch_blue;
logic [3:0] crouchpunch_red, crouchpunch_green, crouchpunch_blue, move_red, move_green, move_blue, br, bg, bb, dr, dg, db;

logic [3:0] crouch_red2,crouch_green2,crouch_blue2,stand_red2,stand_green2,stand_blue2,jump_red2,jump_green2,jump_blue2,kick_red2,kick_green2,kick_blue2,punch_red2,punch_green2,punch_blue2;
logic [3:0] crouchpunch_red2, crouchpunch_green2, crouchpunch_blue2, move_red2, move_green2, move_blue2, br2, bg2, bb2, dr2, dg2, db2;

logic [3:0] crouch_red3,crouch_green3,crouch_blue3,stand_red3,stand_green3,stand_blue3,jump_red3,jump_green3,jump_blue3,kick_red3,kick_green3,kick_blue3,punch_red3,punch_green3,punch_blue3;
logic [3:0] crouchpunch_red3, crouchpunch_green3, crouchpunch_blue3, move_red3, move_green3, move_blue3, br3, bg3, bb3, dr3, dg3, db3;

logic [3:0] crouch_red4,crouch_green4,crouch_blue4,stand_red4,stand_green4,stand_blue4,jump_red4,jump_green4,jump_blue4,kick_red4,kick_green4,kick_blue4,punch_red4,punch_green4,punch_blue4;
logic [3:0] crouchpunch_red4, crouchpunch_green4, crouchpunch_blue4, move_red4, move_green4, move_blue4, br4, bg4, bb4, dr4, dg4, db4;

logic negedge_vga_clk;

// read from ROM on negedge, set pixel on posedge
assign negedge_vga_clk = ~vga_clk;

// address into the rom = (x*xDim)/640 + ((y*yDim)/480) * xDim
// this will stretch out the sprite across the entire screen
always_comb begin
	if(!flip)
		rom_address = ((DrawX - spritex)/2 + ((DrawY-spritey)/2*64));
	else
		rom_address = (63 - (DrawX - spritex)/2 + ((DrawY-spritey)/2*64));
end

always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;

	if(batchoose) begin
	if(blank && dead) begin
		red <= dr;
		green <= dg;
		blue <= db;
	end
	else if (blank && stand && !move) begin
		red <= stand_red;
		green <= stand_green;
		blue <= stand_blue;
	end
	else if(blank && crouch) begin
		red <= crouch_red;
		green <= crouch_green;
		blue <= crouch_blue;
	end
	else if(blank && jump) begin
		red <= jump_red;
		green <= jump_green;
		blue <= jump_blue;
	end
	else if(blank && kick) begin
		red <= kick_red;
		green <= kick_green;
		blue <= kick_blue;
	end
	else if(blank && punch) begin
		red <= punch_red;
		green <= punch_green;
		blue <= punch_blue;
	end
	else if(blank && crouchpunch) begin
		red <= crouchpunch_red;
		green <= crouchpunch_green;
		blue <= crouchpunch_blue;
	end
	else if(blank && move && stand) begin
		red <= move_red;
		green <= move_green;
		blue <= move_blue;
	end
	else if(blank && block) begin
		red <= br;
		green <= bg;
		blue <= bb;
	end
	else if(blank && dead) begin
		red <= dr;
		green <= dg;
		blue <= db;
	end
	end
	// else if(despchoose)begin
	// if(blank && dead) begin
	// 	red <= dr3;
	// 	green <= dg3;
	// 	blue <= db3;
	// end
	// else if (blank && stand && !move) begin
	// 	red <= stand_red3;
	// 	green <= stand_green3;
	// 	blue <= stand_blue3;
	// end
	// else if(blank && crouch) begin
	// 	red <= crouch_red3;
	// 	green <= crouch_green3;
	// 	blue <= crouch_blue3;
	// end
	// else if(blank && jump) begin
	// 	red <= jump_red3;
	// 	green <= jump_green3;
	// 	blue <= jump_blue3;
	// end
	// else if(blank && kick) begin
	// 	red <= kick_red3;
	// 	green <= kick_green3;
	// 	blue <= kick_blue3;
	// end
	// else if(blank && punch) begin
	// 	red <= punch_red3;
	// 	green <= punch_green3;
	// 	blue <= punch_blue3;
	// end
	// else if(blank && crouchpunch) begin
	// 	red <= crouchpunch_red3;
	// 	green <= crouchpunch_green3;
	// 	blue <= crouchpunch_blue3;
	// end
	// else if(blank && move && stand) begin
	// 	red <= move_red3;
	// 	green <= move_green3;
	// 	blue <= move_blue3;
	// end
	// else if(blank && block) begin
	// 	red <= br3;
	// 	green <= bg3;
	// 	blue <= bb3;
	// end
	// else if(blank && dead) begin
	// 	red <= dr3;
	// 	green <= dg3;
	// 	blue <= db3;
	// end
	// end
	else if(wwchoose)begin
	if(blank && dead) begin
		red <= dr2;
		green <= dg2;
		blue <= db2;
	end
	else if (blank && stand && !move) begin
		red <= stand_red2;
		green <= stand_green2;
		blue <= stand_blue2;
	end
	else if(blank && crouch) begin
		red <= crouch_red2;
		green <= crouch_green2;
		blue <= crouch_blue2;
	end
	else if(blank && jump) begin
		red <= jump_red2;
		green <= jump_green2;
		blue <= jump_blue2;
	end
	else if(blank && kick) begin
		red <= kick_red2;
		green <= kick_green2;
		blue <= kick_blue2;
	end
	else if(blank && punch) begin
		red <= punch_red2;
		green <= punch_green2;
		blue <= punch_blue2;
	end
	else if(blank && crouchpunch) begin
		red <= crouchpunch_red2;
		green <= crouchpunch_green2;
		blue <= crouchpunch_blue2;
	end
	else if(blank && move && stand) begin
		red <= move_red2;
		green <= move_green2;
		blue <= move_blue2;
	end
	else if(blank && block) begin
		red <= br2;
		green <= bg2;
		blue <= bb2;
	end
	end
	else if(zfochoose) begin
	if(blank && dead) begin
		red <= dr4;
		green <= dg4;
		blue <= db4;
	end
	else if (blank && stand && !move) begin
		red <= stand_red4;
		green <= stand_green4;
		blue <= stand_blue4;
	end
	else if(blank && crouch) begin
		red <= crouch_red4;
		green <= crouch_green4;
		blue <= crouch_blue4;
	end
	else if(blank && jump) begin
		red <= jump_red4;
		green <= jump_green4;
		blue <= jump_blue4;
	end
	else if(blank && kick) begin
		red <= kick_red4;
		green <= kick_green4;
		blue <= kick_blue4;
	end
	else if(blank && punch) begin
		red <= punch_red4;
		green <= punch_green4;
		blue <= punch_blue4;
	end
	else if(blank && crouchpunch) begin
		red <= crouchpunch_red4;
		green <= crouchpunch_green4;
		blue <= crouchpunch_blue4;
	end
	else if(blank && move && stand) begin
		red <= move_red4;
		green <= move_green4;
		blue <= move_blue4;
	end
	else if(blank && block) begin
		red <= br4;
		green <= bg4;
		blue <= bb4;
	end
	end
end


batmancrouch_rom crouchrom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouch));
batmanstand_rom standrom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_stand));
batmanjump_rom jumprom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_jump));
batmankick_rom kickrom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_kick));
batmanpunch_rom punchrom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_punch));
batmancrouchpunch_rom crouchpunchrom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouchpunch));
batmanmove_rom moverom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_move));
batmanblock_rom blockrom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_b));
batmandead_rom deadrom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_d));

batmancrouch_palette crouchpalette (.index (rom_q_crouch), .red   (crouch_red), .green (crouch_green), .blue  (crouch_blue));
batmanstand_palette standpalette (.index(rom_q_stand), .red(stand_red), .green(stand_green), .blue(stand_blue));
batmanjump_palette jumppalette (.index(rom_q_jump), .red(jump_red), .green(jump_green), .blue(jump_blue));
batmankick_palette kickpalette (.index(rom_q_kick), .red(kick_red), .green(kick_green), .blue(kick_blue));
batmanpunch_palette punchpalette (.index(rom_q_punch), .red(punch_red), .green(punch_green), .blue(punch_blue));
batmancrouchpunch_palette crouchpunchpalette (.index(rom_q_crouchpunch), .red(crouchpunch_red), .green(crouchpunch_green), .blue(crouchpunch_blue));
batmanmove_palette movepalette (.index(rom_q_move), .red(move_red), .green(move_green), .blue(move_blue));
batmanblock_palette blockpalette (.index(rom_q_b), .red(br), .green(bg), .blue(bb));
batmandead_palette deadpalette (.index(rom_q_d), .red(dr), .green(dg), .blue(db));

wwstand_rom standrom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_stand2));
wwcrouch_rom crouchrom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouch2));
wwjump_rom jumprom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_jump2));
wwkick_rom kickrom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_kick2));
wwpunch_rom punchrom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_punch2));
wwcrouchpunch_rom crouchpunchrom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouchpunch2));
wwstand2_rom moverom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_move2));
wwblock_rom blockrom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_b2));
wwdead_rom deadrom2 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_d2));

wwstand_palette standpalette2 (.index(rom_q_stand2), .red(stand_red2), .green(stand_green2), .blue(stand_blue2));
wwcrouch_palette crouchpalette2 (.index(rom_q_crouch2), .red(crouch_red2), .green(crouch_green2), .blue(crouch_blue2));
wwjump_palette jumppalette2 (.index(rom_q_jump2), .red(jump_red2), .green(jump_green2), .blue(jump_blue2));
wwkick_palette kickpalette2 (.index(rom_q_kick2), .red(kick_red2), .green(kick_green2), .blue(kick_blue2));
wwpunch_palette punchpalette2 (.index(rom_q_punch2), .red(punch_red2), .green(punch_green2), .blue(punch_blue2));
wwcrouchpunch_palette crouchpunchpalette2 (.index(rom_q_crouchpunch2), .red(crouchpunch_red2), .green(crouchpunch_green2), .blue(crouchpunch_blue2));
wwstand2_palette movepalette2 (.index(rom_q_move2), .red(move_red2), .green(move_green2), .blue(move_blue2));
wwblock_palette blockpalette2 (.index(rom_q_b2), .red(br2), .green(bg2), .blue(bb2));
wwdead_palette deadpalette2 (.index(rom_q_d2), .red(dr2), .green(dg2), .blue(db2));


// despstand_rom standrom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_stand3));
// despcrouch_rom crouchrom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouch3));
// despjump_rom jumprom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_jump3));
// despkick_rom kickrom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_kick3));
// desppunch_rom punchrom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_punch3));
// despcrouchpunch_rom crouchpunchrom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouchpunch3));
// despmove_rom moverom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_move3));
// despblock_rom blockrom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_b3));
// despdead_rom deadrom3 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_d3));

// despstand_palette standpalette3 (.index(rom_q_stand3), .red(stand_red3), .green(stand_green3), .blue(stand_blue3));
// despcrouch_palette crouchpalette3 (.index(rom_q_crouch3), .red(crouch_red3), .green(crouch_green3), .blue(crouch_blue3));
// despjump_palette jumppalette3 (.index(rom_q_jump3), .red(jump_red3), .green(jump_green3), .blue(jump_blue3));
// despkick_palette kickpalette3 (.index(rom_q_kick3), .red(kick_red3), .green(kick_green3), .blue(kick_blue3));
// desppunch_palette punchpalette3 (.index(rom_q_punch3), .red(punch_red3), .green(punch_green3), .blue(punch_blue3));
// despcrouchpunch_palette crouchpunchpalette3 (.index(rom_q_crouchpunch3), .red(crouchpunch_red3), .green(crouchpunch_green3), .blue(crouchpunch_blue3));
// despmove_palette movepalette3 (.index(rom_q_move3), .red(move_red3), .green(move_green3), .blue(move_blue3));
// despblock_palette blockpalette3 (.index(rom_q_b3), .red(br3), .green(bg3), .blue(bb3));
// despdead_palette deadpalette3 (.index(rom_q_d3), .red(dr3), .green(dg3), .blue(db3));

zfostand_rom standrom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_stand4));
zfocrouch_rom crouchrom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouch4));
zfojump_rom jumprom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_jump4));
zfokick_rom kickrom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_kick4));
zfopunch_rom punchrom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_punch4));
zfocrouchpunch_rom crouchpunchrom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_crouchpunch4));
zfomove_rom moverom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_move4));
zfoblock_rom blockrom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_b4));
zfodead_rom deadrom4 (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q_d4));

zfostand_palette standpalette4 (.index(rom_q_stand4), .red(stand_red4), .green(stand_green4), .blue(stand_blue4));
zfocrouch_palette crouchpalette4 (.index(rom_q_crouch4), .red(crouch_red4), .green(crouch_green4), .blue(crouch_blue4));
zfojump_palette jumppalette4 (.index(rom_q_jump4), .red(jump_red4), .green(jump_green4), .blue(jump_blue4));
zfokick_palette kickpalette4 (.index(rom_q_kick4), .red(kick_red4), .green(kick_green4), .blue(kick_blue4));
zfopunch_palette punchpalette4 (.index(rom_q_punch4), .red(punch_red4), .green(punch_green4), .blue(punch_blue4));
zfocrouchpunch_palette crouchpunchpalette4 (.index(rom_q_crouchpunch4), .red(crouchpunch_red4), .green(crouchpunch_green4), .blue(crouchpunch_blue4));
zfomove_palette movepalette4 (.index(rom_q_move4), .red(move_red4), .green(move_green4), .blue(move_blue4));
zfoblock_palette blockpalette4 (.index(rom_q_b4), .red(br4), .green(bg4), .blue(bb4));
zfodead_palette deadpalette4 (.index(rom_q_d4), .red(dr4), .green(dg4), .blue(db4));


endmodule
