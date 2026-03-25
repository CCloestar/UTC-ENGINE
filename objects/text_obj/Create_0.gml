_id = 0
gui = 0
sp = 0
w = 9000
txt = ""
c = [draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color()]
fnt = 0

al = draw_get_alpha()
o_al = draw_get_alpha()

hs = 1
him_siner = 0
halp = 1

o_st = 0
o_style = 0

halign = fa_left
valign = fa_top

function draw_txt_obj(me = 0) {
	if me {
		var sx = image_xscale
		var sy = image_yscale
		var a = image_angle
		
		hs++
		
		draw_set_halign(halign)
		draw_set_valign(valign)
		draw_font(fnt)
		draw_set_color(c[0])
		draw_set_alpha(al)

		switch _id {
			default:
				draw_txt(x,y,txt,sx,sy,a)
			break
		
			case 1:
				draw_txt_alpha(x,y,txt,al,sx,sy,a,c[0],c[1],c[2],c[3])
			break
			
			case 2:
				draw_txt_color(x,y,txt,sx,sy,a,c[0],c[1],c[2],c[3],al)
			break
			
			case 3:
				draw_txt_ext(x,y,txt,sp,w,sx,sy,a)
			break
			
			case 4:
				draw_txt_ext_alpha(x,y,txt,sp,w,al,sx,sy,a,c[0],c[1],c[2],c[3])
			break
			
			case 5:
				draw_txt_ext_color(x,y,txt,sp,w,sx,sy,a,c[0],c[1],c[2],c[3],al)
			break
			
			case 6:
				draw_txt_him(x,y,txt,sx,sy,a,c[0],hs)
			break
			
			case 7:
				draw_txt_outline(x,y,txt,c[0],c[1],al,o_al,a,sx,sy,sp,w,o_st,o_style)
			break
			
			case 8:
				draw_txt_transformed(x,y,txt,sx,sy,a)
			break
		}
			
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_set_alpha(1)
	}
}