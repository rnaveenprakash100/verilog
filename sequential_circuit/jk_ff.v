module jk_ff(
input clk,
input rst,
input j,
input k,
output reg q
);
always@(posedge clk or posedge rst)
begin
if(rst)
q<=0;
else
begin
if(j==0&&k==0)
q<=q;
else if(j==0&&k==1)
q<=0;
else if(j==1&&k==0)
q<=1;
else if(j==1&&k==1)
q<=~q;
end
end
endmodule
