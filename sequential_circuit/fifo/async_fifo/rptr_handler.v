module r_ptr_handler#(parameter depth=8,
                      parameter N=$clog2(depth))
(
input rclk,rst,
input r_en,
input [N:0] w_sync_gray,
output reg empty,
output   reg [N:0] r_ptr,
output reg [N:0] r_gray_ptr
);

wire [N:0] r_binary_nxt;
wire [N:0] r_gray_nxt;
wire emptyt;

assign r_binary_nxt=r_ptr+1'b1;
assign r_gray_nxt=r_binary_nxt^(r_binary_nxt>>1);

always@(posedge rclk) begin
if (rst) begin
 r_ptr<=0;
r_gray_ptr<=0;
end

else begin
if (r_en&&(!empty)) begin
r_ptr<=r_binary_nxt;
r_gray_ptr<=r_gray_nxt;
end
end
end

assign emptyt=( r_gray_nxt==w_sync_gray);
always@( posedge rclk) begin
	 if (rst )
		 empty<=1;
	 else 
		 empty<=emptyt;
 end
 endmodule


