load_d_dw()
x = round(x)
y = round(y)

var con = (z_pressed() or c_hold())
var ski = (skip and (x_hold() or c_hold()))
var ox,oy,so,ang,bopper_x,bopper_y,limit

if last_m > -1 {limit = last_m}
else {limit = array_length(m) - 1}

var oWorld = i_exists(o_mainchara)

var _m = m[cur_m]

switch preset {
	case 0:
		var yy = 320
		
		if oWorld and pos != 1 {yy = 320 - (310 * (o_mainchara.y >= (camera_get_view_y(view_camera[0]) + 120) or (pos = 2)))}

		y = yy + 28
		x = 58
		
		if c[cur_m] != "" {x = 176}
		
		draw_box(32,yy,609,yy + 151,,,,,dw)
	break
	
	case 1:
		length = string_length(m[cur_m])
		skip = 0
		finish = 0
		snd = no_sound
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
			break
		}

		x = bx + 25 - (8 * l_check())
		y = by + 12

		draw_spr(dial_box,bubble,bx,by,1,1)
	break
	
	case 3:
		fnt = 6
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
	him_siner += 0.5
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

	if c[cur_m] != "" {
		switch c[cur_m] {
			case "Toriel":
				d_snd = dial_toriel
				speak = 0

				draw_spr(t_base,0,x - 124,y + 2,2,2)
				draw_spr(t_eyes,e[cur_m],x - 92,y + 14,2,2)

				if mo[cur_m] != t_m_static {draw_spr(mo[cur_m],talkfr,x - 84,y + 44,2,2)}
				else {draw_spr(t_m_static,mo_f[cur_m],x - 84,y + 44,2,2)}

				if !draw and (e[cur_m] = 1 or e[cur_m] = 2 or e[cur_m] = 5) {
					var bsp

					if !p_trigger[0] {bsp = 20 + irandom(30)}
					else {bsp = 30 + irandom(60)}

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
						draw_spr(t_blink,p_trigger[1] - 1,x - 92,y + 14,2,2)

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
		curchar = string_char_at(_m,i)
		nchar[0] = string_char_at(_m,i + 1)
		nchar[1] = string_char_at(_m,i + 2)
		
		switch nchar[0] {
			case "~":
				switch nchar[1] {
					case "R":
						col = c_red
						i += 2
					break

					case "O":
						col = c_orange
						i += 2
					break

					case "Y":
						col = c_yellow
						i += 2
					break
					
					case "G":
						col = c_lime
						i += 2
					break
					
					case "g":
						col = c_green
						i += 2
					break

					case "A":
						col = c_aqua
						i += 2
					break
					
					case "L":
						col = #0EC0FD
						i += 2
					break
					
					case "B":
						col = c_blue
						i += 2
					break
					
					case "P":
						col = c_fuchsia
						i += 2
					break
					
					case "p":
						col = #FFBBD4
						i += 2
					break
				
					case "W":
						col = c_white
						i += 2
					break
				
					case "X":
						col = c_black
						i += 2
					break
				
					case "Z":
						col = make_color_hsv((timer[0] mod 255),255,255)
						i += 2
					break
				
					case "S":
						col = global.color[0]
						i += 2
					break
					
					case "M":
						col = c_gray
						i += 2
					break
				
					case "N":
						col = c_dkgray
						i += 2
					break
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
						for (var p = 1;p < array_length(amp);p++) {amp[p] = 2}
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
				}
			break
		
			case "&":
				if nchar[1] = "&" or nchar[1] = "2" {
					_xx = 0
					_yy += y_sep
					if nchar[1] = "2" {_yy += y_sep}
					i += 2
				}
			break
		}
			
		nchar[2] = string_char_at(_m,i + 1)
		
		if (nchar[2] = "*" or nchar[2] = "＊") and reset {
			for (var o = 0;o < array_length(m_ef);o++) {m_ef[o] = 0}
			for (var p = 0;p < array_length(amp);p++) {amp[p] = 0}
			col = d_col
		}

		var t = 0

		if i_exists(battle_globals) {t = battle_globals.tense}
		
		if t {
			timer[1]++
			
			var st = 2
			
			if timer[1] >= irandom_range(180 * st,360 * st) {
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
			ox = random(rand_st) - (rand_st / 2)
			oy = random(rand_st) - (rand_st / 2)
		}

		if m_ef[1] {oy -= sin(so * pi * 2 / 30) * 3}
		
		if m_ef[2] {
			ox += sin(so * pi * 2 / 30) * 2
			oy += cos(so * pi * 2 / 30) * 2
        }
		
		bopper_x = irandom_range(-tenbop,tenbop)
		bopper_y = irandom_range(-tenbop,tenbop)
		
		var j_x = 0
		var j_y = 0
		
		if l_check() and fnt != 2 {
			j_y = -4
			j_x = 8 - (2 * (c[cur_m] != ""))
		}
	
		var txt_x = round((x + ox - ang[i]) + _xx) + j_x
		var txt_y = round(((y + oy - ang[i]) - jumpy[i]) + _yy) + j_y
		var txt = string_char_at(_m,i + 1)
		var txt_sx = image_xscale
		var txt_sy = image_yscale
		var txt_a = image_alpha

		draw_font(fnt)
		
		if !him {
			var col2

			if dw {
				col2 = c_white
				
				if col = c_white or col = c_black {draw_txt_color(txt_x + 1,txt_y + 1,txt,txt_sx,txt_sy,ang[i],c_dkgray,c_dkgray,c_navy,c_navy,txt_a)}
				else {draw_txt_color(txt_x + 1,txt_y + 1,txt,txt_sx,txt_sy,ang[i],col,col,col,col,txt_a * 0.3)}
			}
			else {col2 = col}
			
			draw_txt_color(txt_x,txt_y,txt,txt_sx,txt_sy,ang[i],col2,col2,col,col,txt_a)
		}
		else {draw_txt_him(txt_x,txt_y,txt,txt_sx,txt_sy,ang[i],col,0)}
		
		var _sep
		_sep[i] = space_sep - (2 * l_check())
		
		if string_ord_at(_m,i + 1) > 12351 {_xx += x_sep * (1.6 * japsep)}
		else {
			if string_char_at(_m,i + 1) != " " {_xx += x_sep}
			else {_xx += _sep[i]}
		}
		
		_xx = round(_xx)
		_yy = round(_yy)
	}

	if draw {
		cur_sp += (1 / adv)
		
		if cur_sp >= sp {
			length += adv
			cur_sp = 0
			talk = 1

			for (var q = 0;q < length;q++) {
				nchar[3] = string_char_at(_m,q + 1)
				nchar[4] = string_char_at(_m,q + 2)
			}
			
			switch nchar[3] {
				case "?":
				case "!":
				case ".":
				case "？":
				case "！":
				case "。":
				case "…":
					if (nchar[4] != "." and nchar[4] != "!" and nchar[4] != "?" 
					and nchar[4] != ")" and nchar[4] != "\"" and nchar[4] != "。" 
					and nchar[4] != "！" and nchar[4] != "？") {
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
			
			if nchar[3] != " " and !(nchar[3] = "&" and (nchar[4] = "&" or nchar[4] = "2")) {
				audio_stop(d_snd)
				
				var rndpit
				
				if m_ef[3] {rndpit = random_range(-0.2,0.2)}
				else {rndpit = 0}
				
				audio_play(d_snd,,,vol,,pit + rndpit)
				talk = 1
			}
		}

		if ski {
			switch skipper {
				default:
					length = string_length(_m)
					draw = 0
				break

				case 1:
					cur_sp += abs(sp)
				break
			}
		}
		
		if length >= string_length(_m) {draw = 0}
	}
	else {
		cur_sp = 0
		talk = 0

		if finish and (con and !auto) or auto {next_m = 1}
	}

	if next_m {
		if cur_m < limit {
			for (var i1 = 0;i1 < array_length(m_ef);i1++) {m_ef[i1] = 0}
			for (var i2 = 0;i2 < array_length(timer);i2++) {timer[i2] = 0}
			for (var i3 = 0;i3 < array_length(amp);i3++) {amp[i3] = 0}
			for (var i4 = 0;i4 < array_length(jumpy);i4++) {jumpy[i4] = 0}

			d = (c[cur_m + 1] != c[cur_m])

			cur_m++
			length = 0
			draw = 1

			talk = 0
			talkfr = 0
			ttalk = 0
		}
		else {
			talk = 0
			talkfr = 0
			ttalk = 0

			destroy()
		}
	
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
