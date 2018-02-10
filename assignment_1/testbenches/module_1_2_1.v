`timescale 1ns/1ps

module andGate;
	input wire input1;
	input wire input2;
	output wire result;

	assign result = input1&input2;
endmodule
