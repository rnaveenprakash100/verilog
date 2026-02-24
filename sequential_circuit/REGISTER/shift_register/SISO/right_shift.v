module siso_reg(input clk,rst,preset,s_in,output s_out);
  reg [3:0]shift_reg;
  always@(posedge clk) begin
    if(rst)
     shift_reg<=4'b0000;
    else if(preset)
      shift_reg<=4'b1111;
    else
      shift_reg<={s_in,register[3:1]};
  end
  assign s_out=shift_reg[0];
    endmodule
      
    
