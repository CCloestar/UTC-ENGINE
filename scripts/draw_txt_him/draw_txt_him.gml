function draw_txt_him(xx = 0,yy = 0,_string = "Error",scalex = 2,scaley = 2,angle = 0,col = draw_get_color(),himsin = 1) {
	him_siner += himsin
	
	var himal = (0.08 + sin(him_siner / 14) * 0.04) * halp

	draw_txt_color(xx + scalex,yy + scaley,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx - scalex,yy - scaley,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx - scalex,yy + scaley,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx + scalex,yy - scaley,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx + scalex,yy,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx - scalex,yy,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx,yy + scaley,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx,yy - scaley,_string,scalex,scaley,angle,col,col,col,col,himal)
	draw_txt_color(xx,yy,_string,scalex,scaley,angle,col,col,col,col,1 * halp)
}