_id = 0
gui = 0
<<<<<<< HEAD
txt = ""
fnt = 0

sep = -1
w = 9000

al = draw_alp()
o_al = draw_alp()

c = draw_col()
o_c = draw_col()

hs = 1
=======
sp = 0
w = 9000
txt = ""
c = [draw_get_color(),draw_get_color(),draw_get_color(),draw_get_color()]
fnt = 0

al = draw_get_alpha()
o_al = draw_get_alpha()

hs = 1
him_siner = 0
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
halp = 1

o_st = 0
o_style = 0

halign = fa_left
valign = fa_top

function draw_txt_obj(me = 0) {
	if me {
<<<<<<< HEAD
		var s = [image_xscale,image_yscale]
=======
		var sx = image_xscale
		var sy = image_yscale
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		var a = image_angle
		
		hs++
		
<<<<<<< HEAD
		var _c = is_array(c) ? [c[0],c[1],c[2],c[3]] : [c,c,c,c]
		var _oc = is_array(o_c) ? [o_c[0],o_c[1],o_c[2],o_c[3]] : [o_c,o_c,o_c,o_c]
		
		draw_set_halign(halign)
		draw_set_valign(valign)
		draw_font(fnt)
		draw_col(_c[0])
		draw_alp()

		switch _id {
			default:
				draw_txt(x,y,txt,[s[0],s[1]],a,sep,w)
			break

			case 1:
				draw_txt_color(x,y,txt,[s[0],s[1]],a,[_c[0],_c[1],_c[2],_c[3]],al,sep,w)
			break

			case 2:
				draw_txt_him(x,y,txt,[s[0],s[1]],a,[_c[0],_c[1],_c[2],_c[3]],hs,sep,w)
			break

			case 3:
				draw_txt_outline(x,y,txt,[_c[0],_c[1],_c[2],_c[3]],[_oc[0],_oc[1],_oc[2],_oc[3]],al,o_al,a,[s[0],s[1]],o_st,o_style,sep,w)
			break
		}

		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_alp(1)
=======
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
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	}
}