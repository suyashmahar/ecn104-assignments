  // andGate4 is a four input AND gate that uses 3 2-input AND
  // gates to produce its result. resultTemp0 and resultTemp1 wires
  // are used to connect output of two andGate2 to a another andGate2
  // This module uses andGate2 module from previous listing.
  module andGate4(input0, input1, input2, input3, result);
     // Declare input and output
     input input0, input1, input2, input3;
     output result;
  
     // Declare wire for connecting gates
     wire resultTemp0;
     wire resultTemp1;
  
     // Declare instances of 2-input AND gate
     andGate2(input0, input1, resultTemp0);
     andGate2(input2, input3, resultTemp1);
  
     andGate2(resultTemp0, resultTemp1, result);
  endmodule
     
  
