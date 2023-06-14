module background_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h7, 4'h7, 4'hB},
	{4'hA, 4'hF, 4'hB},
	{4'h6, 4'h6, 4'h2},
	{4'hA, 4'hA, 4'h6},
	{4'h3, 4'h3, 4'h0},
	{4'h8, 4'h8, 4'h4},
	{4'h5, 4'h5, 4'h9},
	{4'hC, 4'hD, 4'h9}
};

assign {red, green, blue} = palette[index];

endmodule


module startscreen_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hD, 4'h3, 4'h3},
	{4'h5, 4'h3, 4'hD},
	{4'hB, 4'h9, 4'h1},
	{4'hF, 4'hF, 4'hF},
	{4'h8, 4'h8, 4'h8},
	{4'h4, 4'h2, 4'h1},
	{4'h2, 4'h0, 4'h6}
};

assign {red, green, blue} = palette[index];

endmodule

module characterselect_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'h0, 4'hE},
	{4'h8, 4'h8, 4'h8},
	{4'h5, 4'h3, 4'h4},
	{4'hD, 4'hC, 4'hC},
	{4'h1, 4'h1, 4'h2},
	{4'hB, 4'h1, 4'h9},
	{4'hC, 4'h8, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule



module countdown3_palette (
	input logic [1:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:3][11:0] palette = {
	{4'h0, 4'hE, 4'h0},
	{4'hF, 4'hF, 4'h7},
	{4'h1, 4'h2, 4'h0},
	{4'hE, 4'h6, 4'h0}
};

assign {red, green, blue} = palette[index];

endmodule


module countdown2_palette (
	input logic [1:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:3][11:0] palette = {
	{4'h1, 4'h2, 4'h0},
	{4'h0, 4'hE, 4'h0},
	{4'hE, 4'h4, 4'h0},
	{4'hE, 4'hE, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule


module countdown1_palette (
	input logic [1:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:3][11:0] palette = {
	{4'h0, 4'hE, 4'h0},
	{4'hF, 4'h4, 4'h0},
	{4'h1, 4'h2, 4'h0},
	{4'hE, 4'hE, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule


module countdownfight_palette (
	input logic [1:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:3][11:0] palette = {
	{4'h1, 4'h3, 4'h0},
	{4'h0, 4'hE, 4'h0},
	{4'hD, 4'h5, 4'h0},
	{4'hE, 4'hE, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule


module streetfighterko_palette (
	input logic [1:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:3][11:0] palette = {
	{4'hF, 4'h6, 4'h0},
	{4'hF, 4'h0, 4'hF},
	{4'h8, 4'h2, 4'h1},
	{4'hC, 4'h8, 4'h8}
};

assign {red, green, blue} = palette[index];

endmodule
