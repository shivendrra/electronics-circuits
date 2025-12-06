// gate level model with propagation delay

module simple_prop_delay (A, B, C, D, E);
  output D, E;
  input A, B, C;
  wire w1;

  and #(30) G1 (w1, A, B);
  not #(10) G2 (E, C);
  or #(20) G3 (D, w1, E);
endmodule

// test bench for delay

module t_simple_prop_delay;
  wire D, E;
  reg A, B, C;

  simple_prop_delay M1 (A, B, C, D);

  initial begin
    A = 1`b0; B = 1`b0; C = 1`b0;
    #100A = 1`b1; B = `1b1; C = 1`b1;
  end
  initial #200 $finish;
endmodule