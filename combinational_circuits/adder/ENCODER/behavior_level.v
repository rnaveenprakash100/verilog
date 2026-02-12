module encoder_2in1(
  input [3:0]d_in,
  input sel,
  output reg [1:0]d_out
);
  
  function [1:0]priority_enco_lsb;
    input [3:0]d_in;
     begin
      if( d_in[0])
       priority_enco_lsb=2'b00;
      else if( d_in[1])
       priority_enco_lsb=2'b01;
      else if( d_in[2])
       priority_enco_lsb=2'b10;
      else if( d_in[3])
       priority_enco_lsb=2'b11;
    else
       priority_enco_lsb=2'bxx;
    end
  endfunction
    
 function [1:0]priority_enco_msb;
   input [3:0] d_in;
     begin
 
      if( d_in[3])
        priority_enco_msb=2'b11;
      else if( d_in[2])
        priority_enco_msb=2'b10;
      else if( d_in[1])
        priority_enco_msb=2'b01;
      else if( d_in[0])
        priority_enco_msb=2'b00;
      else
        priority_enco_msb=2'bxx;
    end
    endfunction
   always@(*) begin
     case(sel)
       1'b0:d_out=priority_enco_lsb(d_in);
       1'b1:d_out=priority_enco_msb(d_in);
       default :d_out =priority_enco_lsb(d_in);
     endcase
   end
       endmodule
      
    
    
    
      
  
