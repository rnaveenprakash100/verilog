module sync_fifo #(
    parameter DATA_W = 8,
    parameter DEPTH  = 16,
    parameter ADDR_W = 4
)(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [DATA_W-1:0] din,
    output reg [DATA_W-1:0] dout,
    output full,
    output empty
);
  
reg [DATA_W-1:0] mem [DEPTH-1:0];
reg [ADDR_W:0] wr_ptr,rd_ptr;

assign full=(wr_ptr[ADDR_W-1:0]==rd_ptr[ADDR_W-1:0]) &&
            (wr_ptr[ADDR_W]!=rd_ptr[ADDR_W]);
assign empty=(wr_ptr==rd_ptr);

always @(posedge clk) begin

    if(rst) begin
        wr_ptr<=0;
        rd_ptr<=0;
        dout<=0;
    end

    else begin

        if(wr_en && !full) begin
            mem[wr_ptr[ADDR_W-1:0]]<=din;
            wr_ptr<=wr_ptr+1;
        end

        if(rd_en && !empty) begin
            dout<=mem[rd_ptr[ADDR_W-1:0]];
            rd_ptr<=rd_ptr+1;
        end

    end

end

endmodule
