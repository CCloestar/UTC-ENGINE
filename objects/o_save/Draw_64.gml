mask_lay(,1)

var c = o_mainchara

var fs = $"fsave{saved > 8}_{str_l(global.soul_name)}"
var saver = (tr(fs) != fs) ? tr(fs) : tr($"fsave{saved > 8}")

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
				with (che) {chpoint()}
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
				var nam,file,hspr,hsc,hfr

				nam = draw_name(,9)
				file = global.filename
				hspr = heart_menu
				hfr = 0
				hsc = 2

				if dw {
					hspr = heart_main
					hsc = 1
				}

				ini_open(file)
					var tim = load_real("time")
					var lv = load_real("lv",1)
					rm = load_str("roomName",rm)
				ini_close()

				switch global.gamemode {
					#region UNDERTALE
						default:
							draw_b(108,118,531,291,,,,,dw)

							draw_font(1)
							draw_col(c_white)

							var s_x = 170 + (14 * l_check())

							if cur_op = -999 {
								draw_col(c_yellow)
								if l_check() {s_x -= 14}

								if (z_pressed() or x_pressed()) and !delay {
									cur_op = 0
									saveScene = 0
									char_free()
								}
							}
							else {
								saver = tr("Save")

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
											cur_op = -999
											saved++

											delay = 1
										break
									}
								}

								if x_pressed() {
									saveScene = 0
									char_free()
								}

								draw_txt(350 + (24 * l_check()),248,tr("Return"))
								draw_spr(hspr,0,(142 + ((180 + (10 * l_check())) * cur_op)) + (14 * l_check()),246,hsc,,global.color[0])
							}

							draw_txt(140 - (16 * l_check()),148,nam)
							draw_txt(308 - (12 * l_check()),148,$"{tr("LV")} {lv}")

							draw_set_halign(fa_right)
							draw_txt(500 + (12 * l_check()),148,draw_time(tim))
							draw_set_halign(fa_left)

							switch global.fntf {
								default:
									draw_txt(140,188,tr(rm))
								break

								case 1:
									draw_set_halign(fa_center)
									draw_txt(320,188,tr(rm))
									draw_set_halign(fa_left)
								break
							}

							draw_txt(s_x,248,saver)
						break
					#endregion
				}
			}
		break
	#endregion
}

delay -= 0.5

function rm_check() {
	var rk = o_mainchara.rKills - global.kills[dw]

	a = dial_create()
	a.play = 0
	a.reset = 0
	a.m = ["* Serror"]

	if global.route = 2 {a.m = [tr($"rk_{!rk}",rk)]}
	else {
		var sData = {
			"rm": [["* Serror"],"Error???"]
		}
		
		var _rm = room_get_name(room)
		var sd = [sData[$ _rm],sData[$ "rm"]]

		a.m = (sd[0] = undefined) ? sd[1][0] : sd[0][0]
		rm = (sd[0] = undefined) ? sd[1][1] : sd[0][1]

		for (var i = 0;i < 3;i++) {
			if global.hp[i,dw] < global.maxhp[i,dw] {a.m[arlen(a.m)] = tr("* (HP fully restored.)")}
		}
	}
}