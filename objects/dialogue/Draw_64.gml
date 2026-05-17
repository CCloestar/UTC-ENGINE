x = round(x)
y = round(y)

var con = (z_pressed() or c_hold())
var ski = (skip and (x_hold() or c_hold()))
var ox,oy,so,ang,bopper_x,bopper_y,limit

if last_m > -1 {limit = last_m}
else {limit = arlen(m) - 1}

var oWorld = i_exists(o_mainchara)

var _m = m[cur_m]
var portchars = ["Toriel"]
var port = ar_contains(portchars,c[cur_m])

switch preset {
	case 0:
		var yy = 320

		if oWorld and pos != 1 {yy = 320 - (310 * (o_mainchara.y >= (view_y(view_camera[0]) + 120) or (pos = 2)))}

		y = yy + 28
		x = 58 + (118 * port)

		draw_b(32,yy,609,yy + 151,,,,,dw)
	break

	case 1:
		length = strlen(m[cur_m])
		skip = 0
		finish = 0
		snd = -1
		d = 0
	break

	case 2:
		d_col = c_black

		switch fnt {
			case 2:
				x_sep = 9
				y_sep = 20
				image_xscale = 1
				image_yscale = 1
				_xx -= l_check()
			break
		}

		x = bx + 25
		y = by + 12
		draw_spr(dial_box,bubble,bx,by,1)
	break

	case 3:
		fnt = -1
		x_sep = 60
		image_xscale = 1
		image_yscale = 1
		d_col = global.color[0]
		snd = battle_begin_0
		space_sep = 6
		m_ef[3] = 1
		sp = 3
		skip = 0
		play = 0
		finish = 0
		vol = 0.5
	break
}

