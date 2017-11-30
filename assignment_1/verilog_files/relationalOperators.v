module relationalOperators
  (
   output o1, o2, o3, o4
   );

   assign o1 = 1<2;		// = 1'b1
   assign o2 = 1>2;		// = 1'b0
   assign o2 = 1>=1;		// = 1'b1
endmodule // relationalOperators
