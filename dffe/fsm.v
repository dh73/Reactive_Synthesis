module fsm(din, en, dout, clk);
   input clk;
   input din;
   input en;
   output dout;
   reg [0:0] state;
   
   assign dout = ((state == 0) && ((((din || en) && (din || !en)) && (!din || en)) && (!din || !en)) || (state == 1) && ((din || en) && (!din || en))) ? 1 : 0;
   
   initial
     begin
	state = 0;
     end
   
   always @(posedge clk)
     begin
	case(state)
	  0: if ((((din || en) && (!din || en)) && (!din || !en)))
            state <= 0;
          else 
            state <= 1;

	  1: if (1)
            state <= 0;
          else 
            state <= 1;

	endcase
     end // always @ (posedge clk)

`ifdef FPV_CHECK
   // Formal Properties
   default clocking fpv_clk @(posedge clk); endclocking
   // 1) (G (en) -> (X dout <-> din))
   // 2) (G (!en) -> (X dout <-> dout))
   property ap1_check;
      (en && din |-> ##1 dout == $past(din)); 
   endproperty // ap1_check
   ap1_check_assert: cover property (ap1_check);
   
   property ap2_check;
      (!en && din |-> ##1 $stable(dout));
   endproperty // ap2_check
   ap2_check_assert: cover property (ap2_check);
`endif //  `ifdef FPV_CHECK
endmodule // fsm

