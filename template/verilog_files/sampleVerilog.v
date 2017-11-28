module vcMux2
  #( 
     parameter WIDTH = 1 
     ) (  
	  input [ WIDTH -1:0]  in0, in1, 
	  input [1:0] 	       sel, 
	  output [ WIDTH -1:0] out  
	  ); 

   always @(*) begin 
     case ( sel ) 1'd0 : out = in0; 
	 1'd1 : out = in1; 
	 default : out = { WIDTH {1'bx}}; 
     endcase 
   end 
endmodule
