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
