`timescale 1ns/1ps

module testbench;
   // Declare a new clk as reg
   reg clk;

   // Instantiate the module to test
   testModule uut(clk, ...ports...);

   initial begin
       clk = 1'b0;		// Initialize the clock
       forever begin
	   #7.5 clk = ~clk;
       end
   end
endmodule // testbench

