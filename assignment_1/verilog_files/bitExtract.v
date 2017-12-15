module bitExtract(input1, bitsHigh, bitsLow, bitsMid);
   input [31:0] input1;		// Declare 32 bit input
   // Declare 3 output having 16 bit width
   output [15:0] bitsHigh;	// Higher 16 bits from input1
   output [15:0] bitsLow;	// Lower 16 bits from input1 
   output [15:0] bitsMid;	// Mid 16 bits from input1 

   // Assign values to output
   assign bitsHigh = input1[31:16]; // <-- Note that bit select is inclusive
   assign bitsLow  = input1[15:00];
   assign bitsMid  = input1[21:06];
   
endmodule // bitExtract

