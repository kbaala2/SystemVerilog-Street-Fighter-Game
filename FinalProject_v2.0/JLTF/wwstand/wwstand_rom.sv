module wwstand_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwstand/wwstand.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwstand2_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwstand2/wwstand2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwblock_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwblock/wwblock.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwcrouch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwcrouch/wwcrouch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwcrouchpunch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwcrouchpunch/wwcrouchpunch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwdead_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwdead/wwdead.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwjump_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwjump/wwjump.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwkick_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwkick/wwkick.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module wwpunch_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./wwpunch/wwpunch.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


