`default_nettype none
module top
  (input wire clk, rstn,
   output logic react_y, react_y0, react_y1, hb);

   logic 	tick_en;
   assign hb = tick_en;
   
   clock_en clkgen
     (.clk(clk), .rstn(1'b1), .tick_en(tick_en));
   
   fsm reactive_module
     (.clk(tick_en), .din(rstn), .en(1'b1), .dout(react_y), .doutf(react_y0), .doutg(react_y1));
   
endmodule // top

/* 
 G (en -> (X dout <-> din)))
 G (en -> (X (X doutf <-> dout))))
 G (!en -> (X dout <-> dout))
 G (!en -> (X (X doutf <-> doutf)))
 */

/* better:
 G (en -> (X dout <-> din))
 G (en -> (X doutf <-> dout))
 G (!en -> (X dout <-> dout))
 G (!en -> (X doutf <-> doutf))
 */
