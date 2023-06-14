module despblock_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h6, 4'h3, 4'h2},
	{4'hC, 4'h5, 4'h7},
	{4'h2, 4'h6, 4'h2},
	{4'h1, 4'h2, 4'h0},
	{4'hB, 4'h1, 4'h9},
	{4'h9, 4'h1, 4'h7},
	{4'hD, 4'hB, 4'h7},
	{4'h9, 4'h6, 4'h3},
	{4'h4, 4'h1, 4'h1},
	{4'h6, 4'h1, 4'h3},
	{4'hE, 4'h1, 4'hE},
	{4'hD, 4'h1, 4'hC},
	{4'hB, 4'h8, 4'h5},
	{4'h9, 4'h3, 4'h4},
	{4'h6, 4'hA, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule

module despcrouch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h1, 4'h2, 4'h0},
	{4'h9, 4'h3, 4'h5},
	{4'hE, 4'h0, 4'hE},
	{4'h9, 4'h6, 4'h3},
	{4'h4, 4'h1, 4'h1},
	{4'hD, 4'hB, 4'h7},
	{4'h4, 4'h7, 4'h3},
	{4'h7, 4'h1, 4'h4},
	{4'hD, 4'h2, 4'hB},
	{4'hB, 4'h9, 4'h5},
	{4'h7, 4'h3, 4'h2},
	{4'hD, 4'h6, 4'h8},
	{4'h7, 4'hA, 4'h5},
	{4'hA, 4'h1, 4'h8},
	{4'h2, 4'h5, 4'h1}
};

assign {red, green, blue} = palette[index];

endmodule

module despcrouchpunch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h7, 4'h1, 4'h3},
	{4'h0, 4'h2, 4'h0},
	{4'hE, 4'h1, 4'hD},
	{4'h7, 4'hA, 4'h5},
	{4'hC, 4'h9, 4'h6},
	{4'hC, 4'h5, 4'h7},
	{4'h5, 4'h2, 4'h1},
	{4'h1, 4'h5, 4'h1},
	{4'h9, 4'h1, 4'h7},
	{4'h3, 4'h7, 4'h3},
	{4'h4, 4'h0, 4'h1},
	{4'h9, 4'h3, 4'h5},
	{4'h7, 4'h1, 4'h5},
	{4'h9, 4'h6, 4'h3},
	{4'hB, 4'h1, 4'hA}
};

assign {red, green, blue} = palette[index];

endmodule

module despdead_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hE, 4'h1, 4'hE},
	{4'h9, 4'h3, 4'h4},
	{4'h4, 4'h1, 4'h1},
	{4'hC, 4'h1, 4'hB},
	{4'hA, 4'h1, 4'h9},
	{4'h7, 4'hB, 4'h6},
	{4'h6, 4'h3, 4'h1},
	{4'h1, 4'h4, 4'h1},
	{4'h7, 4'h1, 4'h6},
	{4'hF, 4'h0, 4'hF},
	{4'hD, 4'h5, 4'h8},
	{4'h0, 4'h2, 4'h0},
	{4'h9, 4'h6, 4'h4},
	{4'h4, 4'h8, 4'h3},
	{4'hC, 4'hA, 4'h6},
	{4'h7, 4'h1, 4'h3}
};

assign {red, green, blue} = palette[index];

endmodule

module despjump_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h5, 4'h1, 4'h1},
	{4'hA, 4'h3, 4'h5},
	{4'h1, 4'h5, 4'h1},
	{4'hD, 4'h6, 4'h8},
	{4'hD, 4'hA, 4'h7},
	{4'h1, 4'h2, 4'h0},
	{4'hE, 4'h1, 4'hE},
	{4'h7, 4'h4, 4'h2},
	{4'hB, 4'h1, 4'h9},
	{4'h7, 4'h1, 4'h3},
	{4'h4, 4'h7, 4'h3},
	{4'hA, 4'h7, 4'h4},
	{4'h7, 4'hA, 4'h6},
	{4'hD, 4'h1, 4'hC},
	{4'h9, 4'h1, 4'h6}
};

assign {red, green, blue} = palette[index];

endmodule

module despkick_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h5, 4'h3, 4'h1},
	{4'hC, 4'h1, 4'hC},
	{4'h3, 4'h7, 4'h3},
	{4'hA, 4'h5, 4'h6},
	{4'h1, 4'h2, 4'h1},
	{4'h6, 4'h1, 4'h4},
	{4'h4, 4'h1, 4'h1},
	{4'hC, 4'h9, 4'h6},
	{4'h8, 4'h1, 4'h7},
	{4'h1, 4'h5, 4'h1},
	{4'hE, 4'h1, 4'hE},
	{4'h7, 4'hA, 4'h5},
	{4'h8, 4'h2, 4'h3},
	{4'hD, 4'h6, 4'h9},
	{4'hA, 4'h1, 4'h9}
};

assign {red, green, blue} = palette[index];

endmodule

module despmove_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h8, 4'h3, 4'h4},
	{4'h9, 4'h7, 4'h3},
	{4'h1, 4'h2, 4'h0},
	{4'hE, 4'h1, 4'hD},
	{4'hC, 4'h9, 4'h5},
	{4'h4, 4'h7, 4'h4},
	{4'hC, 4'h5, 4'h7},
	{4'h6, 4'h1, 4'h3},
	{4'h4, 4'h1, 4'h1},
	{4'h9, 4'h1, 4'h6},
	{4'hB, 4'h1, 4'hA},
	{4'hE, 4'hC, 4'h8},
	{4'h7, 4'hA, 4'h6},
	{4'h1, 4'h5, 4'h2},
	{4'h7, 4'h4, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule

module desppunch_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h4, 4'h0, 4'h1},
	{4'hC, 4'h5, 4'h7},
	{4'h1, 4'h5, 4'h1},
	{4'hC, 4'h1, 4'hB},
	{4'hA, 4'h1, 4'h8},
	{4'h3, 4'h7, 4'h2},
	{4'hC, 4'hA, 4'h6},
	{4'h4, 4'h2, 4'h1},
	{4'h7, 4'h1, 4'h3},
	{4'h0, 4'h2, 4'h0},
	{4'hE, 4'h1, 4'hD},
	{4'h6, 4'hA, 4'h5},
	{4'h7, 4'h1, 4'h6},
	{4'h9, 4'h2, 4'h4},
	{4'h8, 4'h5, 4'h3}
};

assign {red, green, blue} = palette[index];

endmodule

module despstand_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h6, 4'h3, 4'h1},
	{4'hB, 4'h9, 4'h5},
	{4'h8, 4'h1, 4'h6},
	{4'h1, 4'h3, 4'h0},
	{4'hA, 4'h1, 4'h9},
	{4'h9, 4'h6, 4'h3},
	{4'h9, 4'h3, 4'h4},
	{4'h3, 4'h6, 4'h3},
	{4'h6, 4'h1, 4'h3},
	{4'h4, 4'h1, 4'h1},
	{4'hD, 4'h2, 4'hC},
	{4'hC, 4'h5, 4'h7},
	{4'hE, 4'hC, 4'h8},
	{4'hE, 4'h1, 4'hE},
	{4'h7, 4'hA, 4'h6}
};

assign {red, green, blue} = palette[index];

endmodule
