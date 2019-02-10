// 
// Testbench for parityBits defined in module_1_3 
// 
// History:
// * Wed Feb  6 09:51:58 IST 2019: Changes:
//   * Fixed checks for unknown and high impedance states in 
//     the result
//   * Results are now verified on change of input and not 
//     even and odd parity 
// * Wed Feb 11 02:48:49 IST 2018:
//   * First edition
//
// Copyright (c) 2018-19 Suyash Mahar <suyash12mahar@outlook.com>

`timescale 1ns/1ps

module testbench_1_3_1;
   wire evenParity, oddParity;
   reg [31:0] inputSignal;
   
   parityBits pbs1
     (
      .inputSignal(inputSignal),
      .evenParity(evenParity),
      .oddParity(oddParity)
      );

   
   reg 	      error;
   initial begin
      inputSignal = 32'h0000_0000;
      error = 1'b0;
   end
   
   always begin
      inputSignal = inputSignal + 32'h00000111;
      
      #10 
	 
	if ((evenParity != ^inputSignal) 
	    || (oddParity != ~^inputSignal) 
	    || (^evenParity === 1'bx) 
	    || (^oddParity === 1'bx)) begin
	   error = 1'b1;
	   $display("Testcase for input: %b failed, output -> evenParity: %b, oddParity: %b, expected-> evenParity: %b, oddParity: %b.", inputSignal, evenParity, oddParity, ^inputSignal, ~^inputSignal);
	   $finish;
	end
      
      if (inputSignal >= 32'h0fff_ffff) begin
	 $display("\n\n**************************************");
	 if (error == 1'b1) begin
	    $display("Testcase(s) failed!");
	 end else begin
	    $display("All testcases passed!");
	 end
	 $display("**************************************\n\n");
	 $finish;
      end
   end
endmodule // testbench_1_2
