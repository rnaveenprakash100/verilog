// clk_in =50 mhz;  clk_out = 100 hz

module clk_div#(parameter MAX_CNT=2_50_000)(
input clk_in,rst,
output reg clk_out
);

localparam WIDTH=$clog2(MAX_CNT);
reg  [WIDTH-1:0] count;  

initial begin
clk_out=0;
count=0;
end

always @ (posedge clk_in) begin
if (rst)begin
count<=0;
clk_out<=0;
end
else if (count==MAX_CNT-1)begin
count<=0;
clk_out <= (~clk_out);
end
else 
count<=count+1;
end


endmodule
