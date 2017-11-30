module airthmeticOperators 
  (
   output o1, o2, o3, o4, o5, o6, o7, o8
   );

   assign o1 =  1 +  2; // = 3
   assign o2 =  1 -  2; // = -1
   assign o3 = 10 *  5;	// = 50
   assign o4 = 10 /  5;	// = 2
   
   assign o5 =  5 / 10;	// = 0 <--- NOTE
   
   assign o6 = 10 %  3; // = 1
   assign o7 = +7;	// = 7
   assign o8 = -7;	// = -7
endmodule // airthmeticOperators
