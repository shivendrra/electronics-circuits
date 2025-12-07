// full adder (logic flow)
module full_adder (
  input wire a,
  input wire b,
  input wire cin,
  output wire sum,
  output wire cout
);
  assign sum  = a ^ b ^ cin;  // Sum bit
  assign cout = (a & b) | (b & cin) | (a & cin); // Carry-out bit
endmodule

// full adder (gate level)
module full_adder_struct (
  input wire a,
  input wire b,
  input wire cin,
  output wire sum,
  output wire cout
);
  wire w1, w2, w3, w4;

  xor #1 (w1, a, b);
  xor #1 (sum, w1, cin);

  and #1 (w2, a, b);
  and #1 (w3, b, cin);
  and #1 (w4, cin, a);

  or #1 (cout, w2, w3, w4);  // final output
endmodule