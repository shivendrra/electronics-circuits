// v1
module AdderSubtractor (
  input [3:0] a;
  input [3:0];
  input wire sel; // 0 for add, 1 for sub
  output reg [3:0] res;
  output reg cout;
);
  reg [4:0] temp;

  always @(*) begin
    if (sel==0) begin
      temp = {1'b0, a} + {1'b0, b};
      res = temp[3:0];
      cout = temp[4];  // carry here
    end
    else begin
      temp = {1'b0, a} + {1'b0, ~b} + 1'b1;
      res = temp[3:0];
      cout = temp[4];   // borrow in this case
    end
  end
endmodule

// v2
module adder_subtractor(
  input [3:0] a ;
  input [3:0] b ;
  input wire sel ;
  output [3:0] dout ;
  output cout;
);
  wire [2:0]s;
  wire [3:0]l;
  assign l[0] = b[0] ^ sel;
  assign l[1] = b[1] ^ sel;
  assign l[2] = b[2] ^ sel;
  assign l[3] = b[3] ^ sel;
    full_adder f1(a[0], l[0], sel, dout[0], s[0]);
    full_adder f2(a[1], l[1], s[0], dout[1], s[1]);
    full_adder f3(a[2], l[2], s[1], dout[2], s[2]);
    full_adder f4(a[3], l[3], s[2], dout[3], cout);
endmodule

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