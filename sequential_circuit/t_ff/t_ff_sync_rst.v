module t_ff(
  input clk,rst,t,
  output reg q
);
  always@(posedge clk )begin
    case(rst)
       1'b1:q<=0;
       1'b0:q<=t^q;
      endcase
  end
endmodule
