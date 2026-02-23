module d_ff(
input clk,rst,d,
output reg q
);
always@(posedge clk)
begin
  case(rst) 
      1'b0:q<=d;
      1'b1:q<=0;
  endcase
end
endmodule
