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