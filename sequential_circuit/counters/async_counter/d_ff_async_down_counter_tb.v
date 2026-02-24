module tb;
  reg clk;
  reg rst;
  wire [3:0] q;
  d_ff_async_down_counter dut(
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #200 $finish;
  end

  initial begin
    $monitor("time=%0t clk=%b rst=%b q=%b",$time,clk,rst,q);
    $dumpfile("d_ff_async_down_counter.vcd");
    $dumpvars(0,tb);
  end
endmodule
