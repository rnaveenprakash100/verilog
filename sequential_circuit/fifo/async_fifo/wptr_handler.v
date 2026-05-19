module w_ptr_handler#(parameter depth=8, 
                         parameter N=$clog2(depth))
(
input wclk,rst,
input w_en,
input[N:0] r_sync_gray,
output reg full,
output reg [N:0]w_ptr,
output reg  [N:0]w_gray_ptr
);
 
wire fullt;
wire [N:0]w_binary_nxt;
wire [N:0]w_gray_nxt;

assign  w_binary_nxt=w_ptr+1'b1;
assign w_gray_nxt=w_binary_nxt ^ ((w_binary_nxt)>>1);

always@(posedge wclk) begin
 if (rst) begin
   w_ptr<=0;
  w_gray_ptr<=0;
end

else begin
   if (w_en&&(!full)) begin
  w_ptr<=w_binary_nxt;
  w_gray_ptr<=w_gray_nxt;
end
end
end
assign fullt=(w_gray_nxt=={~r_sync_gray[N:N-1],r_sync_gray[N-2:0]});

always@(posedge wclk) begin
	if (rst)
		full<=0;
  else 
	  full<=fullt;
  end


endmodule
