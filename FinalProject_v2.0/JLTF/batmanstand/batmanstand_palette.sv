module batmanstand_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h0, 4'h0, 4'h5},
	{4'h0, 4'h0, 4'h0},
	{4'h3, 4'h3, 4'h3},
	{4'h9, 4'h0, 4'h9},
	{4'h2, 4'h2, 4'h2},
	{4'h8, 4'h8, 4'h8},
	{4'h2, 4'h2, 4'h7},
	{4'hC, 4'h0, 4'hC},
	{4'h0, 4'h0, 4'h1},
	{4'h3, 4'h0, 4'h5},
	{4'h0, 4'h0, 4'h3},
	{4'hA, 4'h8, 4'h1},
	{4'h5, 4'h5, 4'h0},
	{4'h6, 4'h0, 4'h7},
	{4'h5, 4'h5, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule


module batmancrouch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h2, 4'h2, 4'h2},
	{4'h5, 4'h5, 4'h5},
	{4'h0, 4'h0, 4'h0},
	{4'h9, 4'h0, 4'hA},
	{4'h3, 4'h0, 4'h5},
	{4'h0, 4'h0, 4'h4},
	{4'h2, 4'h2, 4'h7},
	{4'h8, 4'h8, 4'h8},
	{4'hC, 4'h0, 4'hC},
	{4'h8, 4'h7, 4'h0},
	{4'h3, 4'h3, 4'h3},
	{4'h1, 4'h1, 4'h5},
	{4'h0, 4'h0, 4'h2},
	{4'h6, 4'h0, 4'h7},
	{4'hD, 4'h0, 4'hD}
};

assign {red, green, blue} = palette[index];

endmodule


module batmanjump_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h0, 4'h0, 4'h0},
	{4'h2, 4'h2, 4'h6},
	{4'hA, 4'h0, 4'hA},
	{4'h3, 4'h3, 4'h3},
	{4'h0, 4'h0, 4'h4},
	{4'h6, 4'h6, 4'h6},
	{4'h7, 4'h0, 4'h7},
	{4'hD, 4'h0, 4'hD},
	{4'h7, 4'h6, 4'h0},
	{4'h0, 4'h0, 4'h5},
	{4'h4, 4'h4, 4'h4},
	{4'h8, 4'h8, 4'h8},
	{4'h4, 4'h0, 4'h5},
	{4'h2, 4'h1, 4'h2},
	{4'h0, 4'h0, 4'h1}
};

assign {red, green, blue} = palette[index];

endmodule


module batmankick_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h4, 4'h4, 4'h4},
	{4'h0, 4'h0, 4'h0},
	{4'h7, 4'h7, 4'h7},
	{4'h0, 4'h0, 4'h5},
	{4'hD, 4'h0, 4'hD},
	{4'h6, 4'h0, 4'h7},
	{4'h3, 4'h3, 4'h2},
	{4'h1, 4'h1, 4'h6},
	{4'h8, 4'h5, 4'h1},
	{4'hA, 4'h0, 4'hA},
	{4'hA, 4'hA, 4'h0},
	{4'h4, 4'h0, 4'h5},
	{4'h0, 4'h0, 4'h2},
	{4'h3, 4'h3, 4'h7},
	{4'h2, 4'h1, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule


module batmanpunch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hB, 4'h0, 4'hB},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'h0, 4'hF},
	{4'h3, 4'h3, 4'h3},
	{4'h0, 4'h0, 4'h5},
	{4'h5, 4'h0, 4'h7},
	{4'h5, 4'h5, 4'h5},
	{4'h9, 4'h0, 4'h9},
	{4'h8, 4'h8, 4'h0},
	{4'h8, 4'h8, 4'h8},
	{4'h0, 4'h0, 4'h1},
	{4'h2, 4'h2, 4'h2},
	{4'h0, 4'h0, 4'h3},
	{4'h1, 4'h2, 4'h6},
	{4'hD, 4'h0, 4'hD},
	{4'h3, 4'h0, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule


module batmanblock_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h9, 4'h0, 4'hA},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'h0, 4'hF},
	{4'h2, 4'h2, 4'h7},
	{4'h5, 4'h5, 4'h5},
	{4'h0, 4'h0, 4'h4},
	{4'h2, 4'h1, 4'h2},
	{4'h8, 4'h7, 4'h7},
	{4'h3, 4'h3, 4'h3},
	{4'h3, 4'h0, 4'h5},
	{4'h7, 4'h7, 4'h0},
	{4'hB, 4'h0, 4'hC},
	{4'h0, 4'h0, 4'h6},
	{4'h6, 4'h0, 4'h7},
	{4'h0, 4'h0, 4'h2},
	{4'hE, 4'h0, 4'hE}
};

assign {red, green, blue} = palette[index];

endmodule


module batmancrouchpunch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h2, 4'h1, 4'h2},
	{4'h8, 4'h8, 4'h8},
	{4'h5, 4'h0, 4'h6},
	{4'h1, 4'h0, 4'h5},
	{4'h0, 4'h0, 4'h0},
	{4'hC, 4'h0, 4'hC},
	{4'h5, 4'h6, 4'h5},
	{4'h0, 4'h0, 4'h3},
	{4'h7, 4'h6, 4'h0},
	{4'h0, 4'h7, 4'h7},
	{4'h9, 4'h0, 4'h9},
	{4'hB, 4'hA, 4'h0},
	{4'h2, 4'h2, 4'h7},
	{4'h3, 4'h3, 4'h3},
	{4'h4, 4'h3, 4'h0}
};

assign {red, green, blue} = palette[index];

endmodule


module batmandead_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h1, 4'h1, 4'h6},
	{4'h0, 4'h0, 4'h2},
	{4'h6, 4'h6, 4'h6},
	{4'h9, 4'h0, 4'hA},
	{4'h3, 4'h3, 4'h3},
	{4'hA, 4'h9, 4'h0},
	{4'h0, 4'h0, 4'h5},
	{4'h8, 4'h8, 4'h8},
	{4'h0, 4'h0, 4'h0},
	{4'hD, 4'h0, 4'hD},
	{4'h6, 4'h0, 4'h7},
	{4'h5, 4'h5, 4'h0},
	{4'h2, 4'h2, 4'h2},
	{4'h4, 4'h4, 4'h4},
	{4'h3, 4'h0, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule


module batmanstand2_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h0, 4'h0, 4'h4},
	{4'h6, 4'h6, 4'h6},
	{4'h0, 4'h0, 4'h0},
	{4'h4, 4'h0, 4'h5},
	{4'h2, 4'h2, 4'h2},
	{4'hD, 4'h0, 4'hD},
	{4'h9, 4'h8, 4'h0},
	{4'h2, 4'h3, 4'h7},
	{4'hA, 4'h0, 4'hA},
	{4'h3, 4'h3, 4'h3},
	{4'h8, 4'h8, 4'h8},
	{4'h1, 4'h1, 4'h6},
	{4'h7, 4'h0, 4'h8},
	{4'h4, 4'h3, 4'h0},
	{4'h0, 4'h0, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule


module batmanmove_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h0, 4'h0, 4'h2},
	{4'h6, 4'h6, 4'h6},
	{4'h9, 4'h0, 4'hA},
	{4'h2, 4'h3, 4'h7},
	{4'h1, 4'h1, 4'h6},
	{4'h2, 4'h2, 4'h2},
	{4'hC, 4'h0, 4'hC},
	{4'hA, 4'h9, 4'h0},
	{4'h6, 4'h0, 4'h7},
	{4'h0, 4'h0, 4'h0},
	{4'h8, 4'h8, 4'h8},
	{4'h5, 4'h4, 4'h0},
	{4'h4, 4'h4, 4'h4},
	{4'h3, 4'h0, 4'h5},
	{4'h0, 4'h0, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule
