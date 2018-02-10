`timescale 1ns/1ps

module testbench_1_2_1;
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

   always #10 inputSignal = inputSignal + 32'h00000111;
   
   always @(evenParity, oddParity) begin
       if ((evenParity != ^inputSignal) && (oddParity != ~^inputSignal)) begin
	   error = 1'b1;
	   $display("Testcase for input: %b failed, output -> evenParity: %b, oddParity: %b, expected-> evenParity: %b, oddParity: %b.", inputSignal, evenParity, oddParity, ^inputSignal, ~^inputSignal);
       end
   end

   always @(inputSignal) begin
       if (inputSignal >= 32'h0fff_ffff) begin
	   if (error == 1'b1) begin
	       $display("Testcase(s) failed!");
	   end else begin
	       $display("All testcases passed!");
	   end
	   $finish;
       end
   end
endmodule // testbench_1_2
