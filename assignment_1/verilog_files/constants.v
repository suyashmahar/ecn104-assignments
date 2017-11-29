  `define A 2'200 // NOTE: Constant declarations do 
  `define B 2'b01 // not end with semicolon!
  `define C 2'210
  `define D 2'b11
  
  // Using constants
  wire [A:0] wire_a = `A; // Notice the backtick
  wire [B:0] wire_b = `B;
  wire [C:0] wire_c = `C;
  wire [D:0] wire_d = `D;

