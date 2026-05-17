var fl = i_number(o_follower)
var un = (global.hard = 2)

if inMenu and inMenu < 5 {
	var _y,_yy,cl,_a

	cl = global.story[100]

	ini_open(global.soulfile)
		_a = load_real("h_a")
	ini_close()

	_y = (y >= (view_y(view_camera[0]) + 120))
	_yy = 270 * _y

	if !dw {
		draw_b(32,52 + _yy,173,161 + _yy)
		draw_b(32,168,173,315)
	}
	else {
		var dy = [110 * _y,154 * _y]

		draw_b(32,52 + dy[0],173,315 + dy[0],,,,,1)
		for (var i = 0;i < 2;i++) {draw_rec(38,162 + dy[1],167,(167 - (2 * i)) + dy[1],,make_rgb(#9CA1BF,,[255 * i,255 * i,255 * i]))}
	}

	var op = [
		["ITEM","STAT",cl ? "CELL" : "TALK"],
		[(item_amt() > 0),1,(cl or fl)]
	]

	draw_font(1)
	draw_col(c_white)

	var ops = 0
	for (var i = 0;i < 3;i++) {
		if i = 2 and !op[1,2] {break}

		draw_alp(0.5 + (op[1,i] * 0.5))
		draw_txt(84 - (4 * l_check() * (i = 0)),196 + (36 * i),tr(op[0,i]))
		ops = i
	}

	draw_alp(1)

	var h = [global.hp[0,dw],global.maxhp[0,dw]]

	if l_check() or l_name() {draw_font(9)}
	var js = [2 - (l_check() or l_name()),2 - (l_name() * !l_check()),2 - l_check()]
	draw_txt(46,68 + _yy,draw_name(,7),js[0])

	draw_font(3)
	draw_txt(46,100 + _yy,tr("lv"))
	draw_txt(82,100 + _yy,str(global.lv))

	draw_txt(46,118 + _yy,tr($"hp_{un}",_a))
	if !un {draw_txt(82,118 + _yy,$"{h[0]}/{h[1]}")}

	draw_txt(46,136 + _yy,tr($"g_{dw}"))
	draw_txt(82,136 + _yy,str(global.g[dw]))
}

switch inMenu {
	#region SIDE BAR
		case 1:
			var cm = curMenu
			curMenu += d_pressed() - u_pressed()
			curMenu = clamp(curMenu,0,ops)
			if cm != curMenu {audio_play(click)}

			if z_pressed() {
				if op[1,cm] {
					inMenu += cm + 1
					cur_use = -1
					curIt = 0
					curCall = 0
				}

				audio_play(a_index($"select_{op[1,cm]}"))
			}

			if (x_pressed() or c_pressed()) and !delay {
				inMenu = 0
				char_free()
			}

			draw_spr(heart_menu,0,56,196 + (36 * cm) - (2 * l_check()),2,0,global.color[0],1)
		break
	#endregion

	#region ITEM
		case 2:
			draw_b(188,52,533,413,,,,,dw)
			draw_font(1)
			for (var i = 0;i < 8;i++) {draw_txt_outline(232,88 + (32 * i),tr(global.item[i,3 *dw]),c_white,#332033,,dw,,,,2)}

			var im = [
				["USE","INFO","DROP"],
				[232,328,442]
			]

			for (var i = 0;i < 3;i++) {
				draw_col(can[i] ? c_white : c_gray)
				draw_txt(im[1,i],368,tr(im[0,i]))
			}

			item_list()

			var ci = curIt

			var hx = [208,304,418]
			var hy = [88 + (32 * ci),368]

			var cu = [cur_use,(cur_use > -1)]

			if !cu[1] {
				curIt += d_pressed() - u_pressed()
				curIt = clamp(curIt,0,item_amt() - 1)
				if ci != curIt {audio_play(click)}

				if z_pressed() {
					cur_use = 0
					audio_play(select_1)
				}

				if x_pressed() {
					cur_use = -1
					curIt = 0
					inMenu--
				}
			}
			else {
				cur_use += r_pressed() - l_pressed()
				cur_use = clamp(cur_use,0,2)

				if z_pressed() {
					if can[cu[0]] {
						item_use_dial(dw)
						inMenu = 1.1
					}
					else {audio_play(select_0)}
				}

				if x_pressed() {cur_use = -1}
				if cu[0] != cur_use {audio_play(click)}
			}

			draw_spr(heart_menu,0,hx[cu[0] * cu[1]],hy[cu[1]] - (2 * l_check()),2,,global.color[0])
		break
	#endregion

	#region STAT
		case 3:
			var j = l_check()
			draw_b(188,52,533 + (18 * j),469,,,,,dw)

			var jx = 6 * j
			draw_font(1)
			draw_col(c_white)

			var at = [global.at[0,dw] - 10,global.wep_b[0,dw]]
			var df = [global.df[0,dw] - 10,global.arm_b[0,dw]]

			draw_txt(216 - jx,152,tr_u("lv_1",global.lv))
			draw_txt(216 - jx,184,tr_u($"hp_{2 - un}",un ? _a : h[0],h[1]))
			draw_txt(216 - jx,248,tr("at",at[0],at[1]))
			draw_txt(216 - jx,280,un ? "" : tr("def",df[0],df[1]))
			draw_txt(384 - jx,248,tr("xp",global.xp))
			draw_txt(384 - jx,280,tr("next",global.next - global.xp))
			draw_txt(216 - jx,340 - (4 * j),tr("wep",global.wep[0,dw]))
			draw_txt(216 - jx,372,tr("arm",global.arm[0,dw]))
			if global.kills[dw] > 20 {draw_txt(384,412,tr("kills",global.kills[dw]))}
			draw_txt(216 - jx,412 + (4 * j),tr($"G_{dw}",global.g[dw]))
			
			var ign = [""]
			
			var _c = (strlen(global.pname) > 6 and !ar_contains(ign,global.pname))
			var tt = tr("Easy to\nchange,\nhuh?")
			
			if _c {draw_txt(384 + (32 * j),92 + (36 * j),tt,js[2],,16 + (2 * j))}

			if l_name() and !j {draw_font(9)}
			draw_txt(216 - jx,92,$"\"{draw_name(,8)}\"",js[1])

			if x_pressed() {inMenu = 1}
		break
	#endregion

	#region TALK/CELL
		case 4:
			if !cl {
				fl_dial()
				inMenu = 1.1
			}
			else {
				var dl = [
					"Call Toriel A (Test)",
					"Call Toriel B (Test)",
					"Call Toriel C (Test)",
				]

				var da = 32 * (arlen(dl) - 5)
				if !da {da = 0}

				draw_b(188,52,533,321 + da,,,,,dw)
				draw_col(c_white)
				draw_font(1)
				for (var i = 0;i < arlen(dl);i++) {draw_txt(232,88 + (32 * i),tr(dl[i]))}

				var cc = curCall
				curCall += d_pressed() - u_pressed()
				curCall = clamp(curCall,0,arlen(dl) - 1)
				if cc != curCall {audio_play(click)}

				draw_spr(heart_menu,0,208,88 + (32 * cc),2,,global.color[0],1)

				if z_pressed() {
					audio_play(call_0)
					cell_dial()
					inMenu = 1.2 + (3.9 * dw)
				}

				if x_pressed() {inMenu = 1}
			}
		break
	#endregion

	#region CELL (DARK WORLD)
		case 5.1:
			if dw {
				with (md) {
					if !cur_m {
						if !draw {
							if !last_m {
								audio_play(call_1)
								music_pause()
								last_m = 1
							}
							else {
								if !audio_is_playing(call_1) {
									music_resume()
									finish = 1
									auto = 1
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

delay -= 0.5