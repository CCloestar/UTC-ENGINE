function draw_txt_alpha(xx = 0,yy = 0,_string = "Error",alpha = 1,scalex = 2,scaley = 2,angle = 0,c1 = draw_get_color(),c2 = draw_get_color(),c3 = draw_get_color(),c4 = draw_get_color()) {
	x2 = xx
	y2 = yy

	return draw_text_transformed_color(x2,y2,_string,scalex,scaley,angle,c1,c2,c3,c4,alpha)
}