module lcd1602_drive(
  input              clk,               // global clock 
  input              rst_n,             // asynchronous reset
  // LCD1602 Input Value
  input      [127:0] row1_val,          // data for the 1st row
  input      [127:0] row2_val,          // data for the 2nd row
  // LCD1602 Interface
  output reg [  7:0] lcd_data,          // data bus             
  output reg         lcd_rs,            // data/instruction code
  output             lcd_rw,            // read/write 
  output             lcd_e              // chip enable 
);  

// +++++++++++++++++++++++++++++++++++++
// generating gated clock begins  
// +++++++++++++++++++++++++++++++++++++
reg [15:0] cnt;                         

always @ (posedge clk, negedge rst_n)
  if (!rst_n) 
    cnt <= 0;
  else
    cnt <= cnt + 1'b1;

// 500Khz ~ 1MHz is OK
wire lcd_clk = cnt[15];                 // Cycle = (2^16 / 40M) = 1.63ms                                   
// -------------------------------------
// generating gated clock ends
// -------------------------------------


// +++++++++++++++++++++++++++++++++++++
// the part of LCD1602 display drive begins
// +++++++++++++++++++++++++++++++++++++
// Gray coding, a total of 40 states
parameter IDLE         = 8'h00;
// Initialization. write instructions   
parameter DISP_SET     = 8'h01;         // entry mode set 
parameter DISP_OFF     = 8'h03;         // display off 
parameter CLR_SCR      = 8'h02;         // clean display 
parameter CURSOR_SET1  = 8'h06;         // display shift set 
parameter CURSOR_SET2  = 8'h07;         // display on and cursor set 
// display the 1st row 
parameter ROW1_ADDR    = 8'h05;         // write the start address of the 1st row 
parameter ROW1_0       = 8'h04;
parameter ROW1_1       = 8'h0C;
parameter ROW1_2       = 8'h0D;
parameter ROW1_3       = 8'h0F;
parameter ROW1_4       = 8'h0E;
parameter ROW1_5       = 8'h0A;
parameter ROW1_6       = 8'h0B;
parameter ROW1_7       = 8'h09;
parameter ROW1_8       = 8'h08;
parameter ROW1_9       = 8'h18;
parameter ROW1_A       = 8'h19;
parameter ROW1_B       = 8'h1B;
parameter ROW1_C       = 8'h1A;
parameter ROW1_D       = 8'h1E;
parameter ROW1_E       = 8'h1F;
parameter ROW1_F       = 8'h1D;
// display the 2nd row 
parameter ROW2_ADDR    = 8'h1C;         // write the start address of the 2nd row 
parameter ROW2_0       = 8'h14;
parameter ROW2_1       = 8'h15;
parameter ROW2_2       = 8'h17;
parameter ROW2_3       = 8'h16;
parameter ROW2_4       = 8'h12;
parameter ROW2_5       = 8'h13;
parameter ROW2_6       = 8'h11;
parameter ROW2_7       = 8'h10;
parameter ROW2_8       = 8'h30;
parameter ROW2_9       = 8'h31;
parameter ROW2_A       = 8'h33;
parameter ROW2_B       = 8'h32;
parameter ROW2_C       = 8'h36;
parameter ROW2_D       = 8'h37;
parameter ROW2_E       = 8'h35;
parameter ROW2_F       = 8'h34;

reg [5:0] CS, NS;    // current state, next state 

// FSM: always1
always @ (posedge lcd_clk, negedge rst_n)
  if(!rst_n)  CS <= IDLE;
  else        CS <= NS;

