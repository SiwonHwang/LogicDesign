//Decoder

module  tb_dec3to8;

wire  [7:0]     out1          ;
wire  [7:0]     out2          ;

reg   [2:0]     in            ;
reg             en            ;

//

dec3to8_shift  dut0(    .out  (  out1       ),
                        .in   (  in         ),
                        .en   (  en         ));

dec3to8_case   dut1(    .out  (  out2       ),
                        .in   (  in         ),
                        .en   (  en         ));

//

initial begin
$display("======================================================");
$display("   en   in   out1   out2   ");
$display("======================================================");
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
#(50)   {en, in} = $random();    #(50)  $display("   %b\t%b\t%b\t%b   ", en, in, out1, out2);
$finish;
end

endmodule




//Latch & Flip-flop

module  tb_sequential;

wire            q_latch        ;
wire            q_dff_asyn     ;
wire            q_dff_syn      ;

reg             d              ;
reg             clk            ;
reg             rst_n          ;

initial         clk = 1'b0     ;
always  #(100)  clk = ~clk     ;

//

d_latch       dut0(    .q      (  q_latch     ),
                       .d      (  d           ),
                       .clk    (  clk         ),
                       .rst_n  (  rst_n       ));

dff_asyn      dut1(    .q      (  q_dff_asyn  ),
                       .d      (  d           ),
                       .clk    (  clk         ),
                       .rst_n  (  rst_n       ));

dff_syn       dut2(    .q      (  q_dff_syn   ),
                       .d      (  d           ),
                       .clk    (  clk         ),
                       .rst_n  (  rst_n       ));

//

initial begin
$display("======================================================");
$display("   rst_n   d   q0   q1   q2   ");
$display("======================================================");
#(0)    {rst_n, d} = 2'b00;
#(50)   {rst_n, d} = 2'b00; #(50)   $display("   %b\t%b\t%b\t%b\t%b   ", rst_n, d, q_latch, q_dff_asyn, q_dff_syn);
#(50)   {rst_n, d} = 2'b10; #(50)   $display("   %b\t%b\t%b\t%b\t%b   ", rst_n, d, q_latch, q_dff_asyn, q_dff_syn);
#(50)   {rst_n, d} = 2'b10; #(50)   $display("   %b\t%b\t%b\t%b\t%b   ", rst_n, d, q_latch, q_dff_asyn, q_dff_syn);
#(50)   {rst_n, d} = 2'b11; #(50)   $display("   %b\t%b\t%b\t%b\t%b   ", rst_n, d, q_latch, q_dff_asyn, q_dff_syn);
#(50)   {rst_n, d} = 2'b11; #(50)   $display("   %b\t%b\t%b\t%b\t%b   ", rst_n, d, q_latch, q_dff_asyn, q_dff_syn);
#(50)   {rst_n, d} = 2'b10; #(50)   $display("   %b\t%b\t%b\t%b\t%b   ", rst_n, d, q_latch, q_dff_asyn, q_dff_syn);
#(50)   {rst_n, d} = 2'b11; #(50)   $display("   %b\t%b\t%b\t%b\t%b   ", rst_n, d, q_latch, q_dff_asyn, q_dff_syn);
$finish;
end

endmodule

