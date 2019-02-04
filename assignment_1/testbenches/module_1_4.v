`timescale 1ns/1ps

module multiplier(input [31:0] inputSignal, output [31:0] result);
   assign result = {32{1'bx}};//inputSignal * 10;
endmodule
