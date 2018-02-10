module parityBits(inputSignal, evenParity, oddParity);
   input [31:0] inputSignal;
   output 	evenParity, oddParity;

   assign evenParity = ^(inputSignal);
   assign oddParity = ~^(inputSignal);
endmodule
