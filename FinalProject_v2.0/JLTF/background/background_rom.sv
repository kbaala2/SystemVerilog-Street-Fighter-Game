module background_rom (
	input logic clock,
	input logic [16:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:76799] /* synthesis ram_init_file = "./background/background.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module startscreen_rom (
	input logic clock,
	input logic [14:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:29999] /* synthesis ram_init_file = "./startscreen/startscreen.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module characterselect_rom (
	input logic clock,
	input logic [14:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:29999] /* synthesis ram_init_file = "./characterselect/characterselect.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module countdown3_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:4095] /* synthesis ram_init_file = "./countdown3/countdown3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module countdown2_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:4095] /* synthesis ram_init_file = "./countdown2/countdown2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module countdown1_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:4095] /* synthesis ram_init_file = "./countdown1/countdown1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module countdownfight_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:4999] /* synthesis ram_init_file = "./countdownfight/countdownfight.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module streetfighterko_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:4999] /* synthesis ram_init_file = "./streetfighterko/streetfighterko.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

