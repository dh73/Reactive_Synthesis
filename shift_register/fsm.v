module fsm(en, din, dout, doutf, doutg, clk);
   input clk;
   input en;
   input din;
   output dout;
   output doutf;
   output doutg;
   reg [2:0] state;

   assign dout = ((state == 2) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 4) && 1 || (state == 5) && 1 || (state == 6) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 7) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 0) && 1 || (state == 1) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 3) && 1) ? 1 : 0;
   assign doutf = ((state == 2) && 1 || (state == 4) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 5) && 1 || (state == 6) && 1 || (state == 7) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 0) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 1) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 3) && 1) ? 1 : 0;
   assign doutg = ((state == 2) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 4) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 5) && 1 || (state == 6) && 1 || (state == 7) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)) || (state == 0) && 1 || (state == 1) && 1 || (state == 3) && ((((en || din) && (en || !din)) && (!en || din)) && (!en || !din))) ? 1 : 0;

   initial
     begin
	state = 0;
     end
   always @(posedge clk)
     begin
	case(state)
	  2: if (((!en || din) && (!en || !din)))
            state <= 2;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 4;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 5;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 6;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 7;
          else if ((((en || din) && (en || !din)) && (!en || din)))
            state <= 0;
          else if ((((en || din) && (en || !din)) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	  4: if ((((en || din) && (en || !din)) && (!en || !din)))
            state <= 2;
          else if (((!en || din) && (!en || !din)))
            state <= 4;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 5;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 6;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 7;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 0;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	  5: if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 2;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 4;
          else if ((!en || din))
            state <= 5;
          else if ((((en || din) && (en || !din)) && (!en || !din)))
            state <= 6;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 7;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 0;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	  6: if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 2;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 4;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 5;
          else if (((!en || din) && (!en || !din)))
            state <= 6;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 7;
          else if ((((en || din) && (en || !din)) && (!en || din)))
            state <= 0;
          else if ((((en || din) && (en || !din)) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	  7: if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 2;
          else if ((((en || din) && (en || !din)) && (!en || din)))
            state <= 4;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 5;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 6;
          else if ((!en || !din))
            state <= 7;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 0;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	  0: if ((((en || din) && (en || !din)) && (!en || !din)))
            state <= 2;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 4;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 5;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 6;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 7;
          else if (((!en || din) && (!en || !din)))
            state <= 0;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	  1: if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 2;
          else if ((((en || din) && (en || !din)) && (!en || din)))
            state <= 4;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 5;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 6;
          else if ((((en || din) && (en || !din)) && (!en || !din)))
            state <= 7;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 0;
          else if (((!en || din) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	  3: if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 2;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 4;
          else if ((((en || din) && (en || !din)) && (!en || din)))
            state <= 5;
          else if ((((en || din) && (en || !din)) && (!en || !din)))
            state <= 6;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 7;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 0;
          else if (((((en || din) && (en || !din)) && (!en || din)) && (!en || !din)))
            state <= 1;
          else 
            state <= 3;

	endcase
     end
endmodule
