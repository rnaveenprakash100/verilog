`include "synchroniser.v"
`include "rptr_handler.v"
`include "wptr_handler.v"
`include "fifo.v"

module async_fifo_topmodule#(parameter width=8,
 parameter depth=8,
parameter N=$clog2(depth)) (
input rst,
input rclk,wclk,
input r_en,w_en,
input [width-1:0]data_in,
output  [width-1:0]data_out,
output full,empty
) ;

wire [N:0] sync_gray_r_in,sync_gray_r_out;
wire [N:0] sync_gray_w_in,sync_gray_w_out;
wire [N:0] r_ptr_in,w_ptr_in;


synchroniser w_ptr_sync(
.clk(wclk),.rst(rst),
.gray_in(sync_gray_w_in),
.gray_sync(sync_gray_w_out)
);

synchroniser r_ptr_sync(
.clk(rclk),.rst(rst),
.gray_in(sync_gray_r_in),
.gray_sync(sync_gray_r_out)
);

r_ptr_handler rptr_h(
.rclk(rclk),.rst(rst),
.r_en(r_en),
.w_sync_gray(sync_gray_w_out),
.empty(empty),
.r_ptr(r_ptr_in),
.r_gray_ptr(sync_gray_r_in)
);

w_ptr_handler wptr_h(
.wclk(wclk),.rst(rst),
.w_en(w_en),
.r_sync_gray(sync_gray_r_out),
.full(full),
.w_ptr(w_ptr_in),
.w_gray_ptr(sync_gray_w_in)
);

async_fifo_memory fifo(
	.r_en(r_en),.w_en(w_en),
.rclk(rclk),.wclk(wclk),
.rptr(r_ptr_in),.wptr(w_ptr_in),
.full(full),.empty(empty),
.data_in(data_in),
.data_out(data_out)
);

endmodule



  





