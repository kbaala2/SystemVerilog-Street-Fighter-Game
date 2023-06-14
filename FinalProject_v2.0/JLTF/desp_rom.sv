module despblock_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despblock/despblock.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module despcrouch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despcrouch/despcrouch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module despcrouchpunch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despcrouchpunch/despcrouchpunch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module despdead_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despdead/despdead.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module despjump_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despjump/despjump.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module despkick_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despkick/despkick.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module despmove_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despmove/despmove.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module desppunch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./desppunch/desppunch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module despstand_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./despstand/despstand.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

