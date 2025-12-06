// verilog for user defined primitive

primitive UDP_02467 (D, A, B, C);
  output D;
  input A, B, C;

  // Truth table for d= f(a, b, c) = sum(0, 2, 4, 6, 7)
  table
//  A  B  C  :  D
    0  0  0  :  1;
    0  0  1  :  0;
    0  1  0  :  1;
    0  1  1  :  0;
    1  0  0  :  1;
    1  0  1  :  0;
    1  1  0  :  1;
    1  1  1  :  0;
  endtable
endprimitive

// primitive instantion

module ciruit_with_udp_02467 (e, f, a, b, c, d);
  output e, f;
  input a, b, c, d;

  UDP_02467 (e, a, b, c);
  and (f, e, d);
endmodule