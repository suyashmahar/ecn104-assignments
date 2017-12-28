/* 
 Synchronous module which changes output only on positive
 edge of clk.
 */
module alwaysExample(clk, input1, input2, result);
   input clk, input1, input2;
   output result;

   // Declare output as reg, this will be explained later
   reg result;
 
   // Here condition is *positive edge of clk*, this implies
   // following event only takes place when a positive edge
   // of clk arrives
   always @(posedge clk) begin
       // Assign value to reg result using procedural assignment
       result = input1 & input2;
   end
endmodule // alwaysExample
