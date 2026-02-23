module t_ff(
  input clk,rst,t,
  output reg q
);
  always@(posedge clk or posedge rst)begin
    if(rst)
      q<=0;
    else begin
      if(t==0)
        q<=q;
      else
        q<=~q;
    end
  end
endmodule