if !d {
	timer[0]++
	_xx = 0
	_yy = 0

	if space_sep = "D" {space_sep = x_sep}

	var col = d_col

	var skipper = 0

	var curchar,nchar
	curchar = ""
	for (var n = 0;n < 5;n++) {nchar[n] = ""}

	var adv = 1
	var laughfr = 0
	var halt = 1
	var talk_sp = 0.25
	var d_snd = snd
	var s_reset = 1
	var rndpit = pit

	if c[cur_m] != "" {
		switch c[cur_m] {
			case "Toriel":
				d_snd = dial_toriel
				speak = 0

				draw_spr(t_base,0,x - 124,y + 2,2)
				draw_spr(t_eyes,e[cur_m],x - 92,y + 14,2)

				if mo[cur_m] != t_m_static {draw_spr(mo[cur_m],talkfr,x - 84,y + 44,2)}
				else {draw_spr(t_m_static,mo_f[cur_m],x - 84,y + 44,2)}

				if !draw and (e[cur_m] = 1 or e[cur_m] = 2 or e[cur_m] = 5) {
					var bsp

					if !p_trigger[0] {bsp = 20 + irnd(30)}
					else {bsp = 30 + irnd(60)}

					if !p_trigger[1] {
						p_timer[0]++

						if p_timer[0] >= bsp {
							for (var b = 0;b < 2;b++) {
								p_trigger[b] = 1
								p_timer[b] = 0
							}
						}
					}
					else {
						draw_spr(t_blink,p_trigger[1] - 1,x - 92,y + 14,2)

						p_timer[1] += 7.5

						if p_timer[1] >= 30 {
							if p_trigger[1] < 2 {p_trigger[1]++}
							else {p_trigger[1] = 0}

							p_timer[1] = 0
						}
					}
				}
			break
		}
	}

	for (var i = 0;i < length;i++) {
		curchar = strchr(_m,i)
		nchar[0] = strchr(_m,i + 1)
		nchar[1] = strchr(_m,i + 2)

		switch nchar[0] {
			case "~":
				var c_table = {
					"--": 0,
					"R": c_red,
					"O": c_orange,
					"Y": c_yellow,
					"G": c_lime,
					"g": c_green,
					"A": c_aqua,
					"L": #0EC0FD,
					"B": c_blue,
					"P": c_fuchsia,
					"p": #FFBBD4,
					"W": c_white,
					"X": c_black,
					"Z": make_hsv(timer[0] mod 255,255,255),
					"S": global.color[0],
					"M": c_gray,
					"N": c_dkgray
				}
				var ct = c_table[$ nchar[1]] ?? "--"

				if ct != "--" {
					col = ct
					i += 2
				}
			break

			case "^":
				switch nchar[1] {
					case "S": //Shake
						m_ef[0] = 1
						i += 2
					break

					case "W": //Wave
						m_ef[1] = 1
						amp[0] = 3
						i += 2
					break

					case "w": //Wobble
						m_ef[2] = 1
						for (var p = 1;p < arlen(amp);p++) {amp[p] = 2}
						i += 2
					break

					case "J": //Jump
						jumpy[length] = jump_st
						i += 2
					break

					case "F": //Instant finish
						ski = 1
						i += 2
					break

					case "9":
					case "8":
					case "7":
					case "6":
					case "5":
					case "4":
					case "3":
					case "2":
					case "1":
					case "0":
						i += 2
					break
				}
			break
		
			case "&":
				if nchar[1] = "&" or (strlen(strdigs(nchar[1])) > 0) {
					_xx = 0

					var br = (nchar[1] = "&") ? 1 : real(nchar[1])
					_yy += y_sep * br

					i += 2
				}
			break
		}

		nchar[2] = strchr(_m,i + 1)

		if (nchar[2] = "*" or nchar[2] = "＊") and reset {
			for (var o = 0;o < arlen(m_ef);o++) {m_ef[o] = 0}
			for (var p = 0;p < arlen(amp);p++) {amp[p] = 0}
			col = d_col
		}

		var t = i_exists(battle_globals) ? battle_globals.tense : 0

		if t {
			timer[1]++
			var st = 2

			if timer[1] >= irnd_r(180 * st,360 * st) {
				timer[1] = 0
				tenbop = 1
			}

			if timer[1] >= 2 {tenbop = 0}
		}

		if jumpy[i] {jumpy[i] -= jump_st / 2}

		ox = 0
		oy = 0
		so = timer[0] + i

		ang[i] = image_angle * (i + 1)

		if m_ef[0] {
			ox += rnd(rand_st) - (rand_st / 2)
			oy += rnd(rand_st) - (rand_st / 2)
		}

		if m_ef[1] {oy -= sin(so * pi * 2 / 30) * 3}

		if m_ef[2] {
			ox += sin(so * pi * 2 / 30) * 2
			oy += cos(so * pi * 2 / 30) * 2
        }

		bopper_x = irnd_r(-tenbop,tenbop)
		bopper_y = irnd_r(-tenbop,tenbop)

		var _x = round((x + ox - ang[i]) + _xx)
		var _y = round(((y + oy - ang[i]) - jumpy[i]) + _yy)
		var txt = strchr(_m,i + 1)
		var sx = image_xscale
		var sy = image_yscale
		var _a = image_alpha
		var _c = [col,(dw * !global.simpleVFX) ? c_white : col]

		draw_font(fnt)

		if !him {
			var bgc = (_c[0] = c_white or _c[0] = c_black)

			draw_txt_color(_x + 1,_y + 1,txt,[sx,sy],ang[i],!(bgc) ? _c[0] : [c_dkgray,c_dkgray,c_navy,c_navy],(_a * (1 - (0.7 * !bgc))) * dw)
			draw_txt_color(_x,_y,txt,[sx,sy],ang[i],[_c[1],_c[1],_c[0],_c[0]],_a)
		}
		else {draw_txt_him(_x,_y,txt,[sx,sy],ang[i],_c[0],0)}

		var _sep
		_sep[i] = space_sep

		if strchr(_m,i + 1) != " " {_xx += x_sep}
		else {_xx += _sep[i]}

		if l_check() and japsep {
			if !(strord(_m,i + 1) < 256 or (strord(_m,i + 1) >= 65377 and strord(_m,i + 1) <= 65439)) {_xx += (x_sep / 1.6)}
			else {_xx++}
		}
	}

	if global.debug and ord_pressed("P") {dialsm_create(,,choose("Hello!","World!","Long\nText!"))}

	if draw {
		cur_sp += (1 / adv)

		if cur_sp >= sp {
			length += adv
			cur_sp = 0
			talk = 1

			nchar[3] = strchr(_m,length)
			nchar[4] = strchr(_m,length + 1)

			for (var q = 1;q < 11;q++) {
				if (nchar[3] = "&" and (nchar[4] = "&" or nchar[4] = str(q))) 
				or (nchar[3] = "~" and (nchar[4] != str_l(nchar[4]) or nchar[4] = "p" or nchar[4] = "g"))
				or (nchar[3] = "^" and (nchar[4] != str_l(nchar[4]) or nchar[4] = "w")) {
					length += 2
					break
				}

				if nchar[3] != " " or (nchar[3] = "&" and nchar[4] != "&" and nchar[4] != str(q))
				or (nchar[3] = "~" and nchar[4] != str(q - 1)) {
					if s_reset {audio_stop(d_snd)}

					if m_ef[3] {rndpit += rnd_r(-0.2,0.2)}

					if (!s_reset and !audio_is_playing(d_snd)) or s_reset {
						audio_play(d_snd,,,vol,,rndpit)	
						talk = 1
					}
					break
				}
			}

			if auto_punc {
				switch nchar[3] {
					case "?":
					case "!":
					case ".":
					case "？":
					case "！":
					case "。":
					case "…":
						if (nchar[4] != nchar[3]) 
						and nchar[4] != ")" and nchar[4] != "\"" and nchar[4] != "]" 
						and nchar[4] != "!" and nchar[4] != "?" and nchar[4] != "？"
						and nchar[4] != "！" {
							cur_sp -= 20
							talk = 0
						}
					break

					case "、":
					case ",":
						cur_sp -= 10
						talk = 0
					break
				}
			}

			for (var q = 0;q < 10;q++) {
				if (strchr(_m,length - 1) = "^" and nchar[3] = str(q)) {
					cur_sp -= real(nchar[3]) * 10
					length += 2
					talk = 0
				}
			}
		}

		if ski {
			switch skipper {
				default:
					length = strlen(_m)
					draw = 0
				break

				case 1:
					cur_sp += abs(sp)
				break
			}
		}

		if length >= strlen(_m) {
			length = strlen(_m)
			draw = 0
		}
	}
	else {
		cur_sp = 0
		talk = 0

		if finish and (con and !auto) or auto {next_m = 1}
	}

	if next_m {
		if cur_m < limit {
			for (var i1 = 0;i1 < arlen(m_ef);i1++) {m_ef[i1] = 0}
			for (var i2 = 0;i2 < arlen(timer);i2++) {timer[i2] = 0}
			for (var i3 = 0;i3 < arlen(amp);i3++) {amp[i3] = 0}
			for (var i4 = 0;i4 < arlen(jumpy);i4++) {jumpy[i4] = 0}

			d = (c[cur_m + 1] != c[cur_m])

			cur_m++
			length = 0
			draw = 1
		}
		else {destroy()}

		talk = 0
		talkfr = 0
		ttalk = 0

		dialsm_destroy()
		next_m = 0
	}

	if talk {ttalk += 30 * talk_sp}
	else {
		if !laughfr {
			if talkfr {ttalk += 30 * talk_sp}
			else {
				ttalk = 0
				talk = 0
				if halt {talkfr = 0}
			}
		}
		else {ttalk += 30 * talk_sp}
	}

	if ttalk >= 30 {
		talkfr = !talkfr
		ttalk = 0
	}
}
else {d -= 0.5}

if in_debug() {
	draw_font(1)

	var dbst = [
		$"Pos: {x},{y}",
		$"S:{audio_get_name(snd)},V:{vol},P:{pit},F:{fnt}",
		$"SP:{sp},CurSP:{cur_sp},T:{talk},AutoPunc:{auto_punc}",
		$"L:{length},CurM:{cur_m},NextM:{next_m},LastM:{last_m}",
		"M:"
	]

	var db_y = y - (14 * arlen(dbst))

	for (var i = 0;i < arlen(dbst);i++) {draw_txt_outline(x,db_y + (14 * i),dbst[i],global.color[0],,,,,1,,1)}
	for (var i = 1;i < strlen(m[cur_m]) + 1;i++) {draw_txt_outline((x + 16) + (8 * i),db_y + (14 * 4),strchr(m[cur_m],i),global.color[0],,,,,1,,1)}

	if length {
		for (var i = 0;i < adv;i++) {draw_txt_outline((x + 16) + (8 * length) + (8 * i),db_y + (14 * 4),strchr(m[cur_m],length + i),i_col(global.color[0]),,,,,1,,1)}
	}
}