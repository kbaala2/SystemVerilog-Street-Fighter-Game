module background_example (
	input logic vga_clk,
	input logic [9:0] DrawX, DrawY,
	input logic blank, startscreen, characterselect,
	output logic [3:0] red, green, blue
);

logic [16:0] rom_address, rom_address_ss, rom_address_cs, rom_address_countdown,rom_address_fight,rom_address_ko;
logic [2:0] rom_q, rom_q_ss, rom_q_c3, rom_q_c2, rom_q_c1, rom_q_fight, rom_q_ko, rom_q_cs;

logic [3:0] bg_red, bg_green, bg_blue, ssR, ssG, ssB, csR, csG, csB, c3R, c3G, c3B, c2R, c2G, c2B, c1R, c1G, c1B, fightR, fightG, fightB, koR, koG, koB;

logic negedge_vga_clk;

// read from ROM on negedge, set pixel on posedge
assign negedge_vga_clk = ~vga_clk;

// address into the rom = (x*xDim)/640 + ((y*yDim)/480) * xDim
// this will stretch out the sprite across the entire screen
assign rom_address = ((DrawX * 320) / 640) + (((DrawY * 240) / 480) * 320);
assign rom_address_ss = ((DrawX * 200) / 640) + (((DrawY * 150) / 480) * 200);
assign rom_address_cs = ((DrawX * 200) / 640) + (((DrawY * 150) / 480) * 200);




always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;

	if(blank && startscreen) begin
		red <= ssR;
		green <= ssG;
		blue <= ssB;
	end
	else if(blank && characterselect)
	begin
		red <= csR;
		green <= csG;
		blue <= csB;
	end
	else if (blank) begin
		red <= bg_red;
		green <= bg_green;
		blue <= bg_blue;
	end
end

background_rom bg_rom (.clock(negedge_vga_clk), .address(rom_address), .q(rom_q));
startscreen_rom ss_rom (.clock(negedge_vga_clk), .address(rom_address_ss), .q(rom_q_ss));
characterselect_rom cs_rom (.clock(negedge_vga_clk), .address(rom_address_cs), .q(rom_q_cs));


background_palette bg_palette (.index(rom_q), .red(bg_red), .green(bg_green), .blue(bg_blue));
startscreen_palette ss_palette (.index(rom_q_ss), .red(ssR), .green(ssG), .blue(ssB));
characterselect_palette cs_palette (.index(rom_q_cs), .red(csR), .green(csG), .blue(csB));


endmodule





module graphics (
	input logic vga_clk,
	input logic [9:0] DrawX, DrawY,
	input logic blank, countdown3, countdown2, countdown1, fight, ko,
	output logic [3:0] red, green, blue
);

logic [16:0] rom_address_countdown,rom_address_fight,rom_address_ko;
logic [2:0] rom_q, rom_q_ss, rom_q_c3, rom_q_c2, rom_q_c1, rom_q_fight, rom_q_ko;

logic [3:0] c3R, c3G, c3B, c2R, c2G, c2B, c1R, c1G, c1B, fightR, fightG, fightB, koR, koG, koB;

logic negedge_vga_clk;

// read from ROM on negedge, set pixel on posedge
assign negedge_vga_clk = ~vga_clk;

// address into the rom = (x*xDim)/640 + ((y*yDim)/480) * xDim
// this will stretch out the sprite across the entire screen
assign rom_address_countdown = ((DrawX - 256)/2 + ((DrawY-150)/2*64));
assign rom_address_fight = ((DrawX - 220)/2 + ((DrawY-150)/2*100));
assign rom_address_ko = ((DrawX - 120)/4 + ((DrawY-150)/4*100));




always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;

	if(blank && countdown3) begin
		red <= c3R;
		green <= c3G;
		blue <= c3B;
	end
	else if(blank && countdown2) begin
		red <= c2R;
		green <= c2G;
		blue <= c2B;
	end
	else if(blank && countdown1) begin
		red <= c1R;
		green <= c1G;
		blue <= c1B;
	end
	else if(blank && fight) begin
		red <= fightR;
		green <= fightG;
		blue <= fightB;
	end
	else if(blank && ko) begin
		red <= koR;
		green <= koG;
		blue <= koB;
	end
end


countdown3_rom c3_rom (.clock(negedge_vga_clk), .address(rom_address_countdown), .q(rom_q_c3));
countdown2_rom c2_rom (.clock(negedge_vga_clk), .address(rom_address_countdown), .q(rom_q_c2));
countdown1_rom c1_rom (.clock(negedge_vga_clk), .address(rom_address_countdown), .q(rom_q_c1));
countdownfight_rom f_rom (.clock(negedge_vga_clk), .address(rom_address_fight), .q(rom_q_fight));
streetfighterko_rom ko_rom (.clock(negedge_vga_clk), .address(rom_address_ko), .q(rom_q_ko));


countdown3_palette c3_palette (.index(rom_q_c3), .red(c3R), .green(c3G), .blue(c3B));
countdown2_palette c2_palette (.index(rom_q_c2), .red(c2R), .green(c2G), .blue(c2B));
countdown1_palette c1_palette (.index(rom_q_c1), .red(c1R), .green(c1G), .blue(c1B));
countdownfight_palette fight_palette (.index(rom_q_fight), .red(fightR), .green(fightG), .blue(fightB));
streetfighterko_palette ko_palette (.index(rom_q_ko), .red(koR), .green(koG), .blue(koB));

endmodule
