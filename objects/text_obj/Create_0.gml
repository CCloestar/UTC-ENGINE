_id = 0
gui = 0
txt = ""
fnt = 0

sep = -1
w = 9000

al = draw_alp()
o_al = draw_alp()

c = draw_col()
o_c = draw_col()

hs = 1
halp = 1

o_st = 0
o_style = 0

halign = fa_left
valign = fa_top

function draw_txt_obj(me = 0) {
	if me {
		var s = [image_xscale,image_yscale]
		var a = image_angle
		
		hs++
		
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
	}
}