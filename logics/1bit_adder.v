// full adder (logic flow)

module full_adder (input wire a, input wire b, input wire cin, output wire sum, output wire cout);
  assign sum  = a ^ b ^ cin;  // Sum bit
  assign cout = (a & b) | (b & cin) | (a & cin); // Carry-out bit
endmodule

// full adder (gate level)

module full_adder_struct (input wire a, input  wire b, input  wire cin, output wire sum, output wire cout);
  wire w1, w2, w3, w4;

  xor (w1, a, b);
  xor (sum, w1, cin);

  and (w2, a, b);
  and (w3, b, cin);
  and (w4, cin, a);

  or  (cout, w2, w3, w4);  // final output
endmodule
