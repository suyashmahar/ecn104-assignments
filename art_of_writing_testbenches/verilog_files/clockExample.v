`timescale 1ns/1ps
// Preceding preprocessing directive is very important when writing a
// testbench, it indicates that all the timings are in steps of 1ns
// and have a resolution of 1ps.

// Timescales in Verilog are specified in the following format:
// `timescale <reference_time>/<precesion>
// e.g.:
//     `timescale 1ns/1ps
//     If a delay statement is used such that, #x.y then the the 
//     simulation delay will be x.y ns.
//     
//     But the minimum delay you can achieve is log10(x/y), which for
//     this example is 3 (since 1ns/1ps = 1ns/10^-3ns = 10^3).
//
//     Thus, #0.0002 with this example would give you a 0ns delay

module testbench;
   // Declare a new clk as reg
   reg clk;

   // Instantiate the module to test
   testModule uut(clk, ...ports...);

   // Initialize the clock to a value
   initial begin
       clk = 1'b0;
   end

   // Flip the clock every 7.5 ns
   always begin
       #7.500 clk = ~clk;
   end
endmodule // testbench
