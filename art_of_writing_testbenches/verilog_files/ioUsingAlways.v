`timescale 1ns/1ps

// Example testbench for an asynchronous 4-bit circuit which produces
// a 4-bit result, the design shifts the input left by 1 bit.
module testbench;
   reg [3:0] inputA;
   wire [3:0] result;

   testModule uut(inputA, result);

   initial begin
       inputA = 4'b0000;
       forever begin
	   #10 inputA = inputA + 4'b0001;
       end
   end

   always @(result)
     if (result != inputA << 1'b1) begin
	 // Dislay statements are used to display text to console
	 // during the simulation, they are often helpful for
	 // debugging and gathering simulation information.
	 
	 // You can read more about them here:
	 // http://bit.ly/verilogDisplay
	 // or a more detailed explanation from:
	 // http://verilog.renerta.com/source/vrg00013.htm
	 $display("Design failed for input %d!", inputA);
     end
endmodule // testbench
