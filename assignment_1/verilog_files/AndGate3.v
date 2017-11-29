  // Define the top-level module called AndGate3 which is a three 
  // input AND gate. It instantiates 2 2-input AND gates. 
  // Interconnections will be explained later 
  module AndGate3(input1, input2, input3, result);
     input input1, input2, input3; // Declare variables as input
     output result; // declare result as an output
  
     wire   result1; // To be explained later

      // Instatiation of 2-input AND gates
     AndGate2(input1, input2, result1);
     AndGate2(result1, input3, result);
  endmodule

  // Define a module AndGate2 which is a 2-input AND gate.
  module AndGate2(input1, input2, result);
     // Assignment would be explained later
     assign result = input1 & input2;
  endmodule
