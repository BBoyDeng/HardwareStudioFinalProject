module PixelGen (
	input [2:0] SW,
	input [2:0] state,
	input [6:0] p1LocationX,
	input [6:0] p1LocationY,
	input [6:0] p2LocationX,
	input [6:0] p2LocationY,
	input [6:0] p1ArmsX,
	input [6:0] p1ArmsY,
	input [6:0] p2ArmsX,
	input [6:0] p2ArmsY,
	input [7:0] p1HP,
	input [7:0] p2HP,
    input [9:0] h_cnt,
	input [9:0] v_cnt,
	input valid,
	output reg [3:0] vgaRed,
	output reg [3:0] vgaGreen,
	output reg [3:0] vgaBlue
);
 
parameter [2:0] MENU  = 3'b000;
parameter [2:0] GAME  = 3'b001;
parameter [2:0] P1WIN = 3'b010;
parameter [2:0] P2WIN = 3'b011;
parameter [2:0] TIE   = 3'b100;
parameter [2:0] PIONT = 3'b101;
 
parameter ground = 80;
parameter grass = 10;
parameter river = 60;
parameter hp_frame = 5;
parameter hp_wide = 200;
parameter hp_height = 35;
parameter gap = 20;
parameter blank = 10;
parameter ch_wide = 30;
parameter ch_height = 50;
parameter arms_side = 20;

   
always @(*) begin
	case (state)
		MENU: begin
			if (!valid)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// B
			else if (h_cnt >= 40 && h_cnt < 80 && v_cnt >= 130 && v_cnt < 170)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 40 && h_cnt < 90 && v_cnt >= 230 && v_cnt < 270)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 80 && h_cnt < 100 && v_cnt >= 175 && v_cnt < 200)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			
			else if (h_cnt >= 20 && h_cnt < 100 && v_cnt >= 100 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h555;
			
			// o
			else if (h_cnt >= 120 && h_cnt < 130 && v_cnt >= 200 && v_cnt < 210)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 190 && h_cnt < 200 && v_cnt >= 200 && v_cnt < 210)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 120 && h_cnt < 130 && v_cnt >= 290 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 190 && h_cnt < 200 && v_cnt >= 290 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 145 && h_cnt < 175 && v_cnt >= 230 && v_cnt < 270)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			
			else if (h_cnt >= 120 && h_cnt < 200 && v_cnt >= 200 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h555;
			
			// x
			else if (h_cnt >= 240 && h_cnt < 280 && v_cnt >= 200 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 255 && h_cnt < 265 && v_cnt >= 220 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 240 && h_cnt < 280 && v_cnt >= 285 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 255 && h_cnt < 265 && v_cnt >= 270 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 220 && h_cnt < 240 && v_cnt >= 230 && v_cnt < 270)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 240 && h_cnt < 255 && v_cnt >= 245 && v_cnt < 255)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 280 && h_cnt < 300 && v_cnt >= 230 && v_cnt < 270)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 265 && h_cnt < 280 && v_cnt >= 245 && v_cnt < 255)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			
			else if (h_cnt >= 220 && h_cnt < 300 && v_cnt >= 200 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			
			// W
			else if (h_cnt >= 340 && h_cnt < 345 && v_cnt >= 100 && v_cnt < 200)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 345 && h_cnt < 350 && v_cnt >= 190 && v_cnt < 250)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 350 && h_cnt < 360 && v_cnt >= 240 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 350 && h_cnt < 375 && v_cnt >= 285 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 365 && h_cnt < 395 && v_cnt >= 270 && v_cnt < 285)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 375 && h_cnt < 385 && v_cnt >= 240 && v_cnt < 270)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 378 && h_cnt < 382 && v_cnt >= 150 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 385 && h_cnt < 410 && v_cnt >= 285 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 400 && h_cnt < 410 && v_cnt >= 240 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 410 && h_cnt < 415 && v_cnt >= 190 && v_cnt < 250)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			else if (h_cnt >= 415 && h_cnt < 420 && v_cnt >= 100 && v_cnt < 200)
				{vgaRed, vgaGreen, vgaBlue} = 12'h666;
			
			// a
			else if (h_cnt >= 440 && h_cnt < 455 && v_cnt >= 200 && v_cnt < 215)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 440 && h_cnt < 455 && v_cnt >= 285 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 465 && h_cnt < 495 && v_cnt >= 235 && v_cnt < 265)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 440 && h_cnt < 505 && v_cnt >= 300 && v_cnt < 315)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			
			else if (h_cnt >= 440 && h_cnt < 520 && v_cnt >= 200 && v_cnt < 315)
				{vgaRed, vgaGreen, vgaBlue} = 12'h777;
			
			
			// r
			else if (h_cnt >= 540 && h_cnt < 560 && v_cnt >= 200 && v_cnt < 300)
				{vgaRed, vgaGreen, vgaBlue} = 12'h777;
			else if (h_cnt >= 560 && h_cnt < 620 && v_cnt >= 210 && v_cnt < 230)
				{vgaRed, vgaGreen, vgaBlue} = 12'h777;
			else if (h_cnt >= 600 && h_cnt < 620 && v_cnt >= 210 && v_cnt < 255)
				{vgaRed, vgaGreen, vgaBlue} = 12'h777;
			
			// E
			else if (h_cnt >= 70 && h_cnt < 100 && v_cnt >= 355 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 70 && h_cnt < 100 && v_cnt >= 395 && v_cnt < 420)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 60 && h_cnt < 100 && v_cnt >= 340 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
				
			// n
			else if (h_cnt >= 125 && h_cnt < 155 && v_cnt >= 390 && v_cnt < 395)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 125 && h_cnt < 145 && v_cnt >= 410 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			
			else if (h_cnt >= 115 && h_cnt < 155 && v_cnt >= 390 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			
			// t
			else if (h_cnt >= 170 && h_cnt < 210 && v_cnt >= 370 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			else if (h_cnt >= 185 && h_cnt < 195 && v_cnt >= 360 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			else if (h_cnt >= 185 && h_cnt < 205 && v_cnt >= 430 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			
			// e 
			else if (h_cnt >= 235 && h_cnt < 265 && v_cnt >= 400 && v_cnt < 410)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 235 && h_cnt < 265 && v_cnt >= 420 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			
			else if (h_cnt >= 225 && h_cnt < 265 && v_cnt >= 390 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			
			// r 
			else if (h_cnt >= 280 && h_cnt < 290 && v_cnt >= 390 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			else if (h_cnt >= 290 && h_cnt < 320 && v_cnt >= 395 && v_cnt < 405)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			else if (h_cnt >= 310 && h_cnt < 320 && v_cnt >= 395 && v_cnt < 420)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			
			// G
			else if (h_cnt >= 370 && h_cnt < 390 && v_cnt >= 350 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 370 && h_cnt < 400 && v_cnt >= 390 && v_cnt < 400)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 370 && h_cnt < 380 && v_cnt >= 400 && v_cnt < 410)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 370 && h_cnt < 390 && v_cnt >= 410 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 360 && h_cnt < 400 && v_cnt >= 340 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			
			// o
			else if (h_cnt >= 425 && h_cnt < 445 && v_cnt >= 405 && v_cnt < 425)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 415 && h_cnt < 455 && v_cnt >= 390 && v_cnt < 440)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0c7;
			
			else
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
		end	
		GAME: begin
			if (!valid)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// gap
			else if (h_cnt >= 0 && h_cnt < gap)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (h_cnt > 640-gap && h_cnt < 640)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (v_cnt >= 0 && v_cnt < gap)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (v_cnt > 480-gap && v_cnt < 480)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
		
			
			// ground
			else if (h_cnt > 0 && h_cnt < 640/2-river/2 && v_cnt > 480-ground && v_cnt < 480)
				{vgaRed, vgaGreen, vgaBlue} = 12'hf70;
			else if (h_cnt > 640/2+river/2 && h_cnt < 640 && v_cnt > 480-ground && v_cnt < 480)
				{vgaRed, vgaGreen, vgaBlue} = 12'hf70;
			
				
			// grass
			else if (h_cnt > 0 && h_cnt < 640/2-river/2 && v_cnt > 480-ground-grass && v_cnt <= 480-ground)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0a0;
			else if (h_cnt > 640/2+river/2 && h_cnt < 640 && v_cnt > 480-ground-grass && v_cnt <= 480-ground)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0a0;
			
			
			// river
			else if (h_cnt >= 640/2-river/2 && h_cnt <= 640/2+river/2 && v_cnt > 480-ground && v_cnt < 480)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0ff;
			
			
			// p1 hp frame
			else if (h_cnt > blank+gap && h_cnt < blank+gap+hp_frame && v_cnt > blank+gap && v_cnt < blank+gap+2*hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt > blank+gap+hp_frame+hp_wide && h_cnt < blank+gap+2*hp_frame+hp_wide && v_cnt > blank+gap && v_cnt < blank+gap+2*hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt > blank+gap && h_cnt < blank+gap+2*hp_frame+hp_wide && v_cnt > blank+gap && v_cnt < blank+gap+hp_frame)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt > blank+gap && h_cnt < blank+gap+2*hp_frame+hp_wide && v_cnt > blank+gap+hp_frame+hp_height && v_cnt < blank+gap+2*hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			
			
			// p2 hp frame
			else if (h_cnt < 640-gap-blank && h_cnt > 640-gap-hp_frame-blank && v_cnt > blank+gap && v_cnt < blank+gap+2*hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt < 640-gap-hp_frame-hp_wide-blank && h_cnt > 640-gap-2*hp_frame-hp_wide-blank && v_cnt > blank+gap && v_cnt < blank+gap+2*hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt < 640-gap-blank && h_cnt > 640-gap-2*hp_frame-hp_wide-blank && v_cnt > blank+gap && v_cnt < blank+gap+hp_frame)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt < 640-gap-blank && h_cnt > 640-gap-2*hp_frame-hp_wide-blank && v_cnt > blank+gap+hp_frame+hp_height && v_cnt < blank+gap+2*hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			
			
			// p1 character
			else if (h_cnt > 10*p1LocationX+20 && h_cnt < 10*p1LocationX+27 && v_cnt > 10*p1LocationY+10 && v_cnt < 10*p1LocationY+20)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt > 10*p1LocationX+10 && h_cnt < 10*p1LocationX+ch_wide && v_cnt > 10*p1LocationY+30 && v_cnt < 10*p1LocationY+40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt > 10*p1LocationX+10 && h_cnt < 10*p1LocationX+15 && v_cnt > 10*p1LocationY+20 && v_cnt < 10*p1LocationY+40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt > 10*p1LocationX && h_cnt < 10*p1LocationX+ch_wide && v_cnt > 10*p1LocationY && v_cnt <= 10*p1LocationY+ch_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'hf00;
			
				
			// p2 character
			else if (h_cnt > 10*p2LocationX+3 && h_cnt < 10*p2LocationX+10 && v_cnt > 10*p2LocationY+10 && v_cnt < 10*p2LocationY+20)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt > 10*p2LocationX && h_cnt < 10*p2LocationX+20 && v_cnt > 10*p2LocationY+30 && v_cnt < 10*p2LocationY+40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt > 10*p2LocationX+15 && h_cnt < 10*p2LocationX+20 && v_cnt > 10*p2LocationY+20 && v_cnt < 10*p2LocationY+40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt > 10*p2LocationX && h_cnt < 10*p2LocationX+ch_wide && v_cnt > 10*p2LocationY && v_cnt <= 10*p2LocationY+ch_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'h00f;
			
			
			// p1 arms
			else if (h_cnt > 10*p1ArmsX && h_cnt < 10*p1ArmsX+arms_side && v_cnt > 10*p1ArmsY && v_cnt < 10*p1ArmsY+arms_side)
				{vgaRed, vgaGreen, vgaBlue} = 12'hf55;
			
			
			// p2 arms
			else if (h_cnt > 10*p2ArmsX && h_cnt < 10*p2ArmsX+arms_side && v_cnt > 10*p2ArmsY && v_cnt < 10*p2ArmsY+arms_side)
				{vgaRed, vgaGreen, vgaBlue} = 12'h8cf;
		
				
			// p1 hp
			else if (h_cnt > blank+gap+hp_frame && h_cnt < blank+gap+hp_frame+2*p1HP && v_cnt > blank+gap+hp_frame && v_cnt < blank+gap+hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'hff0;
			
			
			// p2 hp
			else if (h_cnt > 640-gap-hp_frame-2*p2HP-blank && h_cnt < 640-gap-hp_frame-blank && v_cnt > blank+gap+hp_frame && v_cnt < blank+gap+hp_frame+hp_height)
				{vgaRed, vgaGreen, vgaBlue} = 12'hff0;
		
			
			else 
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
		end
		P1WIN: begin
			if (!valid)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;	
			
			// mouth
			else if (h_cnt >= 50 && h_cnt < 80 && v_cnt >= 240 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 110 && h_cnt < 170 && v_cnt >= 340 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 200 && h_cnt < 260 && v_cnt >= 340 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 290 && h_cnt < 350 && v_cnt >= 360 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 380 && h_cnt < 440 && v_cnt >= 350 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 470 && h_cnt < 530 && v_cnt >= 370 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 560 && h_cnt < 590 && v_cnt >= 240 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 50 && h_cnt < 100 && v_cnt >= 240 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 100 && h_cnt < 125 && v_cnt >= 300 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 155 && h_cnt < 215 && v_cnt >= 300 && v_cnt < 360)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 245 && h_cnt < 305 && v_cnt >= 300 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 335 && h_cnt < 395 && v_cnt >= 300 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 425 && h_cnt < 485 && v_cnt >= 300 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 515 && h_cnt < 540 && v_cnt >= 300 && v_cnt < 370)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 540 && h_cnt < 590 && v_cnt >= 240 && v_cnt < 370)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// nose
			else if (h_cnt >= 305 && h_cnt < 335 && v_cnt >=  220&& v_cnt < 260)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// eye
			else if (h_cnt >= 195 && h_cnt < 245 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (h_cnt >= 150 && h_cnt < 290 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 170 && h_cnt < 270 && v_cnt >= 50 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 395 && h_cnt < 445 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (h_cnt >= 350 && h_cnt < 490 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 370 && h_cnt < 470 && v_cnt >= 50 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else
				{vgaRed, vgaGreen, vgaBlue} = 12'hf00;
		end	
		P2WIN: begin
			if (!valid)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// mouth
			else if (h_cnt >= 50 && h_cnt < 80 && v_cnt >= 240 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 110 && h_cnt < 170 && v_cnt >= 340 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 200 && h_cnt < 260 && v_cnt >= 340 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 290 && h_cnt < 350 && v_cnt >= 360 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 380 && h_cnt < 440 && v_cnt >= 350 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 470 && h_cnt < 530 && v_cnt >= 370 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 560 && h_cnt < 590 && v_cnt >= 240 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 50 && h_cnt < 100 && v_cnt >= 240 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 100 && h_cnt < 125 && v_cnt >= 300 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 155 && h_cnt < 215 && v_cnt >= 300 && v_cnt < 360)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 245 && h_cnt < 305 && v_cnt >= 300 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 335 && h_cnt < 395 && v_cnt >= 300 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 425 && h_cnt < 485 && v_cnt >= 300 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 515 && h_cnt < 540 && v_cnt >= 300 && v_cnt < 370)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 540 && h_cnt < 590 && v_cnt >= 240 && v_cnt < 370)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// nose
			else if (h_cnt >= 305 && h_cnt < 335 && v_cnt >=  220&& v_cnt < 260)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// eye
			else if (h_cnt >= 195 && h_cnt < 245 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (h_cnt >= 150 && h_cnt < 290 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 170 && h_cnt < 270 && v_cnt >= 50 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 395 && h_cnt < 445 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (h_cnt >= 350 && h_cnt < 490 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 370 && h_cnt < 470 && v_cnt >= 50 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
				
			else
				{vgaRed, vgaGreen, vgaBlue} = 12'h00f;
		end	
		TIE: begin
			if (!valid)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// mouth
			else if (h_cnt >= 50 && h_cnt < 80 && v_cnt >= 240 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 110 && h_cnt < 170 && v_cnt >= 340 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 200 && h_cnt < 260 && v_cnt >= 340 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 290 && h_cnt < 350 && v_cnt >= 360 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 380 && h_cnt < 440 && v_cnt >= 350 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 470 && h_cnt < 530 && v_cnt >= 370 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 560 && h_cnt < 590 && v_cnt >= 240 && v_cnt < 430)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 50 && h_cnt < 100 && v_cnt >= 240 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 100 && h_cnt < 125 && v_cnt >= 300 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 155 && h_cnt < 215 && v_cnt >= 300 && v_cnt < 360)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 245 && h_cnt < 305 && v_cnt >= 300 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 335 && h_cnt < 395 && v_cnt >= 300 && v_cnt < 380)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 425 && h_cnt < 485 && v_cnt >= 300 && v_cnt < 390)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 515 && h_cnt < 540 && v_cnt >= 300 && v_cnt < 370)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 540 && h_cnt < 590 && v_cnt >= 240 && v_cnt < 370)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// nose
			else if (h_cnt >= 305 && h_cnt < 335 && v_cnt >=  220&& v_cnt < 260)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// eye
			else if (h_cnt >= 195 && h_cnt < 245 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (h_cnt >= 150 && h_cnt < 290 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 170 && h_cnt < 270 && v_cnt >= 50 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 395 && h_cnt < 445 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hfff;
			else if (h_cnt >= 350 && h_cnt < 490 && v_cnt >= 70 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 370 && h_cnt < 470 && v_cnt >= 50 && v_cnt < 240)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
				
			else
				{vgaRed, vgaGreen, vgaBlue} = 12'hf0f;
		end	
		PIONT: begin
			if (!valid)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			// S
			else if (h_cnt >= 10 && h_cnt < 30 && v_cnt >= 20 && v_cnt < 30)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 20 && v_cnt >= 20 && v_cnt < 40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 90 && h_cnt < 110 && v_cnt >= 20 && v_cnt < 30)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 100 && h_cnt < 110 && v_cnt >= 20 && v_cnt < 40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 30 && v_cnt >= 210 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 20 && v_cnt >= 200 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 90 && h_cnt < 110 && v_cnt >= 210 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 100 && h_cnt < 110 && v_cnt >= 200 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 30 && h_cnt < 90 && v_cnt >= 40 && v_cnt < 80)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 30 && h_cnt < 90 && v_cnt >= 150 && v_cnt < 200)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 10 && h_cnt < 20 && v_cnt >= 80 && v_cnt < 90)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 30 && v_cnt >= 90 && v_cnt < 100)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 40 && v_cnt >= 100 && v_cnt < 110)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 50 && v_cnt >= 110 && v_cnt < 120)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 60 && v_cnt >= 120 && v_cnt < 130)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 70 && v_cnt >= 130 && v_cnt < 140)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 10 && h_cnt < 80 && v_cnt >= 140 && v_cnt < 150)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 40 && h_cnt < 110 && v_cnt >= 80 && v_cnt < 90)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 50 && h_cnt < 110 && v_cnt >= 90 && v_cnt < 100)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 60 && h_cnt < 110 && v_cnt >= 100 && v_cnt < 110)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 70 && h_cnt < 110 && v_cnt >= 110 && v_cnt < 120)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 80 && h_cnt < 110 && v_cnt >= 120 && v_cnt < 130)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 90 && h_cnt < 110 && v_cnt >= 130 && v_cnt < 140)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 100 && h_cnt < 110 && v_cnt >= 140 && v_cnt < 150)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			
			else if (h_cnt >= 10 && h_cnt < 110 && v_cnt >= 20 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hf00;
			
			// C
			else if (h_cnt >= 140 && h_cnt < 160 && v_cnt >= 20 && v_cnt < 30)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 140 && h_cnt < 150 && v_cnt >= 20 && v_cnt < 40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 210 && h_cnt < 230 && v_cnt >= 20 && v_cnt < 30)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 220 && h_cnt < 230 && v_cnt >= 20 && v_cnt < 40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 140 && h_cnt < 160 && v_cnt >= 210 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 140 && h_cnt < 150 && v_cnt >= 200 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 210 && h_cnt < 230 && v_cnt >= 210 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 220 && h_cnt < 230 && v_cnt >= 200 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 160 && h_cnt < 210 && v_cnt >= 40 && v_cnt < 200)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 210 && h_cnt < 230 && v_cnt >= 90 && v_cnt < 150)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 140 && h_cnt < 230 && v_cnt >= 20 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hf92;
				
			
				
			// O
			else if (h_cnt >= 270 && h_cnt < 290 && v_cnt >= 20 && v_cnt < 30)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 270 && h_cnt < 280 && v_cnt >= 20 && v_cnt < 40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 340 && h_cnt < 360 && v_cnt >= 20 && v_cnt < 30)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 350 && h_cnt < 360 && v_cnt >= 20 && v_cnt < 40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 270 && h_cnt < 290 && v_cnt >= 210 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 270 && h_cnt < 280 && v_cnt >= 200 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 340 && h_cnt < 360 && v_cnt >= 210 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 350 && h_cnt < 360 && v_cnt >= 200 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 290 && h_cnt < 340 && v_cnt >= 40 && v_cnt < 200)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			else if (h_cnt >= 270 && h_cnt < 360 && v_cnt >= 20 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h9f0;
			
			// R 
			else if (h_cnt >= 480 && h_cnt < 500 && v_cnt >= 20 && v_cnt < 30)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 490 && h_cnt < 500 && v_cnt >= 20 && v_cnt < 40)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 480 && h_cnt < 500 && v_cnt >= 110 && v_cnt < 120)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 490 && h_cnt < 500 && v_cnt >= 100 && v_cnt < 120)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;	
				
			else if (h_cnt >= 420 && h_cnt < 480 && v_cnt >= 40 && v_cnt < 100)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;	
				
			else if (h_cnt >= 420 && h_cnt < 430 && v_cnt >= 136 && v_cnt < 150)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 420 && h_cnt < 440 && v_cnt >= 150 && v_cnt < 164)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 420 && h_cnt < 450 && v_cnt >= 164 && v_cnt < 178)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 420 && h_cnt < 460 && v_cnt >= 178 && v_cnt < 192)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 420 && h_cnt < 470 && v_cnt >= 192 && v_cnt < 206)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 420 && h_cnt < 480 && v_cnt >= 206 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
				
			else if (h_cnt >= 440 && h_cnt < 500 && v_cnt >= 120 && v_cnt < 136)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 450 && h_cnt < 500 && v_cnt >= 136 && v_cnt < 150)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 460 && h_cnt < 500 && v_cnt >= 150 && v_cnt < 164)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 470 && h_cnt < 500 && v_cnt >= 164 && v_cnt < 178)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 480 && h_cnt < 500 && v_cnt >= 178 && v_cnt < 192)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 490 && h_cnt < 500 && v_cnt >= 192 && v_cnt < 206)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			
			else if (h_cnt >= 400 && h_cnt < 500 && v_cnt >= 20 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'h00f;
				
			
			
			// E
			else if (h_cnt >= 550 && h_cnt < 630 && v_cnt >= 40 && v_cnt < 110)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else if (h_cnt >= 550 && h_cnt < 630 && v_cnt >= 130 && v_cnt < 200)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			
			else if (h_cnt >= 530 && h_cnt < 630 && v_cnt >= 20 && v_cnt < 220)
				{vgaRed, vgaGreen, vgaBlue} = 12'hf0f;
				
			
			// star1 frame
			else if (h_cnt >= 70 && h_cnt < 75 && v_cnt >= 285 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 205 && h_cnt < 210 && v_cnt >= 285 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 70 && h_cnt < 210 && v_cnt >= 285 && v_cnt < 290)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 70 && h_cnt < 210 && v_cnt >= 430 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
				
			else if (h_cnt >= 75 && h_cnt < 205 && v_cnt >= 290 && v_cnt < 430 && SW[0] == 1)
				{vgaRed, vgaGreen, vgaBlue} = 12'hff0;
			else if (h_cnt >= 75 && h_cnt < 205 && v_cnt >= 290 && v_cnt < 430 && SW[0] == 0)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			
			// star2 frame
			else if (h_cnt >= 250 && h_cnt < 255 && v_cnt >= 285 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 385 && h_cnt < 390 && v_cnt >= 285 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 250 && h_cnt < 390 && v_cnt >= 285 && v_cnt < 290)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 250 && h_cnt < 390 && v_cnt >= 430 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
				
			else if (h_cnt >= 255 && h_cnt < 385 && v_cnt >= 290 && v_cnt < 430 && SW[1] == 1)
				{vgaRed, vgaGreen, vgaBlue} = 12'hff0;
			else if (h_cnt >= 255 && h_cnt < 385 && v_cnt >= 290 && v_cnt < 430 && SW[1] == 0)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;	
				
			// star3 frame
			else if (h_cnt >= 430 && h_cnt < 435 && v_cnt >= 285 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 565 && h_cnt < 570 && v_cnt >= 285 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 430 && h_cnt < 570 && v_cnt >= 285 && v_cnt < 290)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
			else if (h_cnt >= 430 && h_cnt < 570 && v_cnt >= 430 && v_cnt < 435)
				{vgaRed, vgaGreen, vgaBlue} = 12'haaa;
				
			else if (h_cnt >= 435 && h_cnt < 565 && v_cnt >= 290 && v_cnt < 430 && SW[2] == 1)
				{vgaRed, vgaGreen, vgaBlue} = 12'hff0;
			else if (h_cnt >= 435 && h_cnt < 565 && v_cnt >= 290 && v_cnt < 430 && SW[2] == 0)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;	
			
			
			
			
			else
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
		end	
		default: begin 
			if (!valid)
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
			else
				{vgaRed, vgaGreen, vgaBlue} = 12'h0;
		end		
	endcase
end

endmodule