// FSM: always2
always @(*)
begin
  case(CS)
    IDLE        : NS = DISP_SET;
    // Initialization. write instructions   
    DISP_SET    : NS = DISP_OFF;
    DISP_OFF    : NS = CLR_SCR;
    CLR_SCR     : NS = CURSOR_SET1;
    CURSOR_SET1 : NS = CURSOR_SET2;
    CURSOR_SET2 : NS = ROW1_ADDR;
    // display the 1st row 
    ROW1_ADDR   : NS = ROW1_0;
    ROW1_0      : NS = ROW1_1;
    ROW1_1      : NS = ROW1_2;
    ROW1_2      : NS = ROW1_3;
    ROW1_3      : NS = ROW1_4;
    ROW1_4      : NS = ROW1_5;
    ROW1_5      : NS = ROW1_6;
    ROW1_6      : NS = ROW1_7;
    ROW1_7      : NS = ROW1_8;
    ROW1_8      : NS = ROW1_9;
    ROW1_9      : NS = ROW1_A;
    ROW1_A      : NS = ROW1_B;
    ROW1_B      : NS = ROW1_C;
    ROW1_C      : NS = ROW1_D;
    ROW1_D      : NS = ROW1_E;
    ROW1_E      : NS = ROW1_F;
    ROW1_F      : NS = ROW2_ADDR;
    // display the 2nd row 
    ROW2_ADDR   : NS = ROW2_0; 
    ROW2_0      : NS = ROW2_1;
    ROW2_1      : NS = ROW2_2;
    ROW2_2      : NS = ROW2_3;
    ROW2_3      : NS = ROW2_4;
    ROW2_4      : NS = ROW2_5;
    ROW2_5      : NS = ROW2_6;
    ROW2_6      : NS = ROW2_7;
    ROW2_7      : NS = ROW2_8;
    ROW2_8      : NS = ROW2_9;
    ROW2_9      : NS = ROW2_A;
    ROW2_A      : NS = ROW2_B;
    ROW2_B      : NS = ROW2_C;
    ROW2_C      : NS = ROW2_D;
    ROW2_D      : NS = ROW2_E;
    ROW2_E      : NS = ROW2_F;
    ROW2_F      : NS = ROW1_ADDR;
    //
    default     : NS = IDLE ;
  endcase
end

