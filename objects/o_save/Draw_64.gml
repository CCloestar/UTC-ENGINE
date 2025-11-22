mask_lay(,1)

var c = o_mainchara

load_d_dw()

var dot = "."
if l_check() {dot = "。"}

var saver = text("fsave" + string(saved > 8),dot)

switch saveScene {
	#region OUTSIDE
		case 0:
			var ch,xx,yy,f
			ch = 0
			xx = x
			yy = y - 10
			f = 0

			switch ch {
				case 0:
					if !place_meeting(x,y - 25,c.solids) {yy = y - 25}
					else {ch = 1}
				break
	
				case 1:
					if !place_meeting(x + 25,y,c.solids) {
						xx = x + 25
						f = 3
					}
					else {ch = 2}
				break
	
				case 2:
					if !place_meeting(x,y + 25,c.solids) {
						yy = y + 25
						f = 2
					}
					else {ch = 3}
				break
	
				case 3:
					if !place_meeting(x - 25,y,c.solids) {
						xx = x - 25
						f = 1
					}
					else {ch = 0}
				break
			}

			if place_meeting(x,y - 25,c.solids) and place_meeting(x + 25,y,c.solids) and place_meeting(x,y + 5,c.solids) and place_meeting(x - 25,y,c.solids) {
				xx = c.x
				yy = c.y
				f = c.f
			}

			var che = checkpointer

			if !i_exists(che) {i_create(,,,che)}
			else {
				with (che) {load_checkpoint()}
				che.x = xx
				che.y = yy
				che.f = f
			}

			if interacted() {
				cur_op = 0
				char_stop()
	
				if dial {rm_check()}
				audio_play(hp_plus)

				for (var i = 0;i < 3;i++) {global.hp[i,dw] = global.maxhp[i,dw]}
				saveScene = 1
			}
		break
	#endregion

	#region SAVE
		case 1:
			if !dial_exists() {
				var lv,nam,file,tim,hspr,hsc,hfr
		
				tim = 0
				lv = 1
				nam = draw_name(,9)
				file = global.filename
				hspr = heart_menu
				hfr = 0
				hsc = 2
						
				if dw {
					hspr = heart_main
					hsc = 1
				}
		
				if file_exists(file) {
					ini_open(file)
						tim = ini_read_real("savefile","time",tim)
						lv = ini_read_real("savefile","lv",lv)
						rm = ini_read_string("savefile","roomName",rm)
					ini_close()
				}

				switch global.gamemode {
					#region UNDERTALE
						default:
							draw_box(108,118,531,291,,,,,dw)
					
							draw_font(1)
							draw_set_color(c_white)
							
							var j_y = (4 * l_check())
							var s_x = 170 + (18 * l_check())

							if cur_op = -1 {
								draw_set_color(c_yellow)
								if l_check() {s_x -= 14}

								if (z_pressed() or x_pressed()) and !delay {
									cur_op = 0
									saveScene = 0
									char_free()
								}
							}
							else {
								saver = text("Save")
								
								if l_pressed() or r_pressed() {
									cur_op = !cur_op
									audio_play(click)
								}
					
								if z_pressed() {
									switch cur_op {
										case 1:
											saveScene = 0
											char_free()
										break
							
										case 0:
											audio_play(save_plus)
											save_all()
											cur_op = -1
											saved++
									
											delay = 1
										break
									}
								}
					
								if x_pressed() {
									saveScene = 0
									char_free()
								}
								
								if l_check() {draw_font(1,2)}
								draw_txt(350 + (28 * l_check()),248 - j_y,text("Return"))
								draw_spr(hspr,0,(142 + ((180 + (10 * l_check())) * cur_op)) + (14 * l_check()),246,hsc,hsc,,global.color[0])
							}
							
							draw_font(1,j_name())
							draw_txt(140 - (12 * l_check()),148 - j_y,nam)
							
							draw_font(1)
							draw_txt(308 - (8 * l_check()),148 - j_y,text("LV") + " " + string(lv))

							draw_set_halign(fa_right)
							draw_txt(500 + (12 * l_check()),148 - j_y,draw_time(tim))
							draw_set_halign(fa_left)

							if l_check() {
								draw_set_halign(fa_center)
								draw_txt(320,188 - j_y,text(rm))
								draw_set_halign(fa_left)
							}
							else {draw_txt(140,188,text(rm))}

							if l_check() {draw_font(1,2)}
							draw_txt(s_x,248 - j_y,saver)
							
							draw_font(1)
						break
					#endregion
				}
			}
		break
	#endregion
}

if delay {delay -= 0.5}

function rm_check() {
	var rk = o_mainchara.rKills - global.kills[dw]
	
	a = dial_create()
	a.play = 0
	a.reset = 0
	a.m[0] = "* Serror"

	if global.route = 2 {
		if !rk {a.m[0] = text("* Determination.")}
		else {a.m[0] = text("rk",rk)}
	}
	else {
		switch room {
			case rm_hole0:
			break
		}

		for (var i = 0;i < 3;i++) {
			if global.hp[i,dw] < global.maxhp[i,dw] {a.m[array_length(a.m)] = text("* (HP fully restored.)")}
		}
	}
}