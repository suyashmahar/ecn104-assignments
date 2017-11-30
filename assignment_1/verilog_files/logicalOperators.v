module logicalOperators
  (
   output o1, o2
   );

   assign o2 = (2'b10 & 1'b01) && (2'b00 & 1'b11);		// = 1'b0
   assign o1 = ((1'b1 == 1'b0) || ((2'b11 && 2'b01) == 2'b01)); // = 1'b1
endmodule // logicalOperators
