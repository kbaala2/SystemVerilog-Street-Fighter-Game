module wwstand_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h6, 4'h5, 4'hB},
	{4'hF, 4'h0, 4'hF},
	{4'h8, 4'h1, 4'h4},
	{4'h1, 4'h0, 4'h2},
	{4'hA, 4'h1, 4'h7},
	{4'hE, 4'h9, 4'h8},
	{4'h2, 4'h1, 4'h7},
	{4'hA, 4'h5, 4'h3},
	{4'hC, 4'h1, 4'hA},
	{4'hC, 4'h7, 4'h5},
	{4'hF, 4'hC, 4'hA},
	{4'h6, 4'h3, 4'h2},
	{4'h4, 4'h1, 4'h1},
	{4'h9, 4'h0, 4'h1},
	{4'hE, 4'h1, 4'hD},
	{4'h7, 4'h4, 4'h6}
};

assign {red, green, blue} = palette[index];

endmodule

module wwstand2_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hE, 4'h1, 4'hC},
	{4'hF, 4'h0, 4'hF},
	{4'hA, 4'h5, 4'h4},
	{4'h1, 4'h0, 4'h1},
	{4'hE, 4'h9, 4'h7},
	{4'h9, 4'h1, 4'h6},
	{4'h1, 4'h0, 4'h5},
	{4'h8, 4'h4, 4'h2},
	{4'hC, 4'h8, 4'h5},
	{4'h4, 4'h4, 4'hC},
	{4'hF, 4'hC, 4'hA},
	{4'hB, 4'h1, 4'h9},
	{4'h5, 4'h1, 4'h5},
	{4'h5, 4'h1, 4'h1},
	{4'h9, 4'h0, 4'h1},
	{4'hB, 4'h6, 4'h8}
};

assign {red, green, blue} = palette[index];

endmodule

module wwblock_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'hB, 4'h6, 4'h6},
	{4'h1, 4'h0, 4'h1},
	{4'hA, 4'h1, 4'h8},
	{4'h9, 4'h0, 4'h2},
	{4'h1, 4'h0, 4'h5},
	{4'hF, 4'hC, 4'hA},
	{4'hE, 4'h1, 4'hD},
	{4'h6, 4'h2, 4'h8},
	{4'hD, 4'h9, 4'h7},
	{4'h9, 4'h5, 4'h4},
	{4'h9, 4'h1, 4'h5},
	{4'hC, 4'h1, 4'hB},
	{4'h7, 4'h3, 4'h3},
	{4'hD, 4'h7, 4'h9},
	{4'h4, 4'h1, 4'h1}
};

assign {red, green, blue} = palette[index];

endmodule

module wwcrouch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h8, 4'h1, 4'h5},
	{4'hB, 4'h7, 4'h5},
	{4'h0, 4'h0, 4'h1},
	{4'h5, 4'h2, 4'h1},
	{4'hD, 4'h1, 4'hB},
	{4'hF, 4'hC, 4'hA},
	{4'h8, 4'h4, 4'h3},
	{4'hA, 4'h0, 4'h1},
	{4'h3, 4'h2, 4'hB},
	{4'h1, 4'h1, 4'h6},
	{4'hD, 4'h9, 4'h7},
	{4'h4, 4'h1, 4'h4},
	{4'h8, 4'h6, 4'h8},
	{4'hE, 4'h1, 4'hD},
	{4'hA, 4'h1, 4'h8}
};

assign {red, green, blue} = palette[index];

endmodule

module wwcrouchpunch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h7, 4'h4, 4'h3},
	{4'h0, 4'h0, 4'h4},
	{4'hA, 4'h6, 4'h4},
	{4'hB, 4'h1, 4'hA},
	{4'hD, 4'h9, 4'h7},
	{4'hA, 4'h0, 4'h1},
	{4'h5, 4'h2, 4'h1},
	{4'h8, 4'h1, 4'h5},
	{4'hE, 4'h1, 4'hD},
	{4'h9, 4'h1, 4'h7},
	{4'hF, 4'hB, 4'hA},
	{4'hB, 4'h7, 4'h6},
	{4'h0, 4'h0, 4'h1},
	{4'h1, 4'h1, 4'h7},
	{4'h4, 4'h0, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule

module wwdead_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h5, 4'h2, 4'h1},
	{4'hA, 4'h1, 4'h7},
	{4'hC, 4'h8, 4'h6},
	{4'h1, 4'h0, 4'h6},
	{4'h7, 4'h5, 4'h3},
	{4'hB, 4'h2, 4'h2},
	{4'h0, 4'h0, 4'h2},
	{4'hB, 4'h1, 4'hA},
	{4'h9, 4'h0, 4'h0},
	{4'h5, 4'h4, 4'hA},
	{4'h5, 4'h1, 4'h6},
	{4'hE, 4'hB, 4'h9},
	{4'hA, 4'h6, 4'h4},
	{4'h9, 4'h1, 4'h4},
	{4'hE, 4'h0, 4'hD}
};

assign {red, green, blue} = palette[index];

endmodule

module wwjump_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'hB, 4'h3, 4'h3},
	{4'hE, 4'hB, 4'h9},
	{4'h1, 4'h0, 4'h2},
	{4'hD, 4'h8, 4'h7},
	{4'hC, 4'h1, 4'hB},
	{4'h5, 4'h2, 4'h1},
	{4'h1, 4'h1, 4'h6},
	{4'hA, 4'h1, 4'h7},
	{4'hE, 4'h0, 4'hD},
	{4'h8, 4'h4, 4'h3},
	{4'hA, 4'h6, 4'h5},
	{4'h9, 4'h0, 4'h1},
	{4'h8, 4'h5, 4'h7},
	{4'h5, 4'h1, 4'h6},
	{4'h8, 4'h1, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule

module wwkick_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h8, 4'h1, 4'h4},
	{4'hF, 4'h0, 4'hF},
	{4'hE, 4'hC, 4'hA},
	{4'h1, 4'h1, 4'h5},
	{4'hC, 4'h1, 4'hA},
	{4'hB, 4'h7, 4'h5},
	{4'hA, 4'h0, 4'h1},
	{4'h6, 4'h2, 4'h1},
	{4'h2, 4'h2, 4'h9},
	{4'hA, 4'h1, 4'h8},
	{4'h0, 4'h0, 4'h2},
	{4'h4, 4'h2, 4'h5},
	{4'hE, 4'h1, 4'hD},
	{4'h8, 4'h4, 4'h3},
	{4'hD, 4'h3, 4'h3},
	{4'hD, 4'h9, 4'h7}
};

assign {red, green, blue} = palette[index];

endmodule

module wwpunch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hD, 4'h1, 4'hC},
	{4'h7, 4'h3, 4'h3},
	{4'hF, 4'h0, 4'hF},
	{4'h4, 4'h1, 4'h4},
	{4'hF, 4'hC, 4'hA},
	{4'h9, 4'h1, 4'h6},
	{4'h5, 4'h1, 4'h0},
	{4'hC, 4'h7, 4'h6},
	{4'h0, 4'h0, 4'h1},
	{4'h5, 4'h4, 4'hA},
	{4'hA, 4'h0, 4'h1},
	{4'hB, 4'h1, 4'h9},
	{4'h0, 4'h0, 4'h4},
	{4'hA, 4'h5, 4'h4},
	{4'hD, 4'h9, 4'h7},
	{4'h1, 4'h1, 4'h6}
};

assign {red, green, blue} = palette[index];

endmodule


