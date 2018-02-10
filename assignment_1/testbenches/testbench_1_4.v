`timescale 1ns/1ps

module testbench_1_4;
   wire [31:0] result;
   reg [31:0] inputSignal;
   
   multiplier mul1
     (
      .inputSignal(inputSignal),
      .result(result)
      );

   
   reg 	      error;
   initial begin
       inputSignal = 32'h0000_0000;
       error = 1'b0;
   end

   always #10 inputSignal = inputSignal + 32'h00000111;
   
   always @(result) begin
       if (result != (inputSignal * 10)) begin
	   error = 1'b1;
	   $display("Testcase for input: %b failed, output: %b, expected: %b.", inputSignal, result, result*10);
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
