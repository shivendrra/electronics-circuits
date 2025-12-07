// full subtractor (gate-level)
module full_subtractor_struct 
  input wire a,
  input wire b,
  input wire bin,
  output wire sum,
  output wire bout
;
  wire w1, w2, w3, w4;  // Intermediate wires
  // sub: a - b
  xor #1 (w1, a, b);      // diff1
  and #1 (w2, ~a, b);     // b1 = a' · b

  // sub2 = diff1 - bin  
  xor #1 (sum, w1, bin);  // sum = Difference1 ⊕ Bin
  and #1 (w3, ~w1, bin);  // b2 = diff1' · bin
  or #1 (bout, w2, w3);  // bout = b1 + b2
endmodule