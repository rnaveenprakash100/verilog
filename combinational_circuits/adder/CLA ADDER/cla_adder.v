module cla_4bit(
input [3:0] a,
input [3:0] b,
input cin,
output [3:0] sum,
output cout
);
wire [3:0] g,p;
wire [3:0] c;
  
assign g=a&b;
assign p=a^b;
  
assign c[0]=g[0]|(p[0]&cin);
assign c[1]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
assign c[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
assign c[3]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
  
assign sum=p^{c[2:0],cin};
assign cout = c[3];
endmodule
