
# Practice09
##  동작원리

    module ir_rx( o_data, i_ir_rxb, clk, rst_n); 
    output [31:0] o_data ; 
   `enter code here`input i_ir_rxb ; input clk ; input rst_n ; parameter IDLE = 2'b00 ; parameter LEADCODE = 2'b01 ; // 9ms high 4.5ms low parameter DATACODE = 2'b10 ; // Custom & Data Code parameter COMPLETE = 2'b11 ; // 32-bit data // 1M Clock = 1 us Reference Time wire clk_1M ; nco u_nco( .o_gen_clk ( clk_1M ), .i_nco_num ( 32'd50 ), .clk ( clk ), .rst_n ( rst_n )); // Sequential Rx Bits wire ir_rx ; assign ir_rx = ~i_ir_rxb; reg [1:0] seq_rx ; always @(posedge clk_1M or negedge rst_n) begin if(rst_n == 1'b0) begin seq_rx <= 2'b00; end else begin seq_rx <= {seq_rx[0], ir_rx}; end end // Count Signal Polarity (High & Low) reg [15:0] cnt_h ; reg [15:0] cnt_l ; always @(posedge clk_1M or negedge rst_n) begin if(rst_n == 1'b0) begin cnt_h <= 16'd0; cnt_l <= 16'd0; end else begin case(seq_rx) 2'b00 : cnt_l <= cnt_l + 1; 2'b01 : begin cnt_l <= 16'd0; cnt_h <= 16'd0; end 2'b11 : cnt_h <= cnt_h + 1; endcase end end



<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwMDQ4NTc0ODcsLTEzMTc5NjcxOTksMT
Y0NTcyODA2OCw2MTUxMzY0NDAsNzU4MDIyNDMxXX0=
-->