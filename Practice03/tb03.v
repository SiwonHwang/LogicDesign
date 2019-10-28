module tb03_2to1  ;

reg    in0        ;
reg    in1        ;
reg    sel        ;

wire   out1       ;
wire   out2       ;
wire   out3       ;

mux2to1_cond  dut_1(   .out ( out1   ),
                       .in0 ( in0    ),
                       .in1 ( in1    ),
                       .sel ( sel    ));

mux2to1_if    dut_2(   .out ( out2   ),
                       .in0 ( in0    ),
                       .in1 ( in1    ),
                       .sel ( sel    ));

mux2to1_case  dut_3(   .out ( out3   ),
                       .in0 ( in0    ),
                       .in1 ( in1    ),
                       .sel ( sel    ));


initial begin
    $display("==============================================");
    $display("  sel  in1  in0  out1  out2  out3  ");
    $display("==============================================");
    #(50)   {sel, in1, in0} = 3'b_000;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   {sel, in1, in0} = 3'b_001;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   {sel, in1, in0} = 3'b_010;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   {sel, in1, in0} = 3'b_011;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   {sel, in1, in0} = 3'b_100;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   {sel, in1, in0} = 3'b_101;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   {sel, in1, in0} = 3'b_110;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   {sel, in1, in0} = 3'b_111;   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t  ", sel, in1, in0, out1, out2, out3);
    #(50)   $finish                  ;
end

endmodule


module tb03_4to1      ;

reg          in0      ;
reg          in1      ;
reg          in2      ;
reg          in3      ;
reg  [1:0]   sel      ;

wire       out1       ;
wire       out2       ;
wire       out3       ;

mux4to1_inst  dut_1(   .out ( out1  ),
                       .in0 ( in0   ),
                       .in1 ( in1   ),
                       .in2 ( in2   ),
                       .in3 ( in3   ),
                       .sel ( sel   ));

mux4to1_if    dut_2(   .out ( out2  ),
                       .in0 ( in0   ),
                       .in1 ( in1   ),
                       .in2 ( in2   ),
                       .in3 ( in3   ),
                       .sel ( sel   ));

mux4to1_case  dut_3(   .out ( out3  ),
                       .in0 ( in0   ),
                       .in1 ( in1   ),
                       .in2 ( in2   ),
                       .in3 ( in3   ),
                       .sel ( sel   ));


initial begin
    $display("==============================================");
    $display("  sel  in3  in2  in1  in0  out1  out2  out3  ");
    $display("==============================================");
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   {sel, in3, in2, in1, in0} = $random();   #(50)   $display("  %b\t%b\t%b\t%b\t%b\t%b\t%b\t%b  ", sel, in3, in2, in1, in0, out1, out2, out3);
    #(50)   $finish                  ;
end

endmodule
