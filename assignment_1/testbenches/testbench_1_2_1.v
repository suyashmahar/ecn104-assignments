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
	     if (error == 1'b0) begin
		 $display("Test completed successfuly, all testcases passed.");
	     end  else begin
		 $display("Test cases failed!");
	     end
	     $finish;
	 end
   end

   always @(result) begin
       if (result != ~&inputReg) begin
	   error = 1'b1;
	   $display("Testcase for input: %b, %b failed, output: %b, expected: %b", inputReg[0], inputReg[1], result, ~(inputReg[1]&inputReg[2]));
       end
   end
endmodule // testbench_1_2
