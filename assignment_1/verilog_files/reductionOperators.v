module reductionOperators 
  (
   input [15:0] i, 
   output 	r1, r2, r3, r4, r5, r6
   );

   // 16 bits of i are ANDed together and set as the value
   // of r1
   assign r1 = &i; // r1 = i[0] & i[1] & i[2] ... & i[15]
   // Other reduction operator follows same logic
   assign r2 = ~&i; // r2 = i[0] ~& i[1] ~& i[2] ... ~& i[15]
   assign r3 =  |i; // r3 = i[0]  | i[1]  | i[2] ...  | i[15]
   assign r4 = ~|i; // r4 = i[0] ~| i[1] ~| i[2] ... ~| i[15]
   assign r5 =  ^i; // r5 = i[0]  ^ i[1]  ^ i[2] ...  ^ i[15]
   assign r6 = ~^i; // r6 = i[0] ~^ i[1] ~^ i[2] ... ~^ i[15]
endmodule // reductionOperators   
   
