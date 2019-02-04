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
   
   always @(inputSignal) begin
       /* Verify input and check for high impedance and unknown values */
       if (result !== (inputSignal * 10) || (^result === 1'bx)) begin
	   error = 1'b1;
	   $display("Testcase for input: %b failed, output: %b, expected: %b.", inputSignal, result, inputSignal*10);
       end
   end
   
   always @(inputSignal) begin
       if (inputSignal >= 32'h0fff_ffff) begin
       $display("\n\n**************************************");
	   if (error == 1'b1) begin
	       $display("Testcase(s) failed!");
	       $finish;
	   end else begin
	       $display("All testcases passed!");
	   end
      $display("**************************************\n\n");
	   $finish;
       end
   end
endmodule // testbench_1_2
