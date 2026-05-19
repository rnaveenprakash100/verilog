module async_fifo_memory#(parameter depth=8,
                          parameter width=8,
                          parameter N=$clog2(depth)
)(
input r_en,w_en,
input rclk,wclk,
input [N:0]rptr,[N:0]wptr,
input full,empty,
input [width-1:0]data_in,
output reg [width-1:0] data_out
);

reg [width-1:0] memory [depth-1:0]; 
integer i;

always@(posedge rclk) begin

if ((!empty)&&(r_en)) 
data_out<=memory[rptr];
end

always@(posedge wclk) begin
if ((!full)&&(w_en)) 

memory[rptr]<=data_in;
end 


endmodule

  