// FSM: always3
always @ (posedge lcd_clk, negedge rst_n)
begin
  if(!rst_n)
  begin 
    lcd_rs   <= 0; 
    lcd_data <= 8'hxx; 
  end
  else
  begin 
    // write lcd_rs
    case(NS)      
      IDLE        : lcd_rs <= 0;
      // Initialization. write instructions 
      DISP_SET    : lcd_rs <= 0;
      DISP_OFF    : lcd_rs <= 0;
      CLR_SCR     : lcd_rs <= 0;
      CURSOR_SET1 : lcd_rs <= 0;
      CURSOR_SET2 : lcd_rs <= 0;
      // write data and display the 1st row 
      ROW1_ADDR   : lcd_rs <= 0;
      ROW1_0      : lcd_rs <= 1;
      ROW1_1      : lcd_rs <= 1;
      ROW1_2      : lcd_rs <= 1;
      ROW1_3      : lcd_rs <= 1;
      ROW1_4      : lcd_rs <= 1;
      ROW1_5      : lcd_rs <= 1;
      ROW1_6      : lcd_rs <= 1;
      ROW1_7      : lcd_rs <= 1;
      ROW1_8      : lcd_rs <= 1;
      ROW1_9      : lcd_rs <= 1;
      ROW1_A      : lcd_rs <= 1;
      ROW1_B      : lcd_rs <= 1;
      ROW1_C      : lcd_rs <= 1;
      ROW1_D      : lcd_rs <= 1; 
      ROW1_E      : lcd_rs <= 1;
      ROW1_F      : lcd_rs <= 1;
      // write data, and display the 2nd row 
      ROW2_ADDR   : lcd_rs <= 0;
      ROW2_0      : lcd_rs <= 1;
      ROW2_1      : lcd_rs <= 1;
      ROW2_2      : lcd_rs <= 1;
      ROW2_3      : lcd_rs <= 1;
      ROW2_4      : lcd_rs <= 1;
      ROW2_5      : lcd_rs <= 1;
      ROW2_6      : lcd_rs <= 1;
      ROW2_7      : lcd_rs <= 1;
      ROW2_8      : lcd_rs <= 1;
      ROW2_9      : lcd_rs <= 1;
      ROW2_A      : lcd_rs <= 1;
      ROW2_B      : lcd_rs <= 1;
      ROW2_C      : lcd_rs <= 1;
      ROW2_D      : lcd_rs <= 1; 
      ROW2_E      : lcd_rs <= 1;
      ROW2_F      : lcd_rs <= 1;
    endcase    
    
    // write lcd_data
    case(NS)
      IDLE        : lcd_data <= 8'hxx;
      // Initialization. write instructions
      DISP_SET    : lcd_data <= 8'h38;
      DISP_OFF    : lcd_data <= 8'h08;
      CLR_SCR     : lcd_data <= 8'h01;
      CURSOR_SET1 : lcd_data <= 8'h06;
      CURSOR_SET2 : lcd_data <= 8'h0C;
      // write date, and display the 1st row 
      ROW1_ADDR   : lcd_data <= 8'h80;
      ROW1_0      : lcd_data <= row1_val[15*8+:8];
      ROW1_1      : lcd_data <= row1_val[14*8+:8];
      ROW1_2      : lcd_data <= row1_val[13*8+:8];
      ROW1_3      : lcd_data <= row1_val[12*8+:8];
      ROW1_4      : lcd_data <= row1_val[11*8+:8];
      ROW1_5      : lcd_data <= row1_val[10*8+:8];
      ROW1_6      : lcd_data <= row1_val[9*8+:8];
      ROW1_7      : lcd_data <= row1_val[8*8+:8];
      ROW1_8      : lcd_data <= row1_val[7*8+:8];
      ROW1_9      : lcd_data <= row1_val[6*8+:8];
      ROW1_A      : lcd_data <= row1_val[5*8+:8];
      ROW1_B      : lcd_data <= row1_val[4*8+:8];
      ROW1_C      : lcd_data <= row1_val[3*8+:8];
      ROW1_D      : lcd_data <= row1_val[2*8+:8]; 
      ROW1_E      : lcd_data <= row1_val[1*8+:8];
      ROW1_F      : lcd_data <= row1_val[0+:8];
      // write date, and display the 2nd row 
      ROW2_ADDR   : lcd_data <= 8'hC0;
      ROW2_0      : lcd_data <= row2_val[15*8+:8];
      ROW2_1      : lcd_data <= row2_val[14*8+:8];
      ROW2_2      : lcd_data <= row2_val[13*8+:8];
      ROW2_3      : lcd_data <= row2_val[12*8+:8];
      ROW2_4      : lcd_data <= row2_val[11*8+:8];
      ROW2_5      : lcd_data <= row2_val[10*8+:8];
      ROW2_6      : lcd_data <= row2_val[9*8+:8];
      ROW2_7      : lcd_data <= row2_val[8*8+:8];
      ROW2_8      : lcd_data <= row2_val[7*8+:8];
      ROW2_9      : lcd_data <= row2_val[6*8+:8];
      ROW2_A      : lcd_data <= row2_val[5*8+:8];
      ROW2_B      : lcd_data <= row2_val[4*8+:8];
      ROW2_C      : lcd_data <= row2_val[3*8+:8];
      ROW2_D      : lcd_data <= row2_val[2*8+:8]; 
      ROW2_E      : lcd_data <= row2_val[1*8+:8];
      ROW2_F      : lcd_data <= row2_val[0+:8];
    endcase  
  end
end

assign lcd_e  = lcd_clk;                // data can be locked only when the clock is on the high level                
assign lcd_rw = 1'b0;                   // write only 
// -------------------------------------
// the part of LCD1602 display drive ends
// -------------------------------------

endmodule
