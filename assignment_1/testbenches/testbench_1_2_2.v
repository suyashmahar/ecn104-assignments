// 
// Testbench for nandGate defined in module_1_2_2
// 
// History:
// * Sat Feb  9 18:04:23 IST 2019
//   * Fixed race condition in output verification by combining
//     output check and input increment always blocks
// * Wed Feb  6 09:57:49 IST 2019: Changes:
//   * Fixed checks for unknown and high impedance states in 
//     the result
//   * Results are now verified on change of input and not 
//     inputReg
// * Wed Feb 11 02:48:49 IST 2018:
//   * First edition
//
// Copyright (c) 2018-19 Suyash Mahar <suyash12mahar@outlook.com>

`timescale 1ns/1ps

module testbench_1_2_2;
   wire result;
   reg [1:0] inputReg;
   
   andGate a1
     (
      .input1(inputReg[0]),
      .input2(inputReg[1]),
      .result(result)
      );

   
   initial inputReg = 2'b00;
   reg 	     error;
   initial error = 1'b0;
   
   always begin
       /* Increment the input */
       inputReg = inputReg + 2'b01;

       #25  
	 /* verify the uut's output */
	 if ((result != &inputReg) || (^result === 1'bx)) begin
	     error = 1'b1;
	     $display("Testcase for input: %b, %b failed, output: %b, expected: %b", inputReg[0], inputReg[1], result, &inputReg);
	 end

       /* Check if the simulation ends on this input */
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
endmodule // testbench_1_2
