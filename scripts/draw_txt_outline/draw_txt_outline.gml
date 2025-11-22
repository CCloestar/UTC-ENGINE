function draw_txt_outline(_x = 0,_y = 0,_string = "Error",color = draw_get_color(),o_color = c_black,alpha = 1,oalpha = 1,ang = 0,xscale = 2,yscale = 2,sep = 0,w = 900000,st = 0,style = 0) {
	var s0 = (1 + st) * xscale
	var s1 = (1 + st) * yscale

	switch style {
		case 0:
			draw_txt_ext_color(_x - s0,_y + s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x + s0,_y - s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x - s0,_y - s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x + s0,_y + s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x + s0,_y,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x - s0,_y,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x,_y + s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x,_y - s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
		break

		case 1:
			draw_txt_ext_color(_x + (s0 / 2),_y + (s1 / 2),_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x + (s0 / 2),_y - (s1 / 2),_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x - (s0 / 2),_y + (s1 / 2),_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x - (s0 / 2),_y - (s1 / 2),_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)

			draw_txt_ext_color(_x + s0,_y,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x - s0,_y,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x,_y + s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x,_y - s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
		break

		case 2:
			draw_txt_ext_color(_x + s0,_y + s1,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
		break
		
		case 3:
			draw_txt_ext_color(_x,_y + st,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x,_y - st,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x + st,_y,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
			draw_txt_ext_color(_x - st,_y,_string,sep,w,xscale,yscale,ang,o_color,o_color,o_color,o_color,oalpha)
		break
	}

	draw_txt_ext_color(_x,_y,_string,sep,w,xscale,yscale,ang,color,color,color,color,alpha)
}