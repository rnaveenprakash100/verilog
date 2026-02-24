module  d_ff(input clk,rst,d,output reg q);
  always @ (posedge clk) begin
    if(rst)
      q<=0;
  else
    q<=d;
  end
endmodule

module d_ff_async_up_counter(input clk,rst,output [3:0]q);
wire q0,q1,q2,q3;
  
  d_ff q0_ff(.clk(clk),.rst(rst),.d(~q0),.q(q0));
  d_ff q1_ff(.clk(q0),.rst(rst),.d(~q1),.q(q1));
  d_ff q2_ff(.clk(q1),.rst(rst),.d(~q2),.q(q2));
  d_ff q3_ff(.clk(q2),.rst(rst),.d(~q3),.q(q3));

  assign q={q3,q2,q1,q0};
endmodule
    
      
