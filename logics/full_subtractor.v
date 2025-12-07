// full subtractor (logic flow)
module full_subtractor (
  input wire a,      // Minuend
  input wire b,      // Subtrahend  
  input wire bin,
  output reg sum,
  output reg bout
);
always @(*) begin
  sum = a ^ b ^ bin;  // Diff
  bout = (~a & b) | (~(a ^ b) & bin);  // Borrow-out
end
endmodule