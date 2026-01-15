var _c = "config.ini"
var b = border
var con = on_controller()

if s {
	if menuScene > 2 and menuScene < 5 {
		timer[0]++
				
		if s > 1 {
			dr = i_create(0,-10,depth - 2,m_drop)

			if s = 2 or s = 3 {
				dr.image_index = 1
						
				if s = 2 {dr.image_blend = merge_color(c_red, c_white, choose(0,0.5))}
				if s = 3 {dr.image_blend = choose(65535, 4235519, 255)}
			}
		}
		
		if menuScene = 3 or (menuScene = 4 and on_controller()) {
			var sy = 120
			
			if s = 1 {
				draw_set_color(c_yellow)
				draw_circle((258 + cos(timer[0] / 18) * 6) * 2,(40 + sin(timer[0] / 18) * 6) * 2,(28 + sin(timer[0] / 6) * 4) * 2,0)
			}

			if !(menuScene = 4 and on_controller and l_check()) {
				draw_font(1)
				draw_set_color(c_gray)
				draw_txt_transformed(((220 + sin(timer[0] / 12)) * 2) - (4 * l_check()),((sy + cos(timer[0] / 12)) * 2) - (4 * l_check()),text("se_" + string_lower(global.soul_name) + "_" + string(s - 1)),2,2,-20)
			}
		}
	}
}

