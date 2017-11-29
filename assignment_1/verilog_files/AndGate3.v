  // Define the top-level module called ripple carry 
  // counter. It instantiates 4 T-flipflops. Interconnections are 
  // shown in Section 2.2, 4-bit Ripple Carry Counter. 
  module AndGate3(input1, input2, input3, result);
     input input1, input2, input3;
     output result;
  
     wire   result1;
     
     AndGate2(input1, input2, result1);
     AndGate2(result1, input3, result);
  endmodule

  module AndGate2(input1, input2, result);
     assign result = input1 & input2;
  endmodule
