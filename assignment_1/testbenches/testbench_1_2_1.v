// 
// Testbench for nandGate defined in module_1_2_1 
// 
// History:
// * Wed Feb  6 09:54:39 IST 2019: Changes:
//   * Fixed checks for unknown and high impedance states in 
//     the result
//   * Results are now verified on change of input and not 
//     even and odd parity 
// * Wed Feb 11 02:48:49 IST 2018:
//   * First edition
//
// Copyright (c) 2018-19 Suyash Mahar <suyash12mahar@outlook.com>

`timescale 1ns/1ps

module testbench_1_2_1;
   wire result;
   reg [1:0] inputReg;
   
   nandGate na1
     (
      .input1(inputReg[0]),
      .input2(inputReg[1]),
      .result(result)
      );

   
   initial inputReg = 2'b00;
   reg 	     error;
   initial error = 1'b0;
   
   always begin
       inputReg = inputReg + 2'b01;
       #25
	 if (inputReg == 2'b11) begin
	     $display("\n\n**************************************");
	     if (error == 1'b0) begin
		 $display("Test completed successfuly, all testcases passed.");
	     end  else begin
		 $display("Test cases failed!");
	     end
	     $display("**************************************\n\n");
	     $finish;
	 end
   end

   always @(inputReg) begin
       if ((result != ~&inputReg) || ^result === 1'bx) begin
	   error = 1'b1;
	   $display("Testcase for input: %b, %b failed, output: %b, expected: %b", inputReg[0], inputReg[1], result, ~(inputReg[1]&inputReg[2]));
       end
   end
endmodule // testbench_1_2_1
