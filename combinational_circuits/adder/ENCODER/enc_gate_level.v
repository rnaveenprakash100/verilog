module encoder8to3 (
  input  [7:0]d_in,
  output [2:0]d_out
);

  or (d_out[2], d_in[4], d_in[5], d_in[6], d_in[7]);
  or (d_out[1], d_in[2], d_in[3], d_in[6], d_in[7]);
  or (d_out[0], d_in[1], d_in[3], d_in[5], d_in[7]);
endmodule
