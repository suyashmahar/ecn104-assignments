/* Compiler directive to specify time unit, which will be
 * used for assigning propogation delays of logic gates.
 */ 
`timescale 1ns/1ps

module delayExample(input1, input2, result);
   input input1, input2;
   output result;

   // Specify a NAND gate having propogation delay of 2ns
   nand #(2) nd1(result, input1, input2);
endmodule // delayExample
