module batmanstand_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmanstand/batmanstand.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmancrouch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmancrouch/batmancrouch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmanjump_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmanjump/batmanjump.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module batmankick_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmankick/batmankick.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmanpunch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmanpunch/batmanpunch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmanblock_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmanblock/batmanblock.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmancrouchpunch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmancrouchpunch/batmancrouchpunch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmandead_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmandead/batmandead.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmanstand2_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmanstand2/batmanstand2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module batmanmove_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./batmanmove/batmanmove.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
