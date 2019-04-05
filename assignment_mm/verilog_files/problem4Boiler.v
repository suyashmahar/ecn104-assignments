`timescale 1ns/1ps

/* Sample code for turing module, **DO NOT** change the module name or
/* the I/O declaration.*/
module turing(clk, result, done);
   input wire clk;
   output reg [32-1:0] result;
   output reg 	       done;

   /* Define few constants to represent the states of each tape
   /* location.*/
    
    `define SYMB_A      2'b00
    `define SYMB_ADD    2'b01
    `define SYMB_BLANK  2'b10
   
   /******************************************************/
   /* All changes to this code should be below this line */
   /******************************************************/
   
   /* Declare a tape and other required variables/nets here, please
   /* note that since we have declared the symbols to be 2 bit wide,
   /* your tape should also have 2bit wide locations. To assign a
   /* symbol to any location use the following syntax:
   /* 
   /*     your_tape_name[your_counter] = `SYMB_A
   /*
   /* To assign the location at your_counter the symbol 'A'*/
      
   initial begin
      /* Initialize the tape and other global variables */
   end
    
   always @(posedge clk) begin
      /* Describe your turing machines here */
   end

endmodule // turing