switch menuScene {
	#region TITLE SCREEN
		case 0:
			draw_set_color(#ED1C24)
			draw_rectangle(317,188,336,207,0)

			draw_font(6)
			draw_set_color(c_white)
			draw_txt(48,177,text("undeRtale"),1,1)

			timer[0]++
			if timer[0] >= 600 and !trigger[3] {room_goto(rm_intro)}

			var drawme = 0
			var drawtit = 1
			var n = string_upper(global.soul_name)

			switch global.curCh {
				default:
					drawme = (timer[0] >= 60)
					if timer[0] = 60 {audio_play(UT_0)}
				break
			}
		
			if drawme {
				draw_set_halign(fa_center)
				
				if drawtit {
					draw_font(6)
					draw_set_color(global.color[0])
					draw_txt(room_width,249,text(n),1,1)
				}

				var z
				z[0] = text(get_key(global.bt[4,0]))
				z[1] = text(get_key(global.bt[4,1]))
				
				draw_font(3)
				draw_set_color(c_gray)
				draw_txt(320,360,text("start_" + string(con),z[0],z[1]))
			}
			
			draw_set_halign(fa_left)

			var bt = z_pressed()
			if con {bt = any_pressed()}
			
			var unfcheck = 1
			var unfairs = [1]

			if !trigger[1] {
				if !global.changeName {wrote += keyboard_lastchar}
				var wpos = string_length(wrote)
			
				if string_char_at(string_lower(wrote),wpos) = string_char_at(string_lower(global.name[0]),wpos) {
					if wpos >= string_length(global.name[0]) {
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
				
				draw_set_color(c_red)
				draw_font(1)
				draw_set_halign(fa_center)
				draw_txt(room_width,190,text(_hard),5,5,20)
				draw_set_halign(fa_left)

				if !trigger[3] {
					if bt {
						a = dial_create()
						a.m[0] = text("* WARNING: this mode will make &&  your life hell. Proceed anyway?&&         Yes         No")

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
				destroy(dialogue)
				menu_play()

				timer[0] = 0
				menuScene++
				for (var i = 0;i < array_length(trigger);i++) {trigger[i] = 0}
			}
		break
	#endregion

	#region MAIN MENU
		case 1:
			timer[0] = 0
		
			var shx = irandom_range(-2,2) * shakey
			var shy = irandom_range(-2,2) * shakey

			draw_set_halign(fa_center)

			var mo = string(date_get_month(GM_build_date))
			var da = string(date_get_day(GM_build_date))
			var ye = string(date_get_year(GM_build_date))
			
			if mo < 10 {mo = "0" + mo}
			if da < 10 {da = "0" + da}
			
			var ut = "UNDERTALE " + string_upper(global.soul_name) + " " + mo + "/" + da + "/" + ye

			draw_font(3)
			draw_set_color(c_gray)
			draw_txt(room_width - shx,464 - shy,ut)
			
			draw_font(1)
			
			var _sv = global.filename
			if global.hard = 2 {_sv = ""}

			if !file_exists(_sv) {
				draw_set_color(c_silver)
				
				draw_font(!l_check())
				draw_txt(room_width - (19 + l_check()) - shx,48 - (4 * l_check()) - shy,text("--- Instruction ---"))

				draw_set_halign(fa_left)
				draw_font(1)

				if !l_check() {
					for (var i = 0;i < 6;i++) {
						var is,is_0,is_1
						is = "inst" + string(i)

						if i < 3 {
							is_0 = text(get_key(global.bt[i + 4,0]))
							is_1 = text(get_key(global.bt[i + 4,1]))
						}

						if i = 1 {is = "inst1_" + string(global.canRun)}
						if i = 5 {
							is = "inst5_" + string(global.hard = 2)
							if global.hard = 2 {draw_set_color(c_red)}
						}

						draw_txt(170 - shx,108 + (36 * i) - shy,text(is,is_0,is_1))
					}
				}
				else {
					for (var i = 0;i < 5;i++) {
						var ke,kek
						ke[i] = ""
						ke[i + 3] = ""
						kek[i] = ""
						kek[i + 3] = ""
						
						if i < 3 {
							ke[i] = get_key(global.bt[i + 4,0])
							ke[i + 3] = get_key(global.bt[i + 4,1])
						
							ke[i] = string_replace(ke[i],"Control","CTRL")
							ke[i + 3] = string_replace(ke[i + 3],"Control","CTRL")
						
							kek[i] = string_upper(text(ke[i]))
							kek[i + 3] = string_upper(text(ke[i + 3]))
						}

						draw_txt(106 - shx,94 + (36 * i) - shy,text("inst" + string(i),kek[i],kek[i + 3]))

						var _fu
						_fu[0] = "かくてい"
						_fu[1] = "キャンセル"
						_fu[2] = "フィールドメニュー"
						_fu[3] = "フルスクリーン"
						_fu[4] = "しゅうりょう"
						
						draw_font()
						draw_txt(326 - shx,94 + (36 * i) - shy,_fu[i])

						draw_font(1)
						
						if global.hard = 2 {draw_set_color(c_red)}
						draw_txt(102 - shx,294 - shy,text("inst5_" + string(global.hard = 2)))
						draw_set_color(c_silver)
					}
				}
				
				draw_font(!l_check())

				for (var i = 0;i < 2;i++) {
					var _op
					_op[0] = "Begin Game"
					_op[1] = "Settings"
				
					draw_set_color(c_white)
					if op = i {draw_set_color(c_yellow)}
				
					draw_txt((170 - shx) + (2 * l_check()),(352 + (40 * i) - shy) - (4 * l_check()),text(_op[i]))
				}
			}
			else {
				draw_story()
				
				draw_set_halign(fa_left)
				draw_set_color(c_white)
				
				var tim,lv,rm,tr
				
				tim = 0
				lv = 1
				rm = "--"
				tr = 0
				
				ini_open(_sv)
					var sf = "savefile"
				
					tim = ini_read_real(sf,"time",0)
					lv = ini_read_real(sf,"lv",1)
					rm = ini_read_string(sf,"roomName",rm)
					
					switch global.curCh {
						default:
							tr = ini_read_real(sf,"st_100",0)
						break
					}

					if global.changeName {global.pname = ini_read_string(sf,"playerName","[EMPTY]")}
				ini_close()

				var j_y = 4 * (l_check() or j_name())
				var j_x = 0
				
				draw_font(1,j_name())
				draw_txt((140 + shx) - (j_y * 2),(132 + shy) - j_y,draw_name(,9 - (3 * l_check())))
				
				j_y = 4 * l_check()
				
				draw_font(1)
				draw_txt((300 + shx) - j_y,(132 + shy) - j_y,text("LV") + " " + string(lv))

				draw_set_halign(fa_right)
				draw_txt((500 + shx) + (16 * l_check()),(132 + shy) - j_y,draw_time(tim))
				draw_set_halign(fa_left)

				draw_font(!l_check())
				if l_check() {
					draw_set_halign(fa_center)
					draw_txt((320 + shx) + j_y,164 + shy,text(rm))
					draw_set_halign(fa_left)
				}
				else {draw_txt(140 + shx,168 + shy,text(rm))}
				
				var so,sox,soy
				so[0] = "Continue"
				so[1] = "Settings"
				so[2] = "reset_" + string(tr)
				
				for (var i = 0;i < 3;i++) {
					sox = 170 + (150 * i) - (80 * (i = 2))
					soy = 218 + (40 * (i = 1))

					if i = 1 {draw_set_halign(fa_center)}
					
					if l_check() {
						if i = 0 {j_x = -26}
						if i = 1 {j_x = 4}
						if i = 2 {j_x = 4}
					}

					draw_set_color(c_white)
					if op = i {draw_set_color(c_yellow)}
					draw_txt((sox + shx) + j_x,(soy + shy) - j_y,text(so[i]))

					draw_set_halign(fa_left)
				}
			}

			if can_select {
				if u_pressed() and op = 1 {op = 0}
				if d_pressed() and op != 1 {op = 1}

				if file_exists(_sv) {
					if op != 1 {
						if r_pressed() or l_pressed() {
							if op != 2 {op = 2}
							else {op = 0}
						}
					}
					else {
						if r_pressed() {op = 2}
						if l_pressed() {op = 0}
					}
				}

				if z_pressed() {
					switch op {
						case 0:
							if !file_exists(_sv) {
								if global.changeName {menuScene++}
								else {begin_game()}
							}
							else {
								audio_free()
								load_all()
								for (var i = 0;i < array_length(global.hp);i++) {global.hp[i,dw] = global.maxhp[i,dw]}
								
								var r = "rm_dogcheck"
								var m0 = "mus_dance_of_dog"

								ini_open(_sv)
									r = asset_get_index(ini_read_string("savefile","room","rm_dogcheck"))
									m0 = ini_read_string("savefile","m_name_1",m0)

									if m0 != global.tooMuch {global.pitch = ini_read_real("savefile","pitch",1)}
									else {global.pitch = 1}
								ini_close()

								music_play(m0)
								room_goto(r)
							}
						break

						case 1:
							check_season()

							op = 0
							menuScene = 3
						break
						
						case 2:
							if global.changeName {
								if !tr {can_select = -1}
								else {global.pname = ""}
								op = 0
								menuScene = 2
							}
							else {begin_game()}
						break
					}
				}
			}
		break
	#endregion

	#region NAMING MENU
		case 2:
			var fan,a,ax,ay,row,delstr,sel
			
			fan = "Name the fallen human."
			ax = 0
			ay = 0
			row = 0
			
			sel[0] = 70
			sel[1] = 71
			sel[2] = 72
			
			delstr = 0
			
			draw_font(!l_check())
			
			var j_x = 0
			var j_y = 0

			if can_select {
				fan = "Name the fallen human."
				
				timer[0] = 0
				
				for (var i = 0;i < 9;i++) {
					if op >= 7 * i {row = i}
				}
				
				if !l_check() {					
					for (var i = 0;i < 28;i++) {
						a[i] = chr(65 + i)
						if i > 25 {a[i] = ""}
						a[i + 28] = string_lower(a[i])

						if ax > 6 {
							ax = 0
							ay++
						}

						draw_set_color(c_white)
						if op = i {draw_set_color(c_yellow)}
						draw_txt(120 + (64 * ax) + ceil(random_range(0.5,-0.5)),159 + (27 * ay) + ceil(random_range(0.5,-0.5)),a[i])

						draw_set_color(c_white)
						if op = i + 28 {draw_set_color(c_yellow)}
						draw_txt(120 + (64 * ax) + ceil(random_range(0.5,-0.5)),278 + (27 * ay) + ceil(random_range(0.5,-0.5)),a[i + 28])
				
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
						var oo
						oo[0] = "Quit"
						oo[1] = "Backspace"
						oo[2] = "Done"
						
						var ox = 120 * i
						if i = 2 {ox = 320}

						draw_set_color(c_white)
						if op = i + 70 {draw_set_color(c_yellow)}
						draw_txt(120 + ox,408,text(oo[i]))
					}
				}
				else {
					var j_l,cur_j,lim
					
					j_l[0] = "あいうえおまみむめもぁぃぅぇぉかきくけこや ゆ よがぎぐげごさしすせそらりるれろざじずぜぞたちつてとわをんー だぢづでどなにぬねのゃゅょっゎばびぶべぼはひふへほ     ぱぴぷぺぽ"
					j_l[1] = "アイウエオマミムメモァィゥェォカキクケコヤ ユ ヨガギグゲゴサシスセソラリルレロザジズゼゾタチツテトワヲンー ダヂヅデドナニヌネノャュョッヮバビブベボハヒフヘホヵヶヴ  パピプペポ"
					j_l[2] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"

					cur_j = trigger[0]
					lim = 15
					if cur_j = 2 {lim = 9}
					
					ax = 0
					ay = 0
					
					for (var i = 0;i < 7;i++) {
						if op >= lim * i {row = i}
					}
					
					for (var i = 0;i < string_length(j_l[cur_j]);i++) {
						a[i] = string_char_at(j_l[cur_j],i + 1)

						if ax = lim {
							ax = 0
							ay++
						}
						
						var axx = 68
						var sep = 32

						if cur_j < 2 {
							if ax > 4 {axx += 16}
							if ax > 9 {axx += 16}
						}
						else {
							axx = 120
							sep = 46
						}

						draw_set_color(c_white)
						if op = i {draw_set_color(c_yellow)}
						draw_txt((axx + (sep * ax)) + ceil(random_range(0.5,-0.5)),(142 + (32 * ay)) + ceil(random_range(0.5,-0.5)),a[i])

						ax++
					}
					
					for (var i = 0;i < 3;i++) {
						var _o,ox
						_o[0,0] = "ひらがな"
						_o[1,0] = "カタカナ"
						_o[2,0] = "アルファベット"
						_o[0,1] = "やめる"
						_o[1,1] = "さくじょ"
						_o[2,1] = "かくてい"
						
						ox[0,0] = 0
						ox[1,0] = 172
						ox[2,0] = 340
						ox[0,1] = 0
						ox[1,1] = 140
						ox[2,1] = 300
						
						draw_set_color(c_white)
						if op = i + 110 {draw_set_color(c_yellow)}
						draw_txt(68 + ox[i,0],348,_o[i,0])
						
						draw_set_color(c_white)
						if op = i + 120 {draw_set_color(c_yellow)}
						draw_txt(114 + ox[i,1],412,_o[i,1])
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

				var str = ""

				if op < array_length(a) {str = string_char_at(a[op],1)}

				if z_pressed() {
					switch op {
						default:
							if string_length(global.pname) = 6 {global.pname = string_delete(global.pname,6,1)}
							global.pname += str
						break
							
						case sel[0]:
							op = 0
							menuScene = 1
						break
							
						case sel[1]:
							delstr = 1
						break
							
						case sel[2]:
							if string_length(global.pname) {
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
					if !string_length(global.pname) {
						op = 0
						menuScene = 1
					}
					else {global.pname = string_delete(global.pname,string_length(global.pname),1)}
				}
			}
			else {
				fan = "Is this name correct?"
				
				var chars,char,nochars,no
				no = 0

				chars[0] = "Toriel"
				nochars[0] = "toriel"
				char[0] = ""
				char[1] = ""

				for (var i = 0;i < array_length(chars);i++) {
					if string_lower(global.pname) = string_lower(chars[i]) or (l_check() and global.pname = text(chars[i])) {
						char[0] = string_lower(chars[i])
						char[1] = text(chars[i])
					}
				}

				var h = string_lower(global.name[0])
				var h2 = text(global.name[0])

				switch string_lower(global.pname) {
					case h2:
					case h:
						fan = "WARNING: this name will \nmake your life hell. \nProceed anyway?"
					break

					case char[1]:
					case char[0]:
						fan = char[0] + "_fun"
						if array_contains(nochars,char[0]) or array_contains(nochars,char[1]) {no = 1}
					break
				}

				if !i_exists(white_fade) {
					if can_select = -1 {fan = "A name has already \nbeen chosen."}

					for (var i = 0;i < 2;i++) {
						var o
						o[0] = "No"
						o[1] = "Yes"

						if no {
							o[0] = "Go Back"
							o[1] = ""
						}

						draw_set_color(c_white)
						if op = 0 {draw_set_color(c_yellow)}
						draw_txt(116 + (6 * l_check()),408 - (4 * l_check()),text(o[0]))
						
						draw_set_color(c_white)
						if op = 1 {draw_set_color(c_yellow)}
						draw_txt(430 + (26 * l_check()),408 - (4 * l_check()),text(o[1]))
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
				
				if l_check() {
					j_x = 4
					j_y = -4
				}
			}
			
			switch string_lower(global.pname) {
				case "ガスター":
				case "がすたー":
				case "gaster":
					game_restart()
				break
			}
			
			var s_x,s_y,s_c,s_a,s_xx
			
			s_xx = timer[0] / 15
			if j_name() {s_xx = timer[0] * 1.3}

			s_x = (random_range(1,-1) - s_xx) * (timer[0] > 0)
			s_y = (random_range(1,-1) + timer[0]) * (timer[0] > 0)
			s_c = 2 + (timer[0] / 25)
			s_a = random_range(timer[0] / 120,-(timer[0] / 120))

			draw_set_color(c_white)
			draw_txt(180 + j_x,68 + j_y,text(fan))
			
			draw_font(1,j_name())
			draw_txt((280 + s_x) - (44 * j_name()),(118 + s_y) - (24 * j_name()),draw_name(,6),s_c,s_c,s_a)
		break
	#endregion

	#region SETTINGS MENU
		case 3:
			var j_x = 0
			var j_y = 0
			
			if l_check() {
				j_x = 8
				j_y = -8
			}
		
			draw_font(!l_check())
			draw_set_color(c_white)

			if s != 1 {draw_set_halign(fa_center)}
			
			draw_txt(room_width - (300 * (s = 1)) + j_x,36 + j_y,string_upper(text("Settings")),4,4)
			draw_set_halign(fa_left)
			
			var o
			o[0] = text("op_" + string(global.SHAKE_OPTION))
			o[1] = text("op_" + string(global.autoRUN))
			o[2] = text("op_" + string(global.lmode))
			o[3] = string(round(global.s_vol * 100)) + "%"
			o[4] = string(round(global.m_vol * 100)) + "%"
			o[5] = text("lang")
			
			if b.cur_b < 4 {o[6] = text("b_" + string(b.cur_b))}
			else {
				o[6] = text("b_" + string_lower(global.soul_name) + "_" + string(b.cur_b))
				if b.cur_b > b.max_b {o[6] = text("b_" + string_lower(global.soul_name) + "_ex_" + string(b.cur_b - b.max_ex))}
			}
			
			if b.cur_b = -1 {o[6] = "@!%&"}
			
			var list = string(working_directory) + @"\lang\langList.ini"
			
			ini_open(list)
				var l = 1
				
				for (var i = 0;i < l;i++) {
					if ini_key_exists("list",string(i)) {l++}
				}
			ini_close()
			
			if l_check() {
				j_x = 4
				j_y = -4
			}
		
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
				
				var list = string(working_directory) + @"\lang\langList.ini"
				var l
	
				l[0] = "en"
	
				if file_exists(list) {
					ini_open(list)
						var f = 1
		
						for (var i2 = 0;i2 < f;i2++) {
							if ini_key_exists("list",string(i2)) {
								l[i2] = ini_read_string("list",string(i2),"")

								f++
							}
						}
					ini_close()
				}
				else {show_debug_message(list + " Doesn't exist!")}
				
				var noLang = (array_length(l) <= 1)

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

				var st = "set_" + string(i)
				if i = 8 {st = "set_8_" + string(con)}
				if i = 6 and noLang {
					st = ""
					o[5] = ""
				}
				
				draw_set_color(c_white)
				if op = i {
					draw_set_color(c_yellow)
					if i = 3 {draw_set_color(global.color[0])}
				}

				draw_font(!l_check())
				draw_txt(40 + j_x,(88 + sp) + j_y,text(st))

				if i < 8 and i {
					draw_font(!l_check())
					if i and i < 6 {draw_font(1)}

					draw_set_halign(fa_right)
					draw_txt(360 + j_x,(88 + sp) + j_y,o[i - 1])
					draw_set_halign(fa_left)
				}
			}

			if can_select {
				if d_pressed() and op < 8 {
					if op != 1 {op++}
					else {op += 1 + !global.canRun + !global.hasLmode}
				}
				
				if u_pressed() and op {
					if op != 4 {op--}
					else {op -= 1 + !global.hasLmode + !global.canRun}
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
							global.SHAKE_OPTION = !global.SHAKE_OPTION

							ini_open(_c)
								save_file(global.SHAKE_OPTION,"shake",1,,_c)
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
								save_file(global.lmode,"lmode",,,string_lower(global.soul_name))
							ini_close()
						
							lmode_ef()
						break
						
						case 7:
							b.cur_b -= l_pressed() - (r_pressed() or z_pressed())
							
							if b.cur_b > b.max_ex {b.cur_b = 0}
							if b.cur_b < 0 {b.cur_b = b.max_ex}

							_c = global.soulfile
							
							ini_open(_c)
								save_file(b.cur_b,"b",,,string_lower(global.soul_name))
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

						music_set_volume()

						ini_open(_c)
							save_file(global.m_vol,"m_vol",1,,_c)
						ini_close()
					}
				}
					
				if op = 6 {
					if r_pressed() or l_pressed() or z_pressed() {
						global.lang += ((r_pressed() or z_pressed()) - l_pressed())
						load_langs()
						
						ini_open(_c)
							save_file(global.lang,"lang",,,_c)
						ini_close()
					}
				}
					
				if op = 8 and z_pressed() {
					op = 0
					menuScene++
				}
			}

			if op = 4 or op = 5 {
				draw_set_halign(fa_center)
				
				var sC = 2 - l_check()

				draw_set_color(c_gray)
				draw_font(3 * !l_check())
				draw_txt(room_width,464 - (4 * l_check()),text("holdx",string_upper(get_key(global.bt[5,0])),string_upper(get_key(global.bt[5,1]))),sC,sC)
				
				draw_set_halign(fa_left)
			}

			if int {
				int += 8

				draw_set_color(c_black)
				draw_rectangle(-1,-1,room_width - int,481,0)
				draw_rectangle(room_width + int,-1,641,481,0)

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
			draw_font(!l_check())
			draw_set_color(c_white)

			if s != 1 {draw_set_halign(fa_center)}
			
			var swid = 4
			if l_check("BR") {swid = 3.2}
			
			var j_x = 0
			var j_y = 0
			
			if l_check() {
				j_x = 8
				j_y = -8
			}
			
			draw_txt((room_width - (300 * (s = 1)) + j_x) + (28 * l_check() * con),36 + j_y,text("set_8_" + string(con)),swid,4)
			draw_set_halign(fa_left)
			
			var _k
			_k[0] = "EXIT"
			
			if l_check() {
				j_x = 4
				j_y = -4
			}

			if !con {
				_k[1] = "DOWN"
				_k[2] = "RIGHT"
				_k[3] = "UP"
				_k[4] = "LEFT"
				_k[5] = "CONFIRM"
				_k[6] = "CANCEL"
				_k[7] = "MENU"

				_k[8] = "RESET TO DEFAULT"
				_k[9] = "CONTROL TEST"

				var _a
				_a[0] = color_get_red(global.color[0])
				_a[1] = color_get_green(global.color[0])
				_a[2] = color_get_blue(global.color[0])
			
				for (var i = 0;i < 3;i++) {
					if _a[i] < 128 {_a[i] = 0}
					else {_a[i] = 255}
				}
			
				if _a[0] = 255 and _a[1] = 255 and _a[2] = 255 {
					_a[1] = 0
					_a[2] = 0
				}
			
				var a_col = make_color_rgb(_a[0],_a[1],_a[2])
						
				for (var i = 0;i < array_length(_k);i++) {
					
					if i < 8 and i {draw_font(1)}
					else {draw_font(!l_check())}

					draw_set_color(c_white)
					if op = i {
						if can_select {draw_set_color(c_yellow)}
						else {draw_set_color(a_col)}
					}
				
					var sp = 30 * i
					if i {sp += 30}
					if i >= 8 {sp += 30}

					if !(i = 8 and timer[3] > 0) {draw_txt(40 + j_x,(88 + sp) + j_y,text(_k[i]))}

					if i < 8 {
						var _kk
					
						for (var o = 0;o < 2;o++) {
							draw_set_color(c_white)
							if op and op < 8 {
								if can_select = o + 1 {draw_set_color(c_yellow)}
								if can_select = -(o + 1) {draw_set_color(a_col)}
							}

							_kk[0,o] = text("MAP " + chr(65 + o))
						
							if i {
								draw_set_color(c_white)

								if op = i {
									if can_select = o + 1 {draw_set_color(c_yellow)}
									if can_select = -(o + 1) {draw_set_color(a_col)}
								}
								_kk[i,o] = get_key(global.bt[i - 1,o])
							}
							
							draw_font(1)
							draw_set_halign(fa_right)
							draw_txt((429 + (168 * o)) + j_x,(88 + sp) + j_y,_kk[i,o])
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
							if keyboard_get_map(keyboard_lastkey) = global.bt[i,map] {global.bt[i,map] = global.bt[o,map]}
						}

						global.bt[o,map] = keyboard_get_map(keyboard_lastkey)

						d_ch = keyboard_get_map(_d[o,map])
					
						ini_open(_c)
							if keyboard_get_map(keyboard_lastkey) != d_ch {ini_write_real(_c,"k_" + string(o) + "_" + string(map),keyboard_get_map(keyboard_lastkey))}
							else {ini_delete(_c,"k_" + string(o) + "_" + string(map))}
						ini_close()

						can_select = -can_select
					}
				}
			}
			else {
				for (var i = 0;i < 3;i++) {_k[i + 1] = "joy_" + string(i)}

				_k[4] = "ANALOG SENSITIVITY:"
				_k[5] = "ANALOG SENSITIVITY SENSITIVITY:"
				
				_k[6] = "dch"
				_k[7] = "RESET TO DEFAULT"
				_k[8] = "CONTROL TEST"

				var _b,ax,ay
				
				ax = 0
				ay = 0

				for (var o = 0;o < 3;o++) {
					for (var p = 0;p < 2;p++) {
						_b[o,p] = string_upper(get_key(global.bt[4 + o,p]))
						_b[o,p] = string_replace(_b[o,p],"CONTROL","CTRL")
					}
				}
				
				for (var i = 0;i < array_length(_k);i++) {
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
					if i = 6 {_b[bb,0] = text("dir_" + string(gpad.dch))}

					if i < 4 and i {draw_font(1)}
					else {draw_font(!l_check())}
					draw_set_color(c_white)
					if op = i {draw_set_color(c_yellow)}
					
					if l_check() and i {
						ax = 0
						ay = 0

						if i = 2 or i = 3 {ax = 2}
						if i = 2 or i = 7 {ay = 2}
						if i = 3 or i = 8 {ay = 4}
						if i = 5 {
							ax = -1
							ay = 2
						}
					}

					if !(i = 7 and timer[3] > 0) {draw_txt((40 + j_x) + ax,((88 + sp) + j_y) + ay,text(_k[i],_b[bb,0],_b[bb,1]),sc)}
				}
				
				ax = 0
				ay = 0
				
				for (var i = 0;i < 3;i++) {
					var ic,ir,ig,ib,bp,bnp
					
					ic = global.color[0]
					ir = 255 - color_get_red(ic)
					ig = 255 - color_get_green(ic)
					ib = 255 - color_get_blue(ic)

					if !ir {ir = 0}
					if !ig {ig = 0}
					if !ib {ib = 0}

					ic = make_color_rgb(ir,ig,ib)

					for (var o = 0;o < 2;o++) {
						_b[i,o] = string_upper(get_key(global.bt[4 + i,o]))
						_b[i,o] = string_replace(_b[i,o],"CONTROL","CTRL")
					}

					var spa,te
					te[i] = text(_k[i + 1],_b[i,0],_b[i,1])
					spa[i] = string_length(te[i]) - round(2.5 * i)

					bp[i] = 40 + round(spa[i] * 12.5)
					
					if l_check() and i {ay = 2 * i}
					
					draw_font(1)
					draw_set_color(ic)
					draw_txt((array_highest(bp) + j_x) + ax,(158 + (30 * i) + j_y) + ay,string(gpad.bt[i] - 32768))
				}

				var _o = op - (1 * (op > 0))
				
				for (var i = 0;i < 2;i++) {
					var c = c_red
					if i {c = c_green}
					
					var hl
					hl[i] = can_select = (i + 5)

					draw_spr(p_slide,0,302 - (44 * l_check()),280 + (30 * i) + (2 * i * l_check()),2,2,,c,0.6 + hl[i])

					var _s
					_s[i] = 298 + ((gpad.sens[i] * 2) * ((i + 1) * 100))

					draw_set_alpha(0.6 + hl[i])
					draw_set_color(c_yellow)
					draw_rectangle((-2 + _s[i]) - (44 * l_check()),276 + (30 * i) + (2 * i * l_check()),(1 + _s[i]) - (44 * l_check()),295 + (30 * i) + (2 * i * l_check()),0)
					draw_set_alpha(1)
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
							for (var i = 0;i < array_length(trigger);i++) {trigger[i] = 0}
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
							draw_set_color(c_blue)
						
							var rx = bp[_o] - 18
							var pt = text("(PUSH BUTTON)") + " "
							if l_check() {pt = "(PUSH BUTTON)"}
						
							draw_rectangle(rx + j_x,152 + (30 * _o),(rx + (string_width(pt) * 2)) + (8 * l_check()),181 + (30 * _o),0)
						
							timer[2]++
							timer[2] %= 16

							if timer[2] <= 8 {
								draw_font(1)
								draw_set_color(c_white)
								draw_txt(rx + (12 * l_check()),(158 + (30 * _o)) - (2 * l_check()),pt)
							}

							var dbutt
							dbutt[0] = gp_face1
							dbutt[1] = gp_face2
							dbutt[2] = gp_face4

							for (var i = gp_face1;i < gp_extra6;i++) {
								if gamepad_button_check_pressed(gg,i) and !delay {
									g.bt[_o] = i
									trigger[_o] = 0
									can_select = 1

									ini_open(_c)
										save_file(g.bt[_o],"bt_" + string(_o),dbutt[_o],,_c)
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
								var dsens
								dsens[0] = 0.15
								dsens[1] = 0.01

								if !o_ {g.sens[0] -= (l_hold() - r_hold()) * g.sens[1]}
								else {g.sens[1] -= (l_hold() - r_hold()) * 0.01}
						
								var ha = 1 + o_

								if g.sens[o_] >= 0.4 / ha {g.sens[o_] = 0.4 / ha}
								if g.sens[o_] <= 0.02 / ha {g.sens[o_] = 0.02 / ha}

								ini_open(_c)
									save_file(g.sens[o_],"bs_" + string(o_),dsens[o_],,_c)
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
			}

			var _lk = array_length(_k) - 1
			var llk = _lk - 1

			if timer[3] > 0 {
				draw_font(!l_check())
				draw_txt_alpha(40 + j_x,(388 - (10 * con)) - (4 * l_check()),text(trigger[6]),(1 - (10 - timer[3]) / 10),,,,c_red,c_red,c_red,c_red)

				timer[3]--
			}

			if z_pressed() {
				switch op {
					case 0:
						menuScene--
					break
					
					case llk:
						var spag = irandom(50)
						
						if spag = 1 {trigger[6] = "SPAGHETTI..."}
						else {trigger[6] = "RESETTED..."}
					
						timer[3] = 15
						if !on_controller() {reset_keys()}
						else {reset_gpad()}
						
						if file_exists(_c) {
							ini_open(_c)
								if !on_controller() {
									for (var i = 0;i < 7;i++) {
										for (var o = 0;o < 2;o++) {ini_delete(_c,"k_" + string(i) + "_" + string(o))}
									}
								}
								else {
									for (var i = 0;i < 3;i++) {ini_delete(_c,"bt_" + string(i))}
									for (var i = 0;i < 2;i++) {ini_delete(_c,"bs_" + string(i))}
									
									ini_delete(_c,"dc")
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
						for (var i = 0;i < array_length(timer);i++) {timer[i] = 0}
					break
				}
			}
		break
	#endregion

	#region CONTROL TEST
		case 5:
			var _bt,_bth
			_bt[0] = z_pressed()
			_bt[1] = x_pressed()
			_bt[2] = c_pressed()
			_bth[0] = z_hold()
			_bth[1] = x_hold()
			_bth[2] = c_hold()

			var str = 0
			var newspr = p_test
			
			draw_set_color(#FF4040)
			draw_font(11)
			draw_txt(278,412,string_upper(text("exit")),2,2)
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
					var be = asset_get_index("beat_" + string(i))
					
					audio_play(be,,,str)
					timer[i] = 4
					timer[4] = 0
				}
				
				if timer[i] {
					timer[4] = 0
					
					if str {
						switch global.curCh {
							default:
							break
						}
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

				draw_spr(p_butts,0,164 + (120 * i),96,4,4,,#BD26CA)
				draw_spr(p_butts,0,164 + (120 * i),72 + bty[i],4,4,,#E6598A)
				draw_spr(p_butts,i + 1,164 + (120 * i),72 + bty[i],4,4,,btc[i])
				
				draw_set_color(#BD26CA)
				
				if i = 0 and !timer[0] {
					draw_rectangle(188,92,191,95,0)
					draw_rectangle(220,140,223,143,0)
				}
				
				if i = 1 and !timer[1] {
					draw_rectangle(308,104,311,107,0)
					draw_rectangle(340,104,343,107,0)
					draw_rectangle(308,128,311,131,0)
					draw_rectangle(340,128,343,131,0)
				}
			}
			
			draw_set_color(c_white)
			for (var rec = 0;rec < 6;rec++) {draw_rectangle(112 + (2 * rec),272 + (2 * rec),530 - (2 * rec),699,1)}
		
			if y >= 480 {
				if !s {menu_play()}
				else {season_play()}

				menuScene = 4
				for (var i = 0;i < array_length(timer);i++) {timer[i] = 0}
			}
		break
	#endregion
}

if delay {delay -= 0.5}
if shakey > 0 {shakey += 0.02}

function menu_play() {
	audio_free()
	
	var prog = 0
	
	music_play("mus_menu_" + string(prog),,1)
}

function begin_game() {
	shakey = 0.02 * global.SHAKE_OPTION
	can_select = 0
	
	audio_free()
	audio_play(intro_fade,,,0.8,,0.95)

	var rm = rm_hole0
	var _x = 140
	var _y = 120
	var _f = 0
	
	global.X = _x
	global.Y = _y
	global.F = _f

	_f = i_create(0,0,depth - 2,white_fade)
	_f.map = rm
	_f.style = 3 * (op > 0) * !(global.hard = 2)
	
	global.fun = irandom(100) + 1
}

function check_season() {
	int = 0
	s = 0

	if s {
		var _m = current_month
		
		if _m < 12 {s = 4}
		if _m < 9 {s = 3}
		if _m < 6 {s = 2}
		if _m < 3 {s = 1}

		var _c = "config.ini"
		
		if file_exists(_c) {
			ini_open(_c)
				s = ini_read_real(_c,"season",s)
			ini_close()
		}

		can_select = 0
		audio_free()
		music_play("mus_harpnoise",,1)
		int = 16
	}
}

function season_play() {
	var _s = "fall"

	if s = 4 {_s = "winter"}
	if s = 1 {_s = "summer"}

	audio_free()
	music_play("mus_options_" + _s,,1)
}
	
function draw_story() {
	var shx = irandom_range(-2,2) * shakey
	var shy = irandom_range(-2,2) * shakey
	
	switch global.curCh {
		default:
		break
	}
}
