`timescale 1ns/1ps

module testbench_1_2_2;
   wire result;
   reg [1:0] inputReg;
   
   nand_gate 
     (
      .input1(inputReg[0]),
      .input2(inputReg[1]),
      .result(result)
      );

   
   initial inputReg = 2'b00;

   always begin
       inputReg = inputReg + 2'b01;
       #25
	 if (inputReg == 2'b11) begin
	     $display("Test completed successfuly, all testcases passed.");
	     $finish;
	 end
   end

   always @(result) begin
       if (result != ~&inputReg) begin
	   $display("Testcase for input: %d, %d failed, output: %d, expected: ", input1, input2, ~(input1&input2));
       end
   end
endmodule // testbench_1_2
