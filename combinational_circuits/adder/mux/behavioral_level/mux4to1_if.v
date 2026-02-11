module mux4to1_if(
input [3:0]din,
input [1:0]sel,
output reg y
);
always @(*) begin
    if(sel==2'b00)
        y=din[0];
    else if(sel==2'b01)
        y=din[1];
    else if(sel==2'b10)
        y=din[2];
    else
        y=din[3];
end
endmodule
