module fsm_tb;
reg clk,rst,x;
wire y;

mealy_fsm dut(.clk(clk),.rst(rst),.x(x),.y(y));
always #5 clk=~clk;

initial begin
 clk=0;
 rst=1;
 x=0;
 #10 rst=0;
 #10 x=1;
 #10 x=0;
 #10 x=0;
 #10 x=1;
 #10 x=0;
 #10 x=0;
 #10 x=1;
 #20 $finish;
end
  
initial begin
  $monitor("time=%0t rst=%b x=%b y=%b",$time,rst,x,y);
  $dumpfile("fsm_mealy.vcd");
  $dumpvars(0,fsm_tb);
end

endmodule
