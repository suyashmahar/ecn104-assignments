/* Example using gate-level modelling, gate is a built-in 
 * primitive in Verilog. Gates are instantiated in a way
 * similar to modules. Gates can be of single input or
 * multiple input
 */
module gateLevelExample(input1, input2, input3, result);
   input input1, input2, input3;
   output [8:0] result;

   // Single input gates
   not  g0(result[0], input1);	         // = ~input1

   // Two input gates
   and  g1(result[1], input1, input2);   // =   input1 & input2
   nand g2(result[2], input1, input2);   // = ~(input1 & input2)
   or   g3(result[3], input1, input2);   // =   input1 | input2 
   nor  g4(result[4], input1, input2);   // = ~(input1 | input2 )
   xor  g5(result[5], input1, input2);   // =   input1 ^ input2
   xnor g6(result[6], input1, input2);   // = ~(input1 ^ input2)

   // Gates with more than two input
   xnor g7(result[7], input1, input2, input3);
   and  g8(result[8], input1, input2, input3, input1); 
endmodule // gateLevelExample
