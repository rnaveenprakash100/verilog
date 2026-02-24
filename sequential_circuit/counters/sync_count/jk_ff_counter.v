module jk_ff(input clk,rst,j,k,output reg q);
always@(posedge clk or posedge rst)begin
 if(rst)
  q<=0;
 else begin
  case({j,k})
   2'b00:q<=q;
   2'b01:q<=0;
   2'b10:q<=1;
   2'b11:q<=~q;
  endcase
 end
end
endmodule


module jk_sync_counter(input clk,rst,output[3:0]q);
wire q0,q1,q2,q3;

jk_ff ff0(.clk(clk),.rst(rst),.j(1'b1),.k(1'b1),.q(q0));
jk_ff ff1(.clk(clk),.rst(rst),.j(q0),.k(q0),.q(q1));
jk_ff ff2(.clk(clk),.rst(rst),.j(q0&q1),.k(q0&q1),.q(q2));
jk_ff ff3(.clk(clk),.rst(rst),.j(q0&q1&q2),.k(q0&q1&q2),.q(q3));

assign q={q3,q2,q1,q0};
endmodule
