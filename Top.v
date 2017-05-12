module Top (
	input clk,
	input rst,
	input [2:0] SW,
	inout PS2_CLK,
	inout PS2_DATA,
	output [1:0] LED1,
	output [1:0] LED2,
	output [3:0] DIGIT,
	output [6:0] DISPLAY,
	output [3:0] vgaRed,
	output [3:0] vgaGreen,
	output [3:0] vgaBlue,
	output hsync,
	output vsync
);

wire clk1, clk13, clk16, clk21, clk_one_sec;

ClockDivisor clk_inst (
	.clk(clk),
	.clk1(clk1),
	.clk13(clk13),
	.clk16(clk16),
	.clk21(clk21),
	.clk_one_sec(clk_one_sec)
);

wire key_a, key_s, key_d, key_1, key_2, key_3, key_enter;
wire l_key_a, l_key_s, l_key_d, l_key_1, l_key_2, l_key_3, l_key_enter;

ButtonCtrl b_ctrl_inst (
	.clk(clk),
	.rst(rst),
	.PS2_CLK(PS2_CLK),
	.PS2_DATA(PS2_DATA),
	.key_a(key_a),
	.key_s(key_s),
	.key_d(key_d),
	.key_1(key_1),
	.key_2(key_2),
	.key_3(key_3),
	.key_enter(key_enter)
);

CreateLargePulse c_pulse_key_a (
	.clk(clk),
	.rst(rst),
	.small_pulse(key_a),
	.large_pulse(l_key_a)
);

CreateLargePulse c_pulse_key_s (
	.clk(clk),
	.rst(rst),
	.small_pulse(key_s),
	.large_pulse(l_key_s)
);

CreateLargePulse c_pulse_key_d (
	.clk(clk),
	.rst(rst),
	.small_pulse(key_d),
	.large_pulse(l_key_d)
);

CreateLargePulse c_pulse_key_1 (
	.clk(clk),
	.rst(rst),
	.small_pulse(key_1),
	.large_pulse(l_key_1)
);

CreateLargePulse c_pulse_key_2 (
	.clk(clk),
	.rst(rst),
	.small_pulse(key_2),
	.large_pulse(l_key_2)
);
	
CreateLargePulse c_pulse_key_3 (
	.clk(clk),
	.rst(rst),
	.small_pulse(key_3),
	.large_pulse(l_key_3)
);
	
CreateLargePulse c_pulse_key_enter (
	.clk(clk),
	.rst(rst),
	.small_pulse(key_enter),
	.large_pulse(l_key_enter)
);

wire [3:0] BCD0, BCD1;

SevenSeg seg_inst (
	.clk(clk13),
	.BCD0(BCD0), 
	.BCD1(BCD1),
	.DIGIT(DIGIT),
	.DISPLAY(DISPLAY) 
);

wire [2:0] state;

Timer time_inst (
	.clk(clk_one_sec),
	.rst(rst),
	.state(state),
	.BCD0(BCD0),
	.BCD1(BCD1)
);
	
wire valid;
wire [9:0] h_cnt, v_cnt;

VGACtrl vga_inst(
	.pclk(clk1),
	.reset(rst),
	.hsync(hsync),
	.vsync(vsync),
	.valid(valid),
	.h_cnt(h_cnt),
	.v_cnt(v_cnt)
);

wire [6:0] p1LocationX, p1LocationY;
wire [6:0] p2LocationX, p2LocationY;

P1CharacterGen p1char_gen_inst (
	.clk(clk16),
	.rst(rst),
	.key_a(l_key_a),
	.key_d(l_key_d),
	.state(state),
	.p1LocationX(p1LocationX),
	.p1LocationY(p1LocationY)
);

P2CharacterGen p2char_gen_inst (
	.clk(clk16),
	.rst(rst),
	.key_1(l_key_1),
	.key_3(l_key_3),
	.state(state),
	.p2LocationX(p2LocationX),
	.p2LocationY(p2LocationY)
);

wire [6:0] p1ArmsX, p1ArmsY;
wire [6:0] p2ArmsX, p2ArmsY;
wire [7:0] p1HP, p2HP;

P1ArmsGen p1arms_gen_inst (
	.clk16(clk16),
	.clk21(clk21),
	.rst(rst),
	.key_s(l_key_s),
	.state(state),
	.p1LocationX(p1LocationX),
	.p1LocationY(p1LocationY),
	.p2LocationX(p2LocationX),
	.p2LocationY(p2LocationY),
	.p1ArmsX(p1ArmsX),
	.p1ArmsY(p1ArmsY),
	.p2HP(p2HP)
);

P2ArmsGen p2arms_gen_inst (
	.clk16(clk16),
	.clk21(clk21),
	.rst(rst),
	.key_2(l_key_2),
	.state(state),
	.p1LocationX(p1LocationX),
	.p1LocationY(p1LocationY),
	.p2LocationX(p2LocationX),
	.p2LocationY(p2LocationY),
	.p2ArmsX(p2ArmsX),
	.p2ArmsY(p2ArmsY),
	.p1HP(p1HP)
);

PixelGen pixel_gen_inst(
	.SW(SW),
	.state(state),
	.p1LocationX(p1LocationX),
	.p1LocationY(p1LocationY),
	.p2LocationX(p2LocationX),
	.p2LocationY(p2LocationY),
	.p1ArmsX(p1ArmsX),
	.p1ArmsY(p1ArmsY),
	.p2ArmsX(p2ArmsX),
	.p2ArmsY(p2ArmsY),
	.p1HP(p1HP),
	.p2HP(p2HP),
    .h_cnt(h_cnt),
	.v_cnt(v_cnt),
	.valid(valid),
	.vgaRed(vgaRed),
	.vgaGreen(vgaGreen),
	.vgaBlue(vgaBlue)
);

wire [1:0] p1win, p2win;

GameFSM game_inst (
	.clk16(clk16),
	.clk_one_sec(clk_one_sec),
	.rst(rst),
	.key_enter(l_key_enter),
	.p1HP(p1HP),
	.p2HP(p2HP),
	.BCD0(BCD0),
	.BCD1(BCD1),
	.p1win(p1win),
	.p2win(p2win),
	.state(state)
);

assign LED1 = (p1win == 0) ? 2'b00 :
			  (p1win == 1) ? 2'b01 : 2'b11;
assign LED2 = (p2win == 0) ? 2'b00 :
			  (p2win == 1) ? 2'b01 : 2'b11;

endmodule