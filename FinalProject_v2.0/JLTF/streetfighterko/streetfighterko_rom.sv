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
