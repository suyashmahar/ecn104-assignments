`timescale 1ns/1ps

module assignmentDelay(input1, input2, result);
   input input1, input2;
   output result;

   // Defines a circuit which will have output value
   // input1 | input2 15ns after changing input
   assign #15 result = input1 | input2;
endmodule // assignmentDelay
