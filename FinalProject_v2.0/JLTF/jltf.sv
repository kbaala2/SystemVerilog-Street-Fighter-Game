
module lab62 (

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);


logic Reset_h, vssig, blank, sync, VGA_Clk, flying, flying2, block, block2;

logic stand, crouch, crouchpunch, jump, kick, punch, stand2, crouch2, crouchpunch2, jump2, kick2, punch2, flip, collision, shoot, shoot2, ballcollision, ballcollision2, startscreen, start;

//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, spritexsig, spriteysig, spritesizesig, spritexsig2, spriteysig2, spritesizesig2, ballxsig, ballxsig2, ballysig, ballysig2;
	logic [3:0] Red, Blue, Green;
	logic [31:0] keycode;
//	logic [3:0] redd, greenn, bluee;

//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red;
	assign VGA_B = Blue;
	assign VGA_G = Green;
	
	
	lab62_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode)
		
	 );


//instantiate a vga_controller, playermovement, and color_mapper here with the ports.
	vga_controller vgacontroller (.Clk(MAX10_CLK1_50),
										   .Reset(Reset_h),
											.hs(VGA_HS),
											.vs(VGA_VS),
											.pixel_clk(VGA_Clk),
											.blank(blank),
											.sync(sync),
											.DrawX(drawxsig),
											.DrawY(drawysig)
											);						


	color_mapper collermapper (.spritex(spritexsig), .sprite_size(spritesizesig), .spritey(spriteysig), 
										.spritex2(spritexsig2), .spritey2(spriteysig2), .sprite_size2(spritesizesig2),
										.BallX(ballxsig), .BallY(ballysig), .BallX2(ballxsig2), .BallY2(ballysig2),
										.DrawX(drawxsig), .DrawY(drawysig),
										.keycode(keycode),
										.Reset(Reset_h),.pixel_Clk(VGA_Clk),.frame_clk(VGA_VS),.blank(blank),
										.Red(Red),.Green(Green),.Blue(Blue),
										.stand(stand),.crouch(crouch), .crouchpunch(crouchpunch), .jump(jump),.kick(kick),.punch(punch),
										.crouch2(crouch2), .crouchpunch2(crouchpunch2), .stand2(stand2), .jump2(jump2), .kick2(kick2), .punch2(punch2), .flip(flip),
										.collision(collision), .ballcollision(ballcollision), .ballcollision2(ballcollision2),
							 		   .shoot(shoot), .shoot2(shoot2), .startscreen(startscreen), .flying(flying), .flying2(flying2), .start(start),.block(block),.block2(block2)
										);
										
	playermovement playermove (.Reset(Reset_h),
				  .frame_clk(VGA_VS),
				  .keycode(keycode),
				  .SpriteX(spritexsig),
				  .SpriteY(spriteysig),
				  .SpriteS(spritesizesig),
				  .stand(stand),
				  .crouch(crouch),
				  .jump(jump),
				  .kick(kick),
				  .punch(punch),
				  .flip(flip),
				  .collision(collision), .shoot(shoot), .SpriteX2(spritexsig2), .start(start),.block(block), .crouchpunch(crouchpunch)
				  );
	playermovement2 playermove2(.Reset(Reset_h), .frame_clk(VGA_VS), .collision(collision),.keycode(keycode),.SpriteX2(spritexsig2), .SpriteY2(spriteysig2), .SpriteS2(spritesizesig2),
					.stand2(stand2), .crouch2(crouch2), .jump2(jump2), .kick2(kick2), .punch2(punch2), .shoot2(shoot2), .start(start),.block2(block2), .crouchpunch2(crouchpunch2));
				  
	cannon moveball (.Reset(Reset_h), .frame_clk(VGA_VS), .ballcollision(ballcollision), .ballcollision2(ballcollision2), .flying(flying),.flying2(flying2), .startscreen(startscreen), .shoot(shoot), .shoot2(shoot2), .SpriteX(spritexsig), .SpriteX2(spritexsig2),
               .keycode(keycode), .BallX(ballxsig), .BallY(ballysig), .BallX2(ballxsig2), .BallY2(ballysig2), .flip(flip));
				  
endmodule
