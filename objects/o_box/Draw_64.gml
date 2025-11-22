box_check()
load_d_dw()

switch trigger {
	case 0:
		if interacted() {
			a = dial_create()

			if item_amt(dw) or box_amt(dw) {
				a.m[0] = text("* Use the box?&2         Yes         No")
				b = choice_create(,,a)

				trigger = 1
			}
			else {a.m[0] = text("put_" + string(irandom(2)))}
		}
	break
	
	case 1:
		if !dial_exists() {
			if !global.choice {trigger = 2}
			else {
				char_free()
				trigger = 0
			}
		}
	break
	
	case 2:
		var jx = 4 * l_check()
	
		draw_box(16 - jx,16 - jx,625 + jx,465 + jx,,,,,dw)

		draw_set_color(c_white)
		draw_line(321,94,321,393)
		draw_line(323,94,323,393)
		
		draw_font(!l_check())
		draw_set_halign(fa_center)
		
		draw_txt(167 - (7 * l_check()),38 - jx,text("INVENTORY"))
		draw_txt(469 - (3 * l_check()),38 - jx,text("BOX"))
		
		draw_font(1)
		draw_txt(320,414 - jx,text("box",string_upper(get_key(global.bt[5,0])),string_upper(get_key(global.bt[5,1]))))
		
		draw_set_halign(fa_left)
		
		draw_font(!l_check())
		
		for (var i = 0;i < 10;i++) {
			var _i,s
			_i[i,0] = global.item[i,3 * dw]
			_i[i,1] = global.box[i,dw]

			s = 32 * i
			
			for (var o = 0;o < 2;o++) {
				var _s = 302 * o

				draw_txt_outline((68 - (8 * l_check())) + (302 * o),(80 - jx) + s,text(_i[i,o]),c_white,#332033,,dw,,,,,,,2)

				if !(!o and i >= 8) and _i[i,o] = "" {
					draw_set_color(c_red)
					if dw {draw_set_color(c_navy)}
					
					var lx = 9
					if !o {lx += 4}
					
					lx *= l_check()
					
					draw_line((80 - lx) + _s,93 + s,(259 - (lx + l_check())) + _s,93 + s)
				}
			}
		}

		var _o = op
		var _p = p

		if u_pressed() {op--}
		if d_pressed() {op++}
		if r_pressed() {p++}
		if l_pressed() {p--}

		if p >= 2 {p = 1}
		if !p {p = 0}

		if !op {op = 0}
		if op > 9 {op = 9}
		if !p and op > 7 {op = 7}
		
		if _o != op or _p != p {audio_play(click)}
		
		draw_spr(heart_menu,0,(40 - (8 * l_check())) + (302 * p),82 + (32 * op),2,2,,global.color[0])
		
		var c
		c[0] = global.item[op,3 * dw]
		c[1] = global.box[op,dw]

		if z_pressed() and c[p] != "" {
			var s = 0

			if !(p and item_amt(dw) >= 8 and box_amt(dw) >= 10 and op > 6) {
				if !p {
					if box_amt(dw) < 10 {
						global.box[box_amt(dw),dw] = c[0]
						global.item[op,3 * dw] = ""
					}
					else {s = 1}
				}
				else {
					if item_amt(dw) < 8 {
						global.item[item_amt(dw),3 * dw] = c[1]
						global.box[op,dw] = ""
					}
					else {s = 1}
				}
			
				if s {
					global.box[op,dw] = c[0]
					global.item[op,3 * dw] = c[1]
				}
			}
			else {
				global.box[op,dw] = global.item[7,3 * dw]
				global.item[7,3 * dw] = c[1]
			}
			
			if global.item[op,3 * dw] != c[0] or global.box[op,dw] != c[1] {audio_play(select_1)}
		}

		if x_pressed() {
			char_free()
			trigger = 0
		}
	break
}