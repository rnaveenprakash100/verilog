module clk_div_tb;
reg clk;
reg rst;
wire clk_out;

clk_div  dut (
              .clk_in(clk),
              .rst(rst),
              .clk_out(clk_out)
              );

initial begin
clk=0; 
forever #1 clk=~clk;
end
 
initial begin
   rst=1;
#11 rst=0;
end

initial begin
$dumpfile ("clock_divider.vcd");
$dumpvars(0,clk_div_tb);
  $monitor("time=%0t , clk_in=%b  ,clk_out=%b",$time ,clk , clk_out);
end
 
initial begin
#100 $finish;
end
endmodule    
