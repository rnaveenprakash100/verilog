module d_ff (input clk,rst,d,output reg q);
  always@(posedge clk) begin
    if(rst)
      q<=0;
    else
      q<=d;
  end
endmodule

module PIPO_register(input clk,rst,load,input[3:0]p_in,output [3:0] p_out);
  reg[3:0] mem;
  wire [3:0]d;
  assign d=load?p_in:mem;
  d_ff ff_0(.clk(clk),.rst(rst),.d(d[0]),.q(mem[0]));
  d_ff ff_1(.clk(clk),.rst(rst),.d(d[1]),.q(mem[1]));
  d_ff ff_2(.clk(clk),.rst(rst),.d(d[2]),.q(mem[2]));
  d_ff ff_3(.clk(clk),.rst(rst),.d(d[3]),.q(mem[3]));
  assign p_out=mem;
endmodule
