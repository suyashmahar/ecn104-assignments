// 
// Testbench for module_1_1 defined in module_1_1.v
// 
// History:
// * Wed Feb  6 10:00:01 IST 2019: Changes:
//   * Fixed checks for unknown and high impedance states in 
//     the result
//   * Results are now verified on change of input and not 
//     inputSignal
// * Wed Feb 11 02:48:49 IST 2018:
//   * First edition
//
// Copyright (c) 2018-19 Suyash Mahar <suyash12mahar@outlook.com>

`timescale 1ns/1ps

module testbench_1_1;
   reg [31:0] inputSignal;
   wire [31:0] result;
   reg [31:0]  failureCount;
   
   initial begin
       failureCount = 0;
       inputSignal = 32'h00000000;
   end

   always #10 inputSignal = inputSignal + 32'h00000111;


   // Initialize module
   module_1_1 uut(.inputSignal(inputSignal), .result(result));
   

   always @(inputSignal) begin
       if ((result != inputSignal<<5) || (^result === 1'bx)) begin
	   $display("Testcase for input: %d failed, output: %d, expected: %d.", inputSignal, result, inputSignal<<5);
	   failureCount = failureCount + 1;
       end 
   end

   always @(inputSignal) begin
       if (inputSignal >= 32'h0fffffff) begin
	   $display("\n\n**************************************");
	   if (failureCount != 0) begin
	       $display("Testcase(s) failed!");
	       $finish;
	   end else begin
	       $display("All testcases passed!");
	   end
	   $display("**************************************\n\n");
	   $finish;
       end
   end   
endmodule // testbench1
