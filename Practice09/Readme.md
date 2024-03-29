# Practice09
## 작동 원리 (코드 옆에 설명 붙임)

    module ir_rx( o_data, i_ir_rxb, clk, rst_n); 
    
    output [31:0] o_data ;
     
    input i_ir_rxb ; 
    input clk ; 
    input rst_n ; 
    
    parameter IDLE = 2'b00 ; 
    parameter LEADCODE = 2'b01 ; // 9ms high 4.5ms low 
    parameter DATACODE = 2'b10 ; // Custom & Data Code 
    parameter COMPLETE = 2'b11 ; // 32-bit data 
    
    // 1M Clock = 1 us Reference Time 
    clk_1M ; nco u_nco( .o_gen_clk ( clk_1M ), 
			.i_nco_num ( 32'd50 ), 
			.clk ( clk ), 
			.rst_n ( rst_n )); // Sequential Rx Bits 
    wire ir_rx ; //리모컨에서 오는 신호
    assign ir_rx = ~i_ir_rxb; 
    reg [1:0] seq_rx ; 
    always @(posedge clk_1M or negedge rst_n) begin 
	    if(rst_n == 1'b0) begin 
		    seq_rx <= 2'b00; // reset 하면 초기화
	    end else begin 
		    seq_rx <= {seq_rx[0], ir_rx}; // seq_rx[0]에 리모컨에서 온 신호 저장
		    end 
	 end 
	 
	// Count Signal Polarity (High & Low) 
	reg [15:0] cnt_h ; 
	reg [15:0] cnt_l ; 
	always @(posedge clk_1M or negedge rst_n) begin 
		if(rst_n == 1'b0) begin 
			cnt_h <= 16'd0; 
			cnt_l <= 16'd0; 
			
		end else begin 
			case(seq_rx) 
			2'b00 : cnt_l <= cnt_l + 1; //low 시간 잼
			2'b01 : begin 
				cnt_l <= 16'd0; 
				cnt_h <= 16'd0; // reset
			end 
			2'b11 : cnt_h <= cnt_h + 1; //high 시간 잼
			endcase 
		end 
	end


    // State Machine
    reg [1:0] state ;
    reg [5:0] cnt32 ;
    
    always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		    state <= IDLE;
		    cnt32 <= 6'd0;
	end else begin	
		case (state)
			IDLE: begin
				state <= LEADCODE; //leadcode 시작
				cnt32 <= 6'd0;
			end
			LEADCODE: begin
				if (cnt_h >= 8500 && cnt_l >= 4000) begin //high가 8.5ms 이상 그리고 low가 4ms 이상일 경우 datacode 시작
					state <= DATACODE;
				end else begin
					state <= LEADCODE; //아닐 경우 계속 leadcode 유지
				end
			end
			DATACODE: begin
				if (seq_rx == 2'b01) begin // rising edge 마다 증가
					cnt32 <= cnt32 + 1;
				end else begin
					cnt32 <= cnt32; // rising edge 없을땐 유지
				end
				if (cnt32 >= 6'd32 && cnt_l >= 1000) begin
					state <= COMPLETE; // rising edge가 32번이 되고(custom code 16bit, data code 16bit 총 32), low가 1ms 이상일 경우 complete -> o_data에 data
				end else begin
					state <= DATACODE; // 아닐 경우 유지
				end
			end
			COMPLETE: state <= IDLE; //complete 후 다시 idle
		endcase
	end
	end
	

### 정리
#### 처음 high가 9ms(코드에선 8.5ms), low 4.5ms(코드에선 4ms)의 leader code가 끝나면 특정회사를 나타내는 custom code 16bit와 리모콘의 송신 데이터인 data code 16bit (실제 data 8bit, 데이터 확인 위한 보수 신호 8bit)가 들어온다. 이는 cnt32가 총 32bit(rising edge 32개)를 확인하고, 32bit가 확인되면 complete가 되고, 저장된 data가 o_data로 나타난다. complete 후엔 다시 초기화된다.


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4MzYwOTk1NF19
-->
