/* 
 * Following module uses continuous assignement to model
 * an AND gate
 */
module continuousAssignment(input1, input2, result);
   input input1, input2;
   output result;

   /* Use continuous assignment to set result
    * This is equalent to:
    *     and (result, input1, input2); 
    */    
   assign result = input1 & input2;
endmodule // continuousAssignment
