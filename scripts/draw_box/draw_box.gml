function draw_box(x1 = 0,y1 = 0,x2 = 0,y2 = 0,col1 = c_white,col2 = c_black,w = 6,outline = 0,dark = 0){
	if !dark {
		draw_set_color(col1)
		draw_rectangle(x1,y1,x2,y2,outline)
		draw_set_color(col2)
		draw_rectangle(x1 + w,y1 + w,x2 - w,y2 - w,outline)
	}
	else {
		var d_x1,d_y1,d_x2,d_y2,ww,hh
		
		d_x1 = x1 - 8
		d_y1 = y1 - 8

		d_x2 = x2 + 8
		d_y2 = y2 + 8

		ww = (d_x2 - d_x1) + 1
		hh = (d_y2 - d_y1) + 1

		draw_sprite_stretched_ext(d_dw,0,d_x1,d_y1,ww,hh,col1,1)
		draw_sprite_stretched_ext(d_dw,1,d_x1,d_y1,ww,hh,dwcol[curdwcol],1)
	}
}