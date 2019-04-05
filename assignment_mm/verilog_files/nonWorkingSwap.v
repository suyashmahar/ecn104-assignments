// Following example is for swapping bytes
// input is of size 16 bits (2 bytes)
// This example does not work due to the use of blocking
// assignment.

// This example is taken from:
// http://www.sutherland-hdl.com/papers/1996-CUG-presentation_nonblocking_assigns.pdf

module swapBytes;
   ...
   reg [15:0] temp;
   ...

   // Can you guess the reason why this block won't swap
   // bytes?
   always @(...some_condition...) begin
       temp[15:8] = temp[7:0];
       temp[7:0] = temp[15:8];
   end
endmodule // swapBytes
