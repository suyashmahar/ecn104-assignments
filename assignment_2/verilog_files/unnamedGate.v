/* 
 * Gates in Verilog can be instantiated without a name,
 * such instantiation in Verilog is legal.
 */
module unnamedGate(input1, input2, result);
   input input1, input2;
   output result;
   
   and(result, input1, input2); // Unnamed gate
endmodule // unnamedGate
