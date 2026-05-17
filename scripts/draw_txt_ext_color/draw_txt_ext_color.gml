function draw_txt_ext_color(xx = 0,yy = 0,_string = "Error",sep = 0,w = 900000,scalex = 2,scaley = 2,angle = 0,c1 = draw_get_color(),c2 = draw_get_color(),c3 = draw_get_color(),c4 = draw_get_color(),alpha = 1) {
	x2 = xx
	y2 = yy
	
	/*
	switch draw_get_font() {
		case global.FONT[1,0]:
			x2 = xx - scalex
		break
	}
	*/

	return draw_text_ext_transformed_color(x2,y2,_string,sep,w,scalex,scaley,angle,c1,c2,c3,c4,alpha)
}