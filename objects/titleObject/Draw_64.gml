var _c = "config.ini"
var b = border
var con = on_controller()
var ts = 4
var _si = global.simpleVFX
var dr = m_drop
var _t = touchpad
var dw = dw_check()

if is_mobile() and !_t.f {
	ts = 6
	con = 2
}

if rfnt {
	load_langs()

	var cm = global.m_name[1]
	var loc = is_web() ? "" : working_directory
	var lm = [ $"{cm}_{tr_l("lang")}",strcopy(cm,1,strlen(cm) - strlen($"_{tr_l("lang")}"))]
	if f_exists($"{loc}{lm[0]}.ogg") {cm = lm[0]}
	else {
		if f_exists($"{loc}{lm[1]}.ogg") {cm = lm[1]}
	}

	var cd = [music_vol(,-1),music_pitch(,-1)]
	if cm != global.m_name[1] {music_play(cm,cd[0],cd[1])}
	
	rfnt = 0
}

if s {
	if menuScene > 2 and menuScene < 5 {
		timer[0]++

		if s > 1 {
			if !_si {dr = i_create(0,-10,depth - 2,m_drop)}
			else {
				if timer[0] % 3 == 0 {dr = i_create(0,-10,depth - 2,m_drop)}
			}

			if i_exists(dr) and (s = 2 or s = 3) {
				if dr.image_index = 0 {
					if s = 2 {dr.image_blend = merge_color(c_red, c_white, choose(0,0.5))}
					if s = 3 {dr.image_blend = choose(65535, 4235519, 255)}
					
					dr.image_index = 1
				}
			}
		}
		
		if menuScene = 3 or (menuScene = 4 and con) {
			var sy = 120
			
			if s = 1 {draw_cir((258 + cos(timer[0] / 18) * 6) * 2,(40 + sin(timer[0] / 18) * 6) * 2,(28 + sin(timer[0] / 6) * 4) * 2,,c_yellow)}

			if !(menuScene = 4 and con and l_check()) {
				draw_font(1)
				draw_col(c_gray)
				draw_txt((220 + sin(timer[0] / 12)) * 2,(sy + cos(timer[0] / 12)) * 2,tr($"se_{str_l(global.soul_name)}_{s - 1}"),2,-20)
			}
		}
	}
}

