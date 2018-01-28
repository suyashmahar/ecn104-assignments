`timescale 1ns/1ps

module testbench_1_1;
   reg [32:0] inputSignal;
   wire [32:0] result;
   reg [31:0]  failureCount;
   
   initial begin
       failureCount = 0;
       inputSignal = 32'h00000000;
   end

   always #10 inputSignal = inputSignal + 32'h00000011;


   // Initialize module
   module_1_1 uut(.inputSignal(inputSignal), .result(result));
   

   always @(result) begin
       if (result != inputSignal<<5) begin
	   $display("Testcase for input: %d failed, output: %d, expected: %d.", inputSignal, result, inputSignal<<5);
       end else begin
	   failureCount = failureCount + 1;
       end
   end

   always @(inputSignal) begin
       if (inputSignal == 32'hffffffff) begin
	   $display("Test completed, %d failed out of total %d", failureCount, 1<<32);
	   $finish;
       end
   end   
endmodule // testbench1
