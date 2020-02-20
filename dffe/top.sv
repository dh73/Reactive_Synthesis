`default_nettype none
module top
  (input wire clk, rstn,
   output logic react_y);

   logic 	tick_en;
   logic 	feedback;

   assign feedback = ~ react_y;
   
   clock_en clkgen
     (.clk(clk), .rstn(rstn), .tick_en(tick_en));
   
   fsm reactive_module
     (.clk(clk), .din(feedback), .en(tick_en), .dout(react_y));
   
endmodule // top