switch menuScene {
	#region TITLE SCREEN
		case 0:
			draw_rec(317,188,336,207,,#ED1C24)

			draw_font(-1)
			draw_col(c_white)
			draw_txt(48,177,tr("undeRtale"),1)

			timer[0]++
			if timer[0] >= 600 and !trigger[3] and spr_exists(a_index($"intro_{str_l(global.soul_name)}")) {room_goto(rm_intro)}

			var drawme = 0
			var drawtit = 1
			var n = str_u(global.soul_name)

			switch global.curCh {
				default:
					drawme = (timer[0] >= 60)
					if timer[0] = 60 {audio_play(UT_0)}
				break
			}
		
			if drawme {
				draw_set_halign(fa_center)
				
				if drawtit {
					draw_font(-1)
					draw_col(global.color[0])
					draw_txt(room_width,249,tr(n),1)
				}

				var z = [tr(get_key(global.bt[4,0])),tr(get_key(global.bt[4,1]))]
				
				draw_font(3)
				draw_col(c_gray)
				draw_txt(320,360,tr($"start_{con}",z[0],z[1]))
			}

			draw_set_halign(fa_left)

			var bt = z_pressed()
			if con = 1 {bt = any_pressed()}
			
			var unfcheck = 1
			var unfairs = [-1]

			if ar_contains(unfairs,global.curCh) {unfcheck = 2}

			if !trigger[1] {
				if !global.changeName {wrote += keyboard_lastchar}
				var wpos = strlen(wrote)
			
				if strchr(str_l(wrote),wpos) = strchr(str_l(global.name[0]),wpos) {
					if wpos >= strlen(global.name[0]) {
						global.hard = unfcheck

						audio_play(UT_1)
						trigger[1] = 1
					}
				}
				else {wrote = ""}
			
				keyboard_lastchar = ""
				
				trigger[2] = bt

				if x_pressed() and global.init {
					audio_free()
					audio_play(click,,,,,0.8)
					room_goto(rm_select)
				}
			}
			else {
				var _hard = "HARD MODE"
				if global.hard = 2 {_hard = "UNFAIR MODE"}

				draw_col(c_red)
				draw_font(1)
				draw_set_halign(fa_center)
				draw_txt(room_width,190,tr(_hard),5,20)
				draw_set_halign(fa_left)

				if !trigger[3] {
					if bt {
						a = dial_create()
						a.m = [tr("* WARNING: this mode will make &&  your life hell. Proceed anyway?&&         Yes         No")]

						choice_create(,a.depth - 5,a)
						trigger[3] = 1
					}
				}
				else {
					if global.choice > -1 {
						global.hard = unfcheck * !global.choice
						trigger[2] = 1
					}
				}
			}

			if trigger[2] {
				dial_destroy()
				menu_play()

				timer[0] = 0
				menuScene++
				for (var i = 0;i < arlen(trigger);i++) {trigger[i] = 0}
			}
		break
	#endregion

	#region MAIN MENU
		case 1:
			timer[0] = 0
		
			var shx = irnd_r(-2,2) * shakey
			var shy = irnd_r(-2,2) * shakey

			draw_set_halign(fa_center)

			var mo = $"{date_get_month(GM_build_date)}"
			var da = $"{date_get_day(GM_build_date)}"
			var ye = $"{date_get_year(GM_build_date)}"
			
			if mo < 10 {mo = $"0{mo}"}
			if da < 10 {da = $"0{da}"}

			var ut = $"UNDERTALE {str_u(global.soul_name)} {mo}/{da}/{ye}"

			draw_font(3)
			draw_col(c_gray)
			draw_txt(room_width - shx,464 - shy,ut)

			draw_font(1)

			var _sv = global.filename
			if global.hard = 2 {_sv = ""}

			if !f_exists(_sv) {
				draw_col(c_silver)
				draw_txt(room_width - (19 + (5 * l_check())) - shx,48 - shy,tr("--- Instruction ---"))
				draw_set_halign(fa_left)

				if !l_check() {
					for (var i = 0;i < 6;i++) {
						var is,is_0,is_1
						is = $"inst{i}"

						if i < 3 {
							is_0 = tr(get_key(global.bt[i + 4,0]))
							is_1 = tr(get_key(global.bt[i + 4,1]))
						}

						if i = 1 {is = $"inst1_{global.canRun}"}
						if i = 5 {
							is = $"inst5_{global.hard = 2}"
							if global.hard = 2 {draw_col(c_red)}
						}

						draw_txt(170 - shx,108 + (36 * i) - shy,tr(is,is_0,is_1))
					}
				}
				else {
					var _fu = [
						"かくてい",
						"キャンセル",
						"フィールドメニュー",
						"フルスクリーン",
						"しゅうりょう"
					]
					
					for (var i = 0;i < 5;i++) {
						var ke,kek
						ke[i] = ""
						ke[i + 3] = ""
						kek[i] = ""
						kek[i + 3] = ""
						
						if i < 3 {
							ke[i] = get_key(global.bt[i + 4,0])
							ke[i + 3] = get_key(global.bt[i + 4,1])
						
							ke[i] = strrep(ke[i],"Control","CTRL")
							ke[i + 3] = strrep(ke[i + 3],"Control","CTRL")
						
							kek[i] = tr_u(ke[i])
							kek[i + 3] = tr_u(ke[i + 3])
						}

						draw_txt(100 - shx,98 + (36 * i) - shy,tr($"inst{i}",kek[i],kek[i + 3]))
						draw_txt(322 - shx,98 + (36 * i) - shy,_fu[i])

						if global.hard = 2 {draw_col(c_red)}
						draw_txt(100 - shx,298 - shy,tr($"inst5_{global.hard = 2}"))
						draw_col(c_silver)
					}
				}

				for (var i = 0;i < 2;i++) {
					var _op = ["Begin Game","Settings"]
					draw_col(op = i ? c_yellow : c_white)
					draw_txt((170 - shx) - (2 * l_check()),352 + (40 * i) - shy,tr(_op[i]))
				}
			}
			else {
				draw_story()
				
				draw_set_halign(fa_left)
				draw_col(c_white)
				
				var tim,lv,rm,_tr
				
				tim = 0
				lv = 1
				rm = "--"
				_tr = 0
				
				ini_open(_sv)
					var sf = "savefile"

					tim = load_real("time",,sf)
					lv = load_real("lv",1,sf)
					rm = load_str("roomName",rm,sf)
					
					switch global.curCh {
						default:
							_tr = load_real("st_100",,sf)
						break
					}

					if global.changeName {global.pname = load_str("playerName","[EMPTY]",sf)}
				ini_close()

				var jx = 12 * l_check()

				draw_txt((140 - jx) + shx,132 + shy,draw_name(,9 - (3 * l_name())))
				draw_txt((300 - jx) + shx,132 + shy,$"{tr("LV")} {lv}")

				draw_set_halign(fa_right)
				draw_txt((500 + jx) + shx,132 + shy,draw_time(tim))
				draw_set_halign(fa_left)

				switch global.fntf {
					default:
						draw_txt(140 + shx,168 + shy,tr(rm))
					break
					
					case 1:
						draw_set_halign(fa_center)
						draw_txt(320 + shx,168 + shy,tr(rm))
						draw_set_halign(fa_left)
					break
				}

				var sox,soy
				var so = ["Continue","Settings",$"reset_{_tr}"]

				for (var i = 0;i < arlen(so);i++) {
					sox = 170 + (150 * i) - (80 * (i = 2))
					soy = 218 + (40 * (i % 2 == 1))
					var j_x = (-30 + (30 * (i > 0))) * l_check()

					if i = 1 {draw_set_halign(fa_center)}
					draw_col(op = i ? c_yellow : c_white)
					draw_txt((sox + shx) + j_x,soy + shy,tr(so[i]))

					draw_set_halign(fa_left)
				}
			}

			if can_select {
				if u_pressed() and op != 2 {op = 0}
				if d_pressed() {op = 1}

				if f_exists(_sv) {
					if r_pressed() or l_pressed() {
						if op = 1 {op = r_pressed() * 2}
						else {op = !op * 2}
					}
				}

				if z_pressed() {
					switch op {
						case 0:
							if !f_exists(_sv) {
								if global.changeName {menuScene++}
								else {begin_game()}
							}
							else {
								audio_free()
								load_all()
								for (var i = 0;i < arlen(global.hp);i++) {global.hp[i,dw] = global.maxhp[i,dw]}
								level_up()
								
								var r = a_index(global.curRoom)
								if r = -1 {r = rm_dogcheck}

								music_play(global.m_name[1])
								room_goto(r)
							}
						break

						case 1:
							check_season()
							menuScene = 3
						break
						
						case 2:
							if global.changeName {
								if !_tr {can_select = -1}
								else {global.pname = ""}
								menuScene = 2
							}
							else {begin_game()}
						break
					}

					if op != 2 {op = 0}
				}
			}
		break
	#endregion

	#region NAMING MENU
		case 2:
			var fan,a,ax,ay,row,delstr,sel,jx,jy

			fan = can_select ? "Name the fallen human." : ((can_select = -1) ? "A name has already\nbeen chosen." : "Is this name correct?")
			ax = 0
			ay = 0
			row = 0
			jx = (140 * l_check()) * (can_select > 0)
			jy = 0

			sel = [70,71,72]

			delstr = 0
			draw_font(1)

			switch can_select {
				case 1:
					timer[0] = 0
				
					for (var i = 0;i < 9;i++) {
						if op >= 7 * i {row = i}
					}

					if !l_check() {					
						for (var i = 0;i < 28;i++) {
							a[i] = chr(65 + i)
							if i > 25 {a[i] = ""}
							a[i + 28] = str_l(a[i])

							if ax > 6 {
								ax = 0
								ay++
							}

							draw_col(op = i ? c_yellow : c_white)
							draw_txt(120 + (64 * ax) + ceil(rnd_r(0.5,-0.5)),159 + (27 * ay) + ceil(rnd_r(0.5,-0.5)),a[i])

							draw_col(op = i + 28 ? c_yellow : c_white)
							draw_txt(120 + (64 * ax) + ceil(rnd_r(0.5,-0.5)),278 + (27 * ay) + ceil(rnd_r(0.5,-0.5)),a[i + 28])

							ax++
						}
					
						if r_pressed() {
							op++
						
							if op > (7 * (row + 1)) - 1 and row < 8 {op = 7 * row}
							if row = 3 and op > 25 {op = 21}
							if row = 7 and op > 53 {op = 49}
							if op > 72 {op = 70}
						}

						if l_pressed() {
							op--
						
							if op < (7 * row) and row < 8 {op = (7 * (row + 1)) - 1}
							if row = 3 and op > 25 {op = 25}
							if row = 7 and op > 53 {op = 53}
							if op = 69 {op = 72}
						}

						if d_pressed() {
							if op < 70 {
								op += 7

								if op = 26 or op = 27 {op += 7}

								if op > 53 {
									if op = 54 or op = 55 {op = 72}
									else {
										if op < 58 {op = 70}
										if op < 61 {op = 71}
									}
								}
							}
							else {
								if op = 70 {op = 0}
								if op = 71 {op = 2}
								if op = 72 {op = 5}
							}
						}
					
						if u_pressed() {
							if op < 54 {
								op -= 7

								if op = 26 or op = 27 {op -= 7}
								if op < -5 {op = 70}
								if op < -2 {op = 71}
								if op < 0 {op = 72}
							}
							else {
								if op = 70 {op = 49}
								if op = 71 {op = 51}
								if op = 72 {op = 47}
							}
						}

						for (var i = 0;i < 3;i++) {
							var oo = ["Quit","Backspace","Done"]

							var ox = 120 * i
							if i = 2 {ox = 320}

							draw_col(op = i + 70 ? c_yellow : c_white)
							draw_txt(120 + ox,408,tr(oo[i]))
						}
					}
					else {
						var j_l,cur_j,lim
					
						j_l = [
							"あいうえおまみむめもぁぃぅぇぉかきくけこや ゆ よがぎぐげごさしすせそらりるれろざじずぜぞたちつてとわをんー だぢづでどなにぬねのゃゅょっゎばびぶべぼはひふへほ     ぱぴぷぺぽ",
							"アイウエオマミムメモァィゥェォカキクケコヤ ユ ヨガギグゲゴサシスセソラリルレロザジズゼゾタチツテトワヲンー ダヂヅデドナニヌネノャュョッヮバビブベボハヒフヘホヵヶヴ  パピプペポ",
							"ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"
						]

						cur_j = trigger[0]
						lim = (cur_j = 2) ? 9 : 15
					
						ax = 0
						ay = 0
					
						j_x = 0
						var j_y = 0
					
						for (var i = 0;i < 7;i++) {
							if op >= lim * i {row = i}
						}
					
						for (var i = 0;i < strlen(j_l[cur_j]);i++) {
							a[i] = strchr(j_l[cur_j],i + 1)

							if ax = lim {
								ax = 0
								ay++
							}
						
							var axx = 64
							var sep = 32

							if cur_j < 2 {
								if ax > 4 {axx += 16}
								if ax > 9 {axx += 16}
							}
							else {
								axx = 120
								sep = 46
							}

							draw_col(op = i ? c_yellow : c_white)
							draw_txt((axx + (sep * ax)) + ceil(rnd_r(0.5,-0.5)),(144 + (32 * ay)) + ceil(rnd_r(0.5,-0.5)),a[i])

							ax++
						}
					
						for (var i = 0;i < 3;i++) {
							var _o,ox
						
							_o = [
								["ひらがな","カタカナ","アルファベット"],
								["やめる","さくじょ","かくてい"]
							]
						
							ox = [
								[0,172,340],
								[0,140,300]
							]

							draw_col(op = i + 110 ? c_yellow : c_white)
							draw_txt(64 + ox[0,i],352,_o[0,i])
						
							draw_col(op = i + 120 ? c_yellow : c_white)
							draw_txt(110 + ox[1,i],416,_o[1,i])
						}
						
						if op < 110 {
							if r_pressed() {
								op++

								if cur_j < 2 {
									if op = 21 or op = 23 or op = 54 {op++}
									if op = 80 + (3 * cur_j) {op = 85}
								}
								else {
									if op = 26 or op = 53 {op++}
								}
						
								if op > (lim * (row + 1)) - 1 {op = lim * row}
							}
					
							if l_pressed() {
								op--

								if op < lim * row {op = (lim * (row + 1)) - 1}
						
								if cur_j < 2 {
									if op = 21 or op = 23 or op = 54 {op--}
									if op = 84 {op -= 5 - (3 * cur_j)}
								}
								else {
									if op = 26 or op = 53 {op--}
								}
							}
							
							if u_pressed() {
								op -= lim
							
								if cur_j < 2 {
									if op = 21 or op = 23 or op = 54 {op -= lim}
								
									if !op {
										if op < -10 {op = 120} 
										if op < -5 {op = 121}
										if op < 0 {op = 122}
									}
								}
								else {
									if op = 26 {op -= lim}
								
									if !op {
										if op < -7 {op = 120} 
										if op < -3 {op = 121}
										if op < 0 {op = 122}
									}
								}
							}
					
							if d_pressed() {
								op += lim

								if cur_j < 2 {
									if op = 21 or op = 23 or op = 54 or (op > 79 + (3 * cur_j) and op < 85) {op += lim}
								
									if op >= 100 {op = 112}
									if op >= 95 and op < 100 {op = 111}
									if op >= 90 and op < 95 {op = 110}
								}
								else {
									if op = 26 or op = 53 {op += lim}
								
									if op >= 60 {op = 112}
									if op >= 56 and op < 60 {op = 111}
									if op >= 54 and op < 56 {op = 110}
								}
							}
						}
						else {
							if r_pressed() {
								op++

								if op = 113 {op = 110}
								if op = 123 {op = 122}
							}
							
							if l_pressed() {
								op--
							
								if op = 109 {op = 112}
								if op = 119 {op = 122}
							}
						
							if d_pressed() {
								if op = 110 or op = 111 or op = 112 {op += 10}
								else {
									if op = 120 {op = 0}
									if op = 121 {op = 2 + (3 * (cur_j < 2))}
									if op = 122 {op = 10 - (4 * (cur_j = 2))}
								}
							}
							
							if u_pressed() {
								if op >= 120 {op -= 10}
								else {
									if cur_j < 2 {
										if op = 110 {op = 75}
										if op = 111 {op = 80 - (lim * !cur_j)}
										if op = 112 {op = 85}
									}
									else {
										if op = 110 {op = 45}
										if op = 111 {op = 47}
										if op = 112 {op = 51}
									}
								}
							}
						}
					
						if cur_j < 2 {
							if op = 95 {op = 110}
							if op = 96 {op = 111}
							if op = 97 {op = 112}
						}
					
						for (var i = 0;i < 3;i++) {sel[i] += 50}

						j_x = -136
						j_y = -24
					}

					var _str = ""

					if op < arlen(a) {_str = strchr(a[op],1)}

					if z_pressed() {
						switch op {
							default:
								if strlen(global.pname) = 6 {global.pname = strdel(global.pname,6,1)}
								global.pname += _str
							break
							
							case sel[0]:
								op = 0
								menuScene = 1
							break
							
							case sel[1]:
								delstr = 1
							break
							
							case sel[2]:
								if strlen(global.pname) {
									can_select = 0
									op = 0
								}
							break
						
							case 110:
								trigger[0] = 0
							break
						
							case 111:
								trigger[0] = 1
							break
						
							case 112:
								trigger[0] = 2
							break
						}
					}

					if x_pressed() {delstr = 1}

					if delstr {
						if !strlen(global.pname) {
							op = 0
							menuScene = 1
						}
						else {global.pname = strdel(global.pname,strlen(global.pname),1)}
					}
				break
				
				case -1:
				case 0:
					var chars,char,nochars,no
					no = 0
					char = ["",""]

					chars = ["Toriel"]
					nochars = ["toriel"]

					for (var i = 0;i < arlen(chars);i++) {
						if str_l(global.pname) = str_l(chars[i]) or (l_check() and global.pname = tr(chars[i])) {
							char[0] = str_l(chars[i])
							char[1] = tr(chars[i])
						}
					}

					var h = str_l(global.name[0])
					var h2 = tr(global.name[0])

					switch str_l(global.pname) {
						case h2:
						case h:
							fan = "WARNING: this name will\nmake your life hell.\nProceed anyway?"
						break

						case char[1]:
						case char[0]:
							fan = $"{char[0]}_fun"
							if ar_contains(nochars,char[0]) or ar_contains(nochars,char[1]) {no = 1}
						break
					}

					if !i_exists(white_fade) {
						for (var i = 0;i < 2;i++) {
							var o = ["No","Yes"]
							if no {o = ["Go Back",""]}

							draw_col(op ? c_white : c_yellow)
							draw_txt(116 + (2 * l_check()),408,tr(o[0]))
						
							draw_col(op ? c_yellow : c_white)
							draw_txt(430 + (22 * l_check()),408,tr(o[1]))
						}

						if l_pressed() or r_pressed() {op = !op * !no}

						if z_pressed() {
							switch op {
								case 0:
									if can_select != -1 {
										op = 72 + (50 * l_check())
										can_select = 1
									}
									else {
										op = 2
										menuScene = 1
										can_select = 1
									}
								break

								case 1:
									begin_game()
								break
							}
						}
					}
					else {fan = ""}

					timer[0]++

					if timer[0] > 120 {timer[0] = 120}
				break
			}
			
			var wd = tr_l("gaster")

			switch str_l(global.pname) {
				case "ガスター":
				case "がすたー":
				case "gaster":
				case wd:
					game_restart()
				break
			}
			
			if c_pressed() and global.debug {global.pname = tr(global.name[0])}
			
			var s_x,s_y,s_c,s_a,s_xx,s_yy

			s_xx = l_check() ? timer[0] * 1.45 : timer[0] / 15
			s_yy = l_check() ? timer[0] * 1.105 : timer[0]

			s_x = (rnd_r(1,-1) - s_xx) * (timer[0] > 0)
			s_y = (rnd_r(1,-1) + s_yy) * (timer[0] > 0)
			s_c = 2 + (timer[0] / 25)
			s_a = rnd_r(timer[0] / 120,-(timer[0] / 120))

			draw_col(c_white)
			draw_txt(180 - jx,68 - jy,tr(fan),,,16 + (2 * l_check()))
			draw_txt((280 + s_x) - (44 * l_name()),(118 + s_y) - (18 * l_name()),draw_name(,6),s_c,s_a)
		break
	#endregion

	#region SETTINGS MENU
		case 3:
			draw_font(1)
			draw_col(c_white)

			if s != 1 {draw_set_halign(fa_center)}
			draw_txt(room_width - (300 * (s = 1)),36,tr_u("Settings"),4)
			draw_set_halign(fa_left)
			
			var o = [
				tr($"op_{global.simpleVFX}"),
				tr($"op_{global.autoRUN}"),
				tr($"op_{global.lmode}"),
				$"{round(global.s_vol * 100)}%",
				$"{round(global.m_vol * 100)}%",
				tr("lang"),
				"@!%&"
			]

			if b.cur_b < 4 {o[6] = tr($"b_{b.cur_b}")}
			else {
				o[6] = tr($"b_{str_l(global.soul_name)}_{b.cur_b}")
				if b.cur_b > b.max_b {o[6] = tr($"b_{str_l(global.soul_name)}_ex_{b.cur_b - b.max_ex}")}
			}

			var list = $"{working_directory}lang/langList.ini"
			
			ini_open(list)
				var l = 1
				
				for (var i = 0;i < l;i++) {
					if ikey_exists("list",$"{i}") {l++}
				}
			ini_close()

			for (var i = 0;i < 9;i++) {
				var sp = 30 * i

				if i = 2 and !global.canRun {
					i++
					continue
				}

				if i = 3 and !global.hasLmode {
					i++
					continue
				}

				l = ["en"]

				if f_exists(list) {
					ini_open(list)
						var f = 1
		
						for (var i2 = 0;i2 < f;i2++) {
							if ikey_exists("list",$"{i2}") {
								l[i2] = load_str($"{i2}",,"list")
								f++
							}
						}
					ini_close()
				}
				else {print($"{list} Doesn't exist!")}
				
				var noLang = (arlen(l) <= 1)

				var sep = 30

				if i {sp += sep}
				if i > 3 {
					sp += sep

					if !global.canRun {sp -= 30}
					if !global.hasLmode {sp -= 30}
				}
				if i > 5 {
					sp += sep

					if noLang {sp -= 30}
				}

				var st = $"set_{i}"
				if i = 8 {st = $"set_8_{con}"}
				if i = 6 and noLang {
					st = ""
					o[5] = ""
				}

				draw_col(op = i ? (i = 3 ? global.color[0] : c_yellow) : c_white)
				draw_txt(40,88 + sp,tr(st))

				if i < 8 and i {
					draw_set_halign(fa_right)
					draw_txt(360,88 + sp,o[i - 1])
					draw_set_halign(fa_left)
				}
			}

			if can_select {
				if d_pressed() and op < 8 {
					if op != 1 {op++}
					else {op += 1 + !global.canRun + !global.hasLmode}
					
					if op = 6 and noLang {op++}
				}
				
				if u_pressed() and op {
					if op != 4 {op--}
					else {op -= 1 + !global.hasLmode + !global.canRun}
					
					if op = 6 and noLang {op--}
				}
				
				if z_pressed() and !op {
					if s {menu_play()}
					destroy(m_drop)

					timer[0] = 0
					menuScene = 1
				}

				if l_pressed() or r_pressed() or z_pressed() {
					switch op {
						case 1:
							global.simpleVFX = !global.simpleVFX

							ini_open(_c)
								save_file(global.simpleVFX,"simpleVFX",,,_c)
							ini_close()
						break
						
						case 2:
							global.autoRUN = !global.autoRUN

							ini_open(_c)
								save_file(global.autoRUN,"arun",,,_c)
							ini_close()
						break
						
						case 3:
							global.lmode = !global.lmode

							ini_open(global.soulfile)
								save_file(global.lmode,"lmode",,,str_l(global.soul_name))
							ini_close()
						
							lmode_ef()
						break
						
						case 7:
							b.cur_b -= l_pressed() - (r_pressed() or z_pressed())
							
							if b.cur_b > b.max_ex {b.cur_b = 0}
							if b.cur_b < 0 {b.cur_b = b.max_ex}

							_c = global.soulfile
							
							ini_open(_c)
								save_file(b.cur_b,"b",,,str_l(global.soul_name))
							ini_close()
							
							_c = "config.ini"
						break
					}
				}
				
				var vol = l_hold() or r_hold() or z_hold()

				if x_hold() {vol = l_pressed() or r_pressed()}
				
				if vol {
					if op = 4 {
						global.s_vol -= 0.01 * (l_hold() - (r_hold() or z_hold()))
						if global.s_vol > 1 {global.s_vol = 1}
						if global.s_vol <= 0 {global.s_vol = 0}

						audio_play(click)
						
						ini_open(_c)
							save_file(global.s_vol,"s_vol",1,,_c)
						ini_close()
					}
					
					if op = 5 {
						global.m_vol -= 0.01 * (l_hold() - (r_hold() or z_hold()))
						if global.m_vol > 1 {global.m_vol = 1}
						if global.m_vol <= 0 {global.m_vol = 0}

						music_vol()

						ini_open(_c)
							save_file(global.m_vol,"m_vol",1,,_c)
						ini_close()
					}
				}

				if op = 6 {
					if r_pressed() or l_pressed() or z_pressed() {
						global.lang += ((r_pressed() or z_pressed()) - l_pressed())
						rfnt = 1

						ini_open(_c)
							save_file(global.lang,"lang",d_lang(),,_c)
						ini_close()
					}
				}

				if op = 8 and z_pressed() {
					op = 0
					menuScene = ts
					if ts = 6 {destroy(m_drop)}
				}
			}

			if op = 4 or op = 5 {
				draw_set_halign(fa_center)

				draw_col(c_gray)
				draw_font(3 * !l_check())
				draw_txt(room_width,464,tr("holdx",str_u(get_key(global.bt[5,0])),str_u(get_key(global.bt[5,1]))),2 - l_check())

				draw_set_halign(fa_left)
			}

			if int {
				int += 8

				draw_col(c_black)
				draw_rec(-1,-1,room_width - int,481)
				draw_rec(room_width + int,-1,641,481)

				if int >= 340 {
					season_play()

					can_select = 1
					int = 0
				}
			}
		break
	#endregion

	#region KEYBOARD/CONTROLLER SETTINGS
		case 4:
			draw_font(1)
			draw_col(c_white)
			
			if ts = 6 {
				delay = 1
				menuScene = 6
				destroy(m_drop)
			}

			if s != 1 {draw_set_halign(fa_center)}
			
			var swid = 4 - (0.8 * l_check("BR"))

			draw_txt((room_width - (300 * (s = 1))) + ((28 * l_check()) * con),36,tr($"set_8_{con}"),[swid,4])
			draw_set_halign(fa_left)
			
			var _k

			switch con {
				#region KEYBOARD
					default:
						_k = [
							"EXIT",
							"DOWN",
							"RIGHT",
							"UP",
							"LEFT",
							"CONFIRM",
							"CANCEL",
							"MENU",
							"RESET TO DEFAULT",
							"CONTROL TEST"
						]

						var _a = [cg_r(global.color[0]),cg_g(global.color[0]),cg_b(global.color[0])]
			
						for (var i = 0;i < 3;i++) {
							if _a[i] < 128 {_a[i] = 0}
							else {_a[i] = 255}
						}
			
						if _a[0] = 255 and _a[1] = 255 and _a[2] = 255 {
							_a[1] = 0
							_a[2] = 0
						}

						var a_col = make_rgb(,[_a[0],_a[1],_a[2]])
						
						for (var i = 0;i < arlen(_k);i++) {
							draw_col(op = i ? (can_select ? c_yellow : a_col) : c_white)
				
							var sp = 30 * i
							if i {sp += 30}
							if i >= 8 {sp += 30}

							if !(i = 8 and timer[3] > 0) {draw_txt(40,88 + sp,tr(_k[i]))}

							if i < 8 {
								var _kk
					
								for (var o = 0;o < 2;o++) {
									draw_col(c_white)
									
									if op and op < 8 {
										if can_select = o + 1 {draw_col(c_yellow)}
										if can_select = -(o + 1) {draw_col(a_col)}
									}

									_kk[0,o] = tr($"MAP {chr(65 + o)}")
						
									if i {
										draw_col(c_white)

										if op = i {
											if can_select = o + 1 {draw_col(c_yellow)}
											if can_select = -(o + 1) {draw_col(a_col)}
										}
										_kk[i,o] = get_key(global.bt[i - 1,o])
									}

									draw_set_halign(fa_right)
									draw_txt(429 + (168 * o),88 + sp,_kk[i,o])
									draw_set_halign(fa_left)
								}
							}
						}
			
						if can_select {
							if d_pressed() and op < 9 {op++}
							if u_pressed() and op {op--}
			
							if op and op < 8 {
								if l_pressed() or r_pressed() {can_select = (can_select < 2) + 1}
								if z_pressed() {can_select = -can_select}
							}
						}
						else {
							if any_pressed() {
								var o,map,_d,d_ch
								o = op - 1
								map = abs(can_select) - 1

								_d[0,0] = vk_down
								_d[0,1] = ord("S")

								_d[1,0] = vk_right
								_d[1,1] = ord("D")
	
								_d[2,0] = vk_up
								_d[2,1] = ord("W")
	
								_d[3,0] = vk_left
								_d[3,1] = ord("A")

								_d[4,0] = ord("Z")
								_d[4,1] = vk_enter
	
								_d[5,0] = ord("X")
								_d[5,1] = vk_shift
	
								_d[6,0] = ord("C")
								_d[6,1] = vk_control

								for (var i = 0;i < 7;i++) {
									if key_map(keyboard_lastkey) = global.bt[i,map] {global.bt[i,map] = global.bt[o,map]}
								}

								global.bt[o,map] = key_map(keyboard_lastkey)

								d_ch = key_map(_d[o,map])
					
								ini_open(_c)
									if key_map(keyboard_lastkey) != d_ch {save_real(_c,$"k_{o}_{map}",key_map(keyboard_lastkey))}
									else {ikey_delete(_c,$"k_{o}_{map}")}
								ini_close()

								can_select = -can_select
							}
						}
					break
				#endregion
				
				#region CONTROLLER
					case 1:
						_k = [
							"EXIT",
							"joy_0",
							"joy_1",
							"joy_2",
							"ANALOG SENSITIVITY:",
							"ANALOG SENSITIVITY SENSITIVITY:",
							"dch",
							"RESET TO DEFAULT",
							"CONTROL TEST"
						]

						var _b,ax,ay
				
						ax = 0
						ay = 0

						for (var o = 0;o < 3;o++) {
							for (var p = 0;p < 2;p++) {
								_b[o,p] = str_u(get_key(global.bt[4 + o,p]))
								_b[o,p] = strrep(_b[o,p],"CONTROL","CTRL")
							}
						}
				
						for (var i = 0;i < arlen(_k);i++) {
							var sp = 30 * i
							var sc = 2
							var bb = 0

							if i {
								sp += 40

								if i < 4 {bb = i - 1}
							}
							if i >= 4 {sp += 30}
							if i >= 6 {sp += 10}

							if i = 5 {sc = 1.2 + (0.2 * l_check())}
							if i = 6 {_b[bb,0] = tr($"dir_{gpad.dch}")}

							draw_col(op = i ? c_yellow : c_white)

							if l_check() and i {
								ax = 0
								ay = 0

								if i = 2 or i = 5 or i = 7 {ay = 2}
								if i = 3 or i = 8 {ay = 4}
							}

							if !(i = 7 and timer[3] > 0) {
								draw_txt(40 + ax,(88 + sp) + ay,tr(_k[i],_b[bb,0],_b[bb,1]),[sc,2])
								if i = 6 and l_check() {draw_txt(200,(88 + sp) + ay,tr($"dir_{gpad.dch}"),[sc,2])}
							}
						}
				
						ax = 0
						ay = 0
				
						for (var i = 0;i < 3;i++) {
							var bp,bnp

							for (var o = 0;o < 2;o++) {
								_b[i,o] = str_u(get_key(global.bt[4 + i,o]))
								_b[i,o] = strrep(_b[i,o],"CONTROL","CTRL")
							}

							var spa,te
							te[i] = tr(_k[i + 1],_b[i,0],_b[i,1])
							spa[i] = strlen(te[i]) - round(2.5 * i)

							bp[i] = 40 + round(spa[i] * 12.5)
							if l_check() and i {ay = 2 * i}

							draw_col(i_col(global.color[0]))
							draw_txt(ar_high(bp) + ax,(158 + (30 * i)) + ay,str(gpad.bt[i] - 32768))
						}

						var _o = op - (1 * (op > 0))
				
						for (var i = 0;i < 2;i++) {
							var c = c_red
							if i {c = c_green}
					
							var hl
							hl[i] = can_select = (i + 5)

							draw_spr(p_slide,0,302 - (44 * l_check()),280 + (30 * i) + (2 * i * l_check()),2,,c,0.6 + hl[i])

							var _s
							_s[i] = 298 + ((gpad.sens[i] * 2) * ((i + 1) * 100))

							draw_rec((-2 + _s[i]) - (44 * l_check()),276 + (30 * i) + (2 * i * l_check()),(1 + _s[i]) - (44 * l_check()),295 + (30 * i) + (2 * i * l_check()),,c_yellow,0.6 + hl[i])
						}
				
						if can_select = 1 {
							if u_pressed() and op {op--}
							if d_pressed() and op < 8 {op++}
					
							if z_pressed() and op < 6 {
								if op {
									trigger[_o] = 1
									can_select = op + 1
									delay = 1
								}
								else {
									for (var i = 0;i < arlen(trigger);i++) {trigger[i] = 0}
								}
							}
						}

						var g = gpad
						var gg = g._gpad
				
						switch op {
							case 1:
							case 2:
							case 3:
								if trigger[_o] {
									draw_col(c_blue)
									var but = "(PUSH BUTTON)"
						
									var rx = (bp[_o] - 18) - (2 * l_check())
									var pt = !l_check() ? ($"{tr(but)} ") : but

									draw_rec(rx,152 + (30 * _o),rx + (str_w(pt) * 2),181 + (30 * _o),,c_blue)
									
									timer[2]++
									timer[2] %= 16

									if timer[2] <= 8 {
										draw_col(c_white)
										draw_txt(rx,(158 + (30 * _o)) + (2 * l_check()),pt)
									}

									var dbutt = [gp_face1,gp_face2,gp_face4]

									for (var i = gp_face1;i < gp_extra6;i++) {
										if gp_pressed(gg,i) and !delay {
											g.bt[_o] = i
											trigger[_o] = 0
											can_select = 1

											ini_open(_c)
												save_file(g.bt[_o],$"bt_{_o}",dbutt[_o],,_c)
											ini_close()
										}
									}
								}
							break
					
							case 4:
							case 5:
								var o_ = op - 4

								if can_select > 1 {
									if l_hold() or r_hold() {
										var dsens = [0.15,0.01]

										if !o_ {g.sens[0] -= (l_hold() - r_hold()) * g.sens[1]}
										else {g.sens[1] -= (l_hold() - r_hold()) * 0.01}
						
										var ha = 1 + o_

										if g.sens[o_] >= 0.4 / ha {g.sens[o_] = 0.4 / ha}
										if g.sens[o_] <= 0.02 / ha {g.sens[o_] = 0.02 / ha}
								
										g.sens[2] = g.sens[0] * 0.5
								
										if on_controller() and os_type != os_linux {gamepad_set_axis_deadzone(g.gpads,g.sens[0])}

										ini_open(_c)
											save_file(g.sens[o_],$"bs_{o_}",dsens[o_],,_c)
										ini_close()
									}

									if (z_pressed() and !delay) or x_pressed() {
										trigger[_o] = 0
										can_select = 1
									}
								}
							break

							case 6:
								if z_pressed() {
									g.dch++
									if g.dch > 2 {g.dch = 0}

									ini_open(_c)
										save_file(g.dch,"dc",,,_c)
									ini_close()
								}
							break
						}
					break
				#endregion
			}

			var _lk = arlen(_k) - 1
			var llk = _lk - 1

			if timer[3] > 0 {
				draw_txt_color(40,388 - (10 * con),tr(trigger[6]),,,c_red,(1 - (10 - timer[3]) / 10))
				timer[3]--
			}

			if z_pressed() {
				switch op {
					case 0:
						menuScene--
					break
					
					case llk:
						var spag = irnd(50)
						trigger[6] = (spag = 1) ? "SPAGHETTI..." : "RESETTED..."
					
						timer[3] = 15
						if !con {reset_keys()}
						else {reset_gpad()}
						
						if f_exists(_c) {
							ini_open(_c)
								if !on_controller() {
									for (var i = 0;i < 7;i++) {
										for (var o = 0;o < 2;o++) {ikey_delete(_c,$"k_{i}_{o}")}
									}
								}
								else {
									for (var i = 0;i < 3;i++) {ikey_delete(_c,$"bt_{i}")}
									for (var i = 0;i < 2;i++) {ikey_delete(_c,$"bs_{i}")}
									
									ikey_delete(_c,"dc")
								}
							ini_close()
						}
					break
					
					case _lk:
						audio_free()
						destroy(m_drop)
						menuScene = 5
						op = 0
						sprite_index = no_spr
						image_xscale = 1
						image_yscale = 1
						image_speed = 0
						image_index = 0
						x = 290
						y = 298
						for (var i = 0;i < arlen(timer);i++) {timer[i] = 0}
					break
				}
			}
		break
	#endregion
	
	#region CONTROL TEST
		case 5:
			var _bt = [z_pressed(),x_pressed(),c_pressed()]
			var _bth = [z_hold(),x_hold(),c_hold()]

			var _str = 0
			var newspr = p_test
			
			draw_col(#FF4040)
			draw_font(8)
			draw_txt(278,412,tr_u("exit"))
			draw_sprite_part_ext(arrow,0,0,2,7,9,308,450,2,2,#FF4040,1)
			
			if sprite_index = no_spr {sprite_index = p_test}
			else {
				var _sp = 6 + (4 * (x_hold() * global.canRun))

				x += (r_hold() - l_hold()) * _sp
				y += (d_hold() - u_hold()) * _sp

				x = clamp(x,121,521 - sprite_width)
				y = clamp(y,281,800)
			}
			
			draw_spr()

			for (var i = 0;i < 3;i++) {
				var bty,btc
				bty[i] = 0
				btc[i] = #BD26CA
				
				if _bt[i] {
					var be = a_index($"beat_{i}")
					
					audio_play(be,,,_str)
					timer[i] = 4
					timer[4] = 0
				}
				
				if timer[i] {
					timer[4] = 0
					
					if _str {

					}

					timer[i]--
					if _bth[i] and timer[i] <= 2 {timer[i] = 2}

					switch timer[i] {
						case 3:
							bty[i] = 20
							btc[i] = c_white
						break
						
						case 2:
							bty[i] = 16
							btc[i] = #FFD737
						break
					}
				}
				else {
					if !timer[0] and !timer[1] and !timer[2] {
						timer[4]++
					
						if timer[4] >= 80 {
							sprite_index = newspr
							image_index = 0
						}
					}
				}

				draw_spr(p_butts,0,164 + (120 * i),96,4,,#BD26CA)
				draw_spr(p_butts,0,164 + (120 * i),72 + bty[i],4,,#E6598A)
				draw_spr(p_butts,i + 1,164 + (120 * i),72 + bty[i],4,,btc[i])

				draw_col(#BD26CA)
				
				if i = 0 and !timer[0] {
					draw_rec(188,92,191,95)
					draw_rec(220,140,223,143)
				}
				
				if i = 1 and !timer[1] {
					draw_rec(308,104,311,107)
					draw_rec(340,104,343,107)
					draw_rec(308,128,311,131)
					draw_rec(340,128,343,131)
				}
			}

			for (var rec = 0;rec < 6;rec++) {draw_rec(112 + (2 * rec),272 + (2 * rec),530 - (2 * rec),699,1,c_white)}
		
			if y >= 480 {
				if !s {menu_play()}
				else {season_play()}

				menuScene = ts
				for (var i = 0;i < arlen(timer);i++) {timer[i] = 0}
			}
		break
	#endregion
	
	#region TOUCHPAD SETTINGS
		case 6:
			var fin = tr("Finish")

			if _t.f {
				delay = 1
				menuScene = 4
			}

			draw_font(1)
			draw_col(c_white)
			draw_txt(78,24,tr("Drag sliders to adjust touch controls:"))
			draw_rec(16,114,624,120)

			var mx = []
			var _x = []

			for (var i = 0;i < 2;i++) {
				_x[0] = 16 + (358 * i)
				mx[i] = m_rec(_x[0] - 10,100,(_x[0] + 246) + 10,131)
				
				if mx[i] and m_hold(mb_left) {					
					_t.set[i] = clamp((device_mouse_x_to_gui(0) - _x[0])	/ 246,0,1)
					if _t.set[i] > 1 {_t.set[i] = 1}
					if _t.set[i] < 0 {_t.set[i] = 0}

					ini_open(_c)
						save_file(_t.set[i],$"ts{i}",0.25 * (i + 1),,_c)
					ini_close()
				}

				_x[1] = _x[0] + (246 * _t.set[i])
				if _x[1] >= 261 + (358 * i) {_x[1] = 261 + (358 * i)}
				
				draw_rec(_x[1],100,_x[1] + 5,131)
			}

			draw_col(c_gray)
			draw_set_halign(fa_center)
			draw_txt(141,72,tr("SIDE DISTANCE"))
			draw_txt(499,72,tr("SCALE"))
			draw_txt(room_width + 1,228,tr("(Or, press any button on a keyboard or controller.)"),1)

			var _x = [(room_width - (10.33333333 * strlen(fin))) - 2,0]
			_x[1] = (_x[0] + (20.66666667 * strlen(fin))) + 4
			mx[2] = m_rec(_x[0],164,_x[1],212)
			var col = 128 * (mx[2] * m_hold(mb_left))

			draw_b(_x[0],164,_x[1],212,,make_rgb(c_black,,[col,col,col]),2)

			if mx[2] and m_released(mb_left) {
				delay = 1
				menuScene = 3
				audio_play(select_1)
				
				if global.init = -1 {
					global.init = 0
					warp_check()
				}
			}

			draw_col(c_white)
			draw_txt(room_width,180,fin)
			draw_set_halign(fa_left)

			draw_col(c_black)
			draw_rec(267,112,373,122)
			draw_rec(-4,-4,644,484,,,shakey)

			shakey -= 0.075
			if shakey < 0 {shakey = 0}
			
			if any_pressed() {
				delay = 45
				menuScene = 6.5
			}
		break
		
		case 6.5:
			draw_col(c_yellow)
			draw_font(1)
			draw_set_halign(fa_center)
			draw_txt(room_width,72,tr("Press another button to switch to\nkeyboard/controller controls."))
			draw_set_halign(fa_left)

			if delay <= 0 {
				delay = 0
				menuScene = 6
			}

			if any_pressed() {
				delay = 1
				touchpad.f = 1
				menuScene = 4
				audio_play(lv_plus)

				if global.init = -1 {
					global.init = 0
					warp_check()
				}
			}
		break
	#endregion
}

if delay > 0 {delay -= 0.5}
if shakey > 0 {shakey += 0.02}

function menu_play() {
	audio_free()
	
	var prog = 0
	music_play($"menu_{prog}",,1)
}

function begin_game() {
	shakey = 0.02 * !global.simpleVFX
	can_select = 0
	
	audio_free()
	audio_play(intro_fade,,,0.8,,0.95)

	var rm = [rm_hole0]
	var i = clamp(global.curCh,0,arlen(rm) - 1)

	_f = i_create(0,0,depth - 2,white_fade)
	_f.map = rm[i]
	_f.style = 3 * (op > 0) * !(global.hard = 2)

	global.fun = irnd(100) + 1
}

function check_season() {
	int = 0
	s = 0

	var _c = "config.ini"
		
	if f_exists(_c) {
		ini_open(_c)
			s = load_real("season",s,_c)
		ini_close()
	}

	if s {
		var _m = current_month
		
		if _m < 12 {s = 4}
		if _m < 9 {s = 3}
		if _m < 6 {s = 2}
		if _m < 3 {s = 1}

		if f_exists(_c) {
			ini_open(_c)
				s = load_real("season",s,_c)
			ini_close()
		}

		can_select = 0
		audio_free()
		music_play("harpnoise",,1,0)
		int = 16
	}
}

function season_play() {
	var _s = "fall"

	if s = 4 {_s = "winter"}
	if s = 1 {_s = "summer"}

	audio_free()
	music_play($"options_{_s}",,1)
}

function draw_story() {
	var shx = irnd_r(-2,2) * shakey
	var shy = irnd_r(-2,2) * shakey
	
	switch global.curCh {
		default:
			draw_spr(rm_hole,1,160 + shx,360 + shy,2)
			draw_spr(rm_hole,1,480 + shx,360 + shy,[-2,2])
			draw_spr(rdoor,1,206 + shx,-66 + shy,2)
			
		break
	}
}