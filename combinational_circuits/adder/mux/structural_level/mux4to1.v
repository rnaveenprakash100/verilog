module mux4to1_gate(
input [3:0]din,
input [1:0]sel,
output y
);
wire nsel0,nsel1;
wire and0,and1,and2,and3;
  
not (nsel0,sel[0]);
not (nsel1,sel[1]);

and (and0,din[0],nsel1&nsel0);
and (and1,din[1],nsel1&sel[0]);
and (and2,din[2],sel[1]&nsel0);
and (and3,din[3],sel[1]&sel[0]);

or (y,and0,and1,and2,and3);
endmodule
