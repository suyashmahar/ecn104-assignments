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
   

   always @(result) begin
       if (result != inputSignal<<5) begin
	   $display("Testcase for input: %d failed, output: %d, expected: %d.", 
		    inputSignal, result, inputSignal<<5);
	   failureCount = failureCount + 1;
       end 
   end

   always @(inputSignal) begin
       if (inputSignal >= 32'h0fffffff) begin
	   $display("Test completed, %d failed!", failureCount);
	   $finish;
       end
   end   
endmodule // testbench1
