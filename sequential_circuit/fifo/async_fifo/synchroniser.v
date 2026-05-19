module synchroniser#(parameter depth=8,
	parameter N=$clog2(depth)
)(
input clk,rst,
input [$clog2(depth):0] gray_in,
output reg [$clog2(depth):0] gray_sync

);

reg [N:0]ff0;


 always@(posedge clk) begin

if (rst) begin
ff0<=0;
gray_sync<=0; end

else begin

ff0<=gray_in;
gray_sync<=ff0;
end
end
endmodule

