// Following example is for swapping bytes
// using non-blocking assigment, this module
// unlike last example uses non-blocking assignment
// this allows swapping bytes correctly.

// This example is taken from:
// http://www.sutherland-hdl.com/papers/1996-CUG-presentation_nonblocking_assigns.pdf

module swapBytes;
   ...
   reg [15:0] temp;
   ...

   // This one works!     
   always @(...some_condition...) begin
       temp[15:8] <= temp[7:0];
       temp[7:0] <= temp[15:8];
   end
endmodule // swapBytes
