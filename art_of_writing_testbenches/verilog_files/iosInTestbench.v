`timescale 1ns/1ps

module testbench;
   reg clk;
   reg [3:0] inputA, inputB;	// Declare 2 4-bit regs for input
   wire resultA, resultB;	// Declare 2 wires for the output

   // Initialize our hypothetical module
   testModule uut(clk, inputA, inputB, resultA, resultB);

   initial begin
       clk = 1'b0;
       forever begin
	   #10 clk = ~clk;	// Declare a clk with T = 20ns
       end
   end

   // Note that a module can have multiple initial blocks
   initial begin
       inputA = 4'b0000;
       inputB = 4'b0000;
   end

   initial begin
       #10
       forever begin
	   #320
	     inputA = inputA + 4'b0001;
       end
   end

   initial begin
       #10
       forever begin
	   #20
	     inputB = inputB + 4'b0001;
       end
   end
endmodule // testbench
