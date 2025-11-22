var op
op[0,0] = "ITEM"
op[0,1] = (item_amt(dw) > 0)

op[1,0] = "STAT"
op[1,1] = 1

op[2,0] = "TALK"
op[2,1] = 0

var hasCell = 0
var fl = instance_number(o_follower)
var unf = (global.hard = 2)
var att = 0
var n = global.pname

if file_exists(global.filename) {
	ini_open(global.filename)
		hasCell = ini_read_real("savefile","st_100",0)
	ini_close()
}
	
if file_exists(global.soulfile) {
	ini_open(global.soulfile)
		att = ini_read_real(string_lower(global.soul_name),"h_a",0)
	ini_close()
}

if fl or hasCell {
	if hasCell {op[2,0] = "CELL"}
	op[2,1] = 1
}

var _y = (y >= (camera_get_view_y(view_camera[0]) + 120))
var _yy = 270 * _y

load_d_dw()

if inMenu and inMenu < 5 {
	if !dw {
		draw_box(32,52 + _yy,173,161 + _yy)
		draw_box(32,168,173,315)
	}
	else {
		var d_y = 110 * _y
		var d_yy = 154 * _y

		draw_sprite_stretched_ext(d_dw,0,24,44 + d_y,158,280,c_white,1)
		draw_sprite_stretched_ext(d_dw,1,24,44 + d_y,158,280,dwcol[curdwcol],1)
			
		draw_set_color(#9CA1BF)
		draw_rectangle(38,162 + d_yy,167,167 + d_yy,0)
		draw_set_color(c_white)
		draw_rectangle(38,162 + d_yy,167,165 + d_yy,0)	
	}

	draw_font(1 + (2 * j_name()),j_name())
	draw_set_color(c_white)
		
	var jyy = l_check()
	var jsc = 2 - j_name()

	draw_txt(46,68 + j_name() + _yy,draw_name(n,7),jsc,jsc)
		
	for (var i = 0;i < 3;i++) {
		if !(i = 2 and !op[2,1]) {
			draw_font(1)
			draw_set_alpha(0.5 + (op[i,1] * 0.5))
			draw_txt(84,(196 + (36 * i)) - (4 * jyy),text(op[i,0]))
		}
	}

	draw_set_alpha(1)
		
	var j_xx = 0

	draw_font(3)
	draw_txt(46,100 + _yy,text("lv"))
	draw_txt(82,100 + _yy,string(global.lv))

	draw_txt(46,118 + _yy,text("hp_" + string(global.hard = 2),att))
	if !unf {draw_txt(82,118 + _yy,string(global.hp[0,dw]) + "/" + string(global.maxhp[0,dw]))}
		
	draw_txt(46,136 + _yy,text("g_" + string(dw)))
	draw_txt(82,136 + _yy,string(global.g[dw]))
}

switch inMenu {
	#region side menu
		case 1:
			draw_spr(heart_menu,0,56,(196 + (36 * curMenu)) - (2 * l_check()),2,2,0,global.color[0],1)
			
			var limit = 1 + op[2,1]
				
			if u_pressed() and curMenu {
				curMenu--
				audio_play(click)
			}
			
			if d_pressed() and curMenu < limit {
				curMenu++
				audio_play(click)
			}
			
			if z_pressed() {
				if op[curMenu,1] {
					inMenu += (curMenu + 1)
					cur_use = -1
					curIt = 0
					curCall = 0
				}

				audio_play(asset_get_index("select_" + string(op[curMenu,1])))
			}
			
			if (x_pressed() or c_pressed()) and !delay {
				inMenu = 0
				c = 0
			}
		break
	#endregion
	
	#region item menu
		case 2:
			draw_box(188,52,533,413,,,,,dw)

			draw_font(1)
				
			var j_yy = 0
			var j_xx = 0
				
			if l_check() {
				draw_font()
				j_yy = 4
				j_xx = 2
			}

			for (var i = 0;i < 8;i++) {
				var its
				its[i] = global.item[i,3 * dw]
					
				draw_txt_outline(232 + j_yy,(88 + (32 * i)) - j_yy,text(its[i]),c_white,#332033,,dw,,,,,,,2)
			}
				
			draw_font(1)
				
			draw_set_color(c_white)
			if !can[0] {draw_set_color(c_gray)}
			draw_txt(232,368 - j_yy,text("USE"))
				
			draw_set_color(c_white)
			if !can[1] {draw_set_color(c_gray)}
			draw_txt(328 + j_yy,368 - j_yy,text("INFO"))

			draw_set_color(c_white)
			if !can[2] {draw_set_color(c_gray)}
			draw_txt(442,368 - j_yy,text("DROP"))
				
			draw_set_color(c_white)

			var hx = 208
			var hy = 88 + (32 * curIt)
				
			item_list()
				
			if cur_use > -1 {
				hx = 208
				hy = 368
					
				if cur_use = 1 {hx = 304}
				if cur_use = 2 {hx = 418}
					
				if l_pressed() and cur_use {
					audio_play(click)
					cur_use--
				}
					
				if r_pressed() and cur_use < 2 {
					audio_play(click)
					cur_use++
				}
					
				if z_pressed() {
					if can[cur_use] {
						item_use_dial(dw_check())

						inMenu = 1.1
					}
					else {audio_play(select_0)}
				}

				if x_pressed() {cur_use = -1}
			}
			else {
				if u_pressed() and curIt {
					audio_play(click)
					curIt--
				}
					
				if d_pressed() and curIt < (item_amt(dw) - 1) {
					audio_play(click)
					curIt++	
				}
					
				if z_pressed() {
					audio_play(select_1)
					cur_use = 0
				}
						
				if x_pressed() {
					cur_use = -1
					curIt = 0
					inMenu = 1
				}
			}

			draw_spr(heart_menu,0,hx,hy - (2 * l_check()),2,2,,global.color[0])
		break
	#endregion
	
	#region stat menu
		case 3:
			var j_xx = 0
			var j_yy = 0
			
			if l_check() {j_xx = 18}
					
			draw_box(188,52,533 + j_xx,469,,,,,dw)
				
			if l_check() {
				j_xx = 3
				j_yy = 2
			}
				
			var j_x = 0
			var j_y = 0
				
			if l_check() {
				j_x = 3
				j_y = 4
			}
				
			draw_set_color(c_white)
			draw_font(1,j_name())

			draw_txt(216 - j_x,(92 - j_y) - j_name(),"\"" + draw_name(n,8) + "\"")
				
			var _hh = global.hp[0,dw]
			if unf {_hh = att}

			draw_font(1)
			draw_txt((216 - j_xx) - j_x,152 - j_y,string_upper(text("lv_1",global.lv)))
			draw_txt((216 - j_xx) - j_x,184 - j_y,string_upper(text("hp_" + string(2 - unf),_hh,global.maxhp[0,dw])))
			draw_txt((216 - j_xx) - j_x,248 - j_y,text("at",global.at[0,dw] - 10,global.wep_b[0,dw]))
			if !unf {draw_txt((216 - j_xx) - j_x,280 - j_y,text("def",global.df[0,dw] - 10,global.arm_b[0,dw]))}
			draw_txt((384 - j_xx) - j_x,248 - j_y,text("xp",global.xp))
			draw_txt((384 - j_xx) - j_x,280 - j_y,text("next",global.next - global.xp))
			draw_txt((216 - j_xx) - l_check(),(340 - j_yy) - (6 * l_check()),text("wep",global.wep[0,dw]))
			draw_txt((216 - j_xx) - j_x,372 - j_y,text("arm",global.arm[0,dw]))

			if global.kills[dw] > 20 {draw_txt((384 - j_xx) - j_x,(412 + j_yy) - j_y,text("kills",global.kills[dw]))}

			switch global.gamemode {
				default:
					var igname = 0

					if string_length(global.pname) > 6 and !igname {
						var jsc = 2 - l_check()
							
						draw_font(!l_check())
						draw_txt((384 - j_xx) + (37 * l_check()),92 + (34 * l_check()),text("Easy to\nchange,\nhuh?"),jsc,jsc)
					}
				break
			}
				
			if l_check() {j_y = 2}
				
			draw_font(1)
			draw_txt((216 - j_xx) - j_x,(412 + j_yy) - j_y,text("G_" + string(dw),global.g[dw]))
				
			if x_pressed() {inMenu = 1}
		break
	#endregion
		
	#region cell menu
		case 4:
			if !hasCell {
				if fl {
					fl_dial()
					inMenu = 1.1
				}
			}
			else {
				var dials

				dials[0] = "Call Toriel (Test)"
				dials[1] = "Call Toriel 2 (Test)"
				dials[2] = "Call Toriel 3 (Test)"
					
				var d_add = 0
					
				if array_length(dials) > 6 {d_add = 32 * (array_length(dials) - 5)}
					
				draw_box(188,52,533,321 + d_add,,,,,dw)
					
				draw_set_color(c_white)
				draw_font(!l_check())
					
				for (var i = 0;i < array_length(dials);i++) {draw_txt(232 + (4 * l_check()),(88 + (32 * i)) - (2 * l_check()),text(dials[i]))}
					
				if u_pressed() and curCall {
					curCall--
					audio_play(click)
				}

				if d_pressed() and curCall < (array_length(dials) - 1) {
					curCall++
					audio_play(click)
				}
					
				if x_pressed() {
					inMenu = 1
					curCall = 0
				}

				draw_spr(heart_menu,0,208,(88 + (32 * curCall)) - (2 * l_check()),2,2,,global.color[0])
					
				if z_pressed() {
					audio_play(call_0)
					cell_dialogue()
					if !dw {inMenu = 1.2}
					else {inMenu = 5.1}
				}
			}
		break
	#endregion

	#region cell menu but FUCKED UP AND GASTER LIKE!!!!!!!!!!!!!!
		case 5.1:
			if dw {
				with (md) {
					if !cur_m {
						if !draw {
							if vol = 1 {
								audio_play(call_1)
								music_pause()

								vol = 0
							}
							else {
								if !audio_is_playing(call_1) {
									music_resume()
									finish = 1
									auto = 1
									vol = 1
								}
							}
						}
						else {finish = 0}
					}
					else {auto = 0}
				}
			}
		break
	#endregion
}

if delay {delay -= 0.5}