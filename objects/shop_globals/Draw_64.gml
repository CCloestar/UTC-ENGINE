var line = 1
var _id = global.shop_id
var shop_snd = dial_main

draw_set_color(c_black)
draw_rectangle(-1,240,641,481,0)

draw_font(1)
draw_set_color(c_white)

var j = l_check()
var dj = dw * j

var bw = 234 * dw
var nobw = 0
if curBt = 2.1 or curBt = 2.2 or (scene = 1 and curBt > 1) {nobw = 1}
if scene > 1 {nobw = 1}
if scene = 1 and curBt = 2 {nobw = 0}
if scene and curBt = 1 {nobw = 1}

if nobw {bw = 9 * dw}

repeat (3) {load_d_dw()}
draw_box(8 * dw,240 + (8 * dw),641 - bw,481 - (9 * dw),,,8,,dw)
if dw and bw > 9 {draw_box(408,248,632,472,,,,,1)}

var hspr = heart_menu
var hsc = 2

if dw {
	hspr = heart_main
	hsc = 1
}

switch scene {
	#region BUTTON SELECT
		case 0:
			var tx
			tx[0] = text("Buy")
			tx[1] = text("Sell")
			tx[2] = text("Talk")
			tx[3] = text("Exit")
			
			if j {tx[3] = "でる"}
			
			draw_font(!j)
			draw_set_color(c_white)
			for (var i = 0;i < 4;i++) {draw_txt((480 + (24 * j)) - (20 * dj),((268 + (40 * i)) - (4 * j)) + (2 * dj),tx[i])}

			draw_spr(hspr,0,(450 + (20 * j)) - (20 * dj),((268 + (40 * curBt)) - (4 * j)) + (6 * dj),hsc,hsc,,global.color[0])

			var shop_txt = "* Shop test"
		
			if !dial_exists() {
				a = dial_create((40 - (2 * j)) - (10 * dj),268 + (12 * dj))
				a.preset = -1
				a.finish = 0
				a.y_sep = 36 + (2 * j)
				a.snd = shop_snd
				a.m[0] = text(shop_txt)
			}
		
			if u_pressed() {
				audio_play(click)
				curBt--
				if curBt < 0 {curBt = 3}
			}
		
			if d_pressed() {
				audio_play(click)
				curBt++
				if curBt > 3 {curBt = 0}
			}
			
			if (l_pressed() or r_pressed()) and global.debug {trigger[1] = !trigger[1]}
		
			if z_pressed() {
				audio_play(select_1)
				destroy(dialogue)
				curIt = 0
				curP = 0
				delay = 1
				
				var n = 1
				var unsell = trigger[1]
				if (!item_amt(dw) or unsell) and curBt = 1 {n = 0}
				
				ex = "main"

				if !n {
					if !item_amt(dw) {
						curBt = 2.2
						ex = "noItems"
					}
					if unsell {
						curBt = 2.1
						ex = "noSell"
					}
				}
				
				scene++
				for (var i = 0;i < array_length(trigger);i++) {trigger[i] = 0}
				if curBt = 1 {trigger[2] = item_amt(dw)}
				
				audio_play(asset_get_index("select_" + string(n)))
			}
		break
	#endregion

	#region IN BUTTON SELECT
		case 1:
			switch curBt {
				#region BUY
					case 0:
						var s_txt = "s_buy"
			
						var p,p_t,p_i,p_x
						p[0] = 0
						p_i[0,0] = "No Item"
						p_i[0,1] = ""
				
						switch _id {
							default:
								p[0] = 1
								p[1] = 10
								p[2] = 100
								p[3] = 1000
				
								p_i[0,0] = "Eye"
								p_i[1,0] = "Eye (10)"
								p_i[2,0] = "Expensive"
								p_i[3,0] = "Oh My God Bruh"
				
								p_i[0,1] = "Toy Knife"
								p_i[1,1] = "Toy Knife"
								p_i[2,1] = "Toy Knife"
								p_i[3,1] = "Toy Knife"
							break
						}

						var top = 162 + (4 * j * !dj) + (18 * dw)
						var bot = 240

						if curIt != 4 {
							if b_y < top {b_y += 6}
							if b_y < top - 24 {b_y += 2}
							if b_y < top - 40 {b_y += 2}
							if b_y < top - 80 {b_y += 8}
							if b_y < top - 116 {b_y += 5}

							if b_y >= top {b_y = top}
						}
						else {
							if !dw {b_y = 0}
							else {b_y -= 40}
							
							if !b_y {b_y = 0}
						}
						
						var bby = 481
						if dw {
							bby = 247
							bot += 18
						}
						
						var b_by = 50 * dw
						
						draw_font(1)
						draw_box((420 + (20 * j * !dj)) - (12 * dw),(bot - b_y) - b_by,641 - (9 * dw),bby,,,8,,dw)

						draw_set_color(c_white)
						if curIt < 4 {draw_txt(((448 + (24 * j)) - (8 * dw)) - (20 * dj),(((((bot + 36 + (8 * dj)) - b_y) - (12 * j)) - b_by) - (8 * dw)) + (2 * dj),text(p_i[curIt,0] + "_desc"))}

						draw_box((420 + (20 * j * !dj)) - (12 * dw),240 + (8 * dw),641 - (9 * dw),481 - (9 * dw),,,8,,dw)

						draw_set_color(c_white)

						for (var i = 0;i < array_length(p);i++) {
							var i_txt,i_wid
							
							i_txt = string(p[i]) + string_upper(text("g_" + string(dw))) + " - "
							i_wid = 2
							
							var iy = ((268 + (40 * i)) - (4 * j)) + (2 * dj)
							
							draw_font(!j)

							if !dw {
								p_x[i] = 72 + (6 * j)
								if p[i] >= 10 {p_x[i] -= 12}
								if p[i] < 0 {
									i_txt = "--- SOLD OUT ---"
									draw_set_color(c_gray)
								}
								else {draw_txt(p_x[i] + ((12 + (2 * j)) * string_length(i_txt)),iy,text(p_i[i,0]),i_wid)}
							
								draw_font(1)
								draw_txt(p_x[i],iy,i_txt)
							}
							else {
								i_txt = text(p_i[i,0])
								
								if p[i] < 0 {
									i_txt = "--- SOLD OUT ---"
									draw_set_color(c_gray)
								}
								else {
									draw_font(1)
									draw_txt((300 + (6 * j)) - (2 * dj),iy,string(p[i]) + string_upper(text("g_1")),i_wid)
								}
			
								draw_font(!j)
								draw_txt((60 + (6 * j)) - (4 * dj),iy,i_txt,i_wid)
								
								draw_font(1)
							}
						}
				
						draw_font(!j)
						draw_set_color(c_white)
						draw_txt(60 + (4 * j),(428 - (4 * j)) + (2 * dj),text("Exit"))
						
						draw_font(1)
				
						if curP {
							if u_pressed() or d_pressed() {
								trigger[0] = !trigger[0]
								audio_play(click)
							}
					
							draw_set_color(c_white)
							draw_font(1)
					
							for (var i = 0;i < 2;i++) {
								var btxt = "Buy for"
								if i {btxt = string(p[curIt]) + string_upper(text("g_" + string(dw))) + " ?"}
								
								if j {
									btxt = string_upper(string(p[curIt]) + text("g_" + string(dw))) + "で"
									if i {btxt = "かう？"}
								}
						
								var _op
								_op[0] = "Yes"
								_op[1] = "No"
						
								draw_font(1)
								draw_txt(((460 + (8 * j)) - (10 * dw)) + (6 * dj),((268 + (30 * i)) - (4 * j)) + (2 * dj),text(btxt))
								
								draw_font(!j)
								draw_txt(((480 + (28 * j)) - (10 * dw)) - (14 * dj),((348 + (30 * i)) - (4 * j)) + (2 * dj),text(_op[i]))
							}
							
							draw_font(1)
							draw_spr(hspr,0,((450 + (20 * j)) - (10 * dw)) - (10 * dj),(((348 + (30 * trigger[0])) - (4 * j)) + (2 * dw)) + (4 * dj),hsc,hsc,,global.color[0])

							if z_pressed() and !trigger[0] {
								switch p_i[curIt,0] {
									default:
										var _b = 1
										s_txt = "s_brought"
					
										if item_amt(dw) >= 8 {
											_b = 0
											s_txt = "s_noSpace"
										}

										if global.g[dw] < p[curIt] {
											_b = 0
											s_txt = "s_noGold"
										}
						
										if p[curIt] < 0 {
											_b = 0
											s_txt = "s_soldout"
										}

										if _b {
											global.g[dw] -= p[curIt]
											add_item(p_i[curIt,1])
						
											audio_play(buy)
											ex = "happy"
										}
										else {
											audio_play(select_0)
											ex = "sad"
										}

										curP = 0
									break
								}
							}
						
							if x_pressed() or (z_pressed() and trigger[0]) {
								curP = 0
								delay = 1
								s_txt = "s_refused"
								ex = "sad"
							}
						}
						else {	
							if d_pressed() {
								curIt++
								if curIt >= array_length(p) and curIt < 4 {curIt = 4}
								if curIt > 4 {curIt = 0}

								audio_play(click)
							}

							if u_pressed() {
								curIt--
								if curIt < 0 {curIt = 4}
								if curIt < 4 and curIt >= array_length(p) {curIt = array_length(p) - 1}
					
								audio_play(click)
							}

							if z_pressed() and curIt < 4 {
								audio_play(select_1)
								destroy(dialogue)
								curP = 1
								trigger[0] = 0
								ex = "main"
							}
					
							draw_spr(hspr,0,30,(((268 + (40 * curIt)) - (4 * j)) + (2 * dw)) + (4 * dj),hsc,hsc,,global.color[0])
						}
				
						if !curP {
							if !dial_exists() {
								a = dial_create((460 - (4 * j)) - (10 * dw),268)
								a.preset = -1
								a.finish = 0
								a.y_sep = 36 + (2 * j)
								a.snd = shop_snd
								a.m[0] = text(s_txt + "_" + string(_id))
							}
				
							if (x_pressed() or (z_pressed() and curIt = 4)) and !delay {
								destroy(dialogue)
								curIt = 0
								scene = 0
								ex = "main"
							}
						}
					break
				#endregion
				
				#region SELL
					case 1:
						line = 0
						item_check()

						draw_font(1)
						draw_set_color(c_yellow)

						var gtxt = "(" + string(global.g[dw]) + string_upper(text("g_" + string(dw))) + ") "
						draw_txt(400 + (8 * j),(428 - (4 * j)) + (2 * dj),gtxt)

						draw_set_color(c_white)
						
						var pr
						for (var i = 0;i < 8;i++) {
							pr[i] = 0
							
							switch global.item[i,3 * dw] {
								default:
									pr[i] = 10
								break
							}
						}
						
						if !curP {
							var px,py,its,_it,_px
							px = 0
							py = 0
							
							var tySell = text("(--- SOLD ---)")
							var sep = 280 + (22 * j)
							
							for (var i = 0;i < 8;i++) {
								_px[i] = 60 - (4 * j)
								if pr[i] < 100 {_px[i] += 14}
								if pr[i] < 10 {_px[i] += 14}
								
								if px > 1 {
									px = 0
									py++
								}

								_it[i] = text(global.item[i,(3 * dw) + 1])
								its[i] = string(pr[i]) + string_upper(text("g_" + string(dw))) + " - "
								
								var it_w = 2
								
								draw_font(!j)
								if global.item[i,3 * dw] = "" {
									its[i] = ""
									
									if i < trigger[2] {
										its[i] = tySell
										draw_set_color(c_gray)
									}
								}
								else {draw_txt((_px[i] + (sep * px) + ((12 + (2 * j)) * string_length(its[i]))) - 2,(262 + (40 * py)) - (4 * j),_it[i],it_w,,1)}
								
								draw_font(1)
								draw_txt(_px[i] + (sep * px),(268 + (40 * py)) - (4 * j),its[i])
								draw_set_color(c_white)
								px++
							}
							
							draw_set_color(c_white)
							var cit = curIt
							var _m = 0

							if d_pressed() {
								curIt += 2
								if curIt > item_amt(dw) - 1 {curIt = 8}
							}

							if u_pressed() and curIt - 2 > -1 {
								curIt -= 2
								
								if curIt >= item_amt(dw) {
									curIt = item_amt(dw) - 1
									if curIt % 2 == 1 {curIt--}
								}

								if !curIt {curIt = 0}
							}
							if l_pressed() and curIt % 2 == 1 {curIt--}
							if r_pressed() and curIt % 2 == 0 and curIt + 1 < item_amt(dw) {curIt++}
						
							if cit != curIt {audio_play(click)}
						
							var hx = 30
							var hy = 268
						
							if curIt % 2 == 1 {hx += sep}
							if curIt >= 2 {hy += 40}
							if curIt >= 4 {hy += 40}
							if curIt >= 6 {hy += 40}

							if curIt = 8 {
								hx = 30
								hy = 428
							}
						
							if x_pressed() or z_pressed() and curIt = 8 {
								curIt = 0
								scene = 0
							}
								
							if (z_pressed() and curIt < 8 and its[curIt] != tySell) and !delay {
								audio_play(select_1)
								curP = 1
								ex = "main"
							}
						
							draw_font(!j)
							draw_txt(60 + (4 * j),(428 - (4 * j)) + (2 * dj),text("Exit"))
							draw_spr(hspr,0,hx - (6 * j),hy - (4 * j),hsc,hsc,,global.color[0])
						}
						else {
							switch _id {
								default:
									draw_font(1)
									draw_txt(110 + (4 * j),308 - (22 * j),text("s_sellFor_" + string(dw) + "_" + string(_id),global.item[curIt,(3 * dw) + 1],pr[curIt]))
									
									var _op
									_op[0] = "Yes"
									_op[1] = "No"
									
									draw_font(!j)
									for (var i = 0;i < 2;i++) {draw_txt((160 + (220 * i)) + (8 * j),368 + (10 * j),text(_op[i]))}
									
									if l_pressed() or r_pressed() {
										trigger[0] = !trigger[0]
										audio_play(click)
									}
									
									draw_spr(hspr,0,130 + (220 * trigger[0]),370 + (12 * j),hsc,hsc,,global.color[0])
									draw_font(1)
									
									if z_pressed() {
										if !trigger[0] {
											global.item[curIt,3 * dw] = ""
											global.g[dw] += pr[curIt]
											audio_play(buy)
											ex = "happy"
											
											if curIt >= item_amt(dw) {curIt = item_amt(dw) - 1}
											
											if item_amt(dw) < 1 {
												curIt = 0
												scene = 0
											}
										}
										
										curP = 0
										trigger[0] = 0
									}
									
									if x_pressed() {
										curP = 0
										trigger[0] = 0
										ex = "main"
									}
								break
							}
						}
					break
				#endregion
				
				#region CAN'T SELL
					case 2.1:
					case 2.2:
						line = 0
						
						var _txt = "noSell"
						if curBt = 2.2 {_txt = "noItems"}
					
						switch _id {
							default:
								switch trigger[0] {
									case 0:
										a = dial_create((60 - (4 * j)) - (28 * dj),268 + (12 * dj))
										a.preset = -1
										a.m[0] = text("s_" + _txt + "_" + string(_id))
										a.y_sep += 2 * j

										trigger[0] = 1
									break
							
									case 1:
										if !dial_exists() {
											trigger[0] = 0
											curBt = 1
											scene = 0
										}
									break
								}
							break
						}
					break
				#endregion
				
				#region TALK
					case 2:
						if !dial_exists() {
							a = dial_create(460 - (4 * j),268)
							a.preset = -1
							a.finish = 0
							a.snd = shop_snd
							a.m[0] = text("s_TalkMe_" + string(_id))
						}
						
						var _t
						_t[0] = "Talk 1"
						
						switch _id {
							default:
								_t[1] = "Talk 2"
								_t[2] = "Talk 3"
								_t[3] = "Talk 4"
							break
						}
						
						var l = array_length(_t)
						if l > 4 {l = 4}
						
						draw_font(!j)
						draw_set_color(c_white)
						for (var i = 0;i < l;i++) {draw_txt((60 + (4 * j)) + (20 * dj),((268 + (40 * i)) - (4 * j)) + (2 * dj),text(_t[i]))}
						draw_txt((60 + (4 * j)) + (20 * dj),(428 - (4 * j)) + (2 * dj),text("Exit"))
						draw_font(1)
						
						if u_pressed() {
							curIt--
							
							if curIt < 0 {curIt = 4}
							audio_play(click)
						}
						
						if d_pressed() {
							curIt++
							
							if curIt >= l and curIt < 4 {curIt = 4}
							if curIt = 5 {curIt = 0}
							audio_play(click)
						}
						
						draw_spr(hspr,0,30 + (20 * dj),((268 + (40 * curIt)) - (4 * j)) + (6 * dj),hsc,hsc,,global.color[0])
						
						if z_pressed() {
							destroy(dialogue)
							for (var i = 0;i < array_length(trigger);i++) {trigger[i] = 0}

							if curIt < 4 {scene = 2}
							else {
								scene = 0
								curIt = 0
							}
						}
						
						if x_pressed() {
							destroy(dialogue)
							scene = 0
							curIt = 0
						}
					break
				#endregion
			
				#region EXIT
					case 3:
						line = 0
				
						var shop_cya_txt = "* Cya"

						if !dial_exists() {
							a = dial_create((40 - (4 * j)) - (8 * dj),268 + (12 * dj))
							a.preset = -1
							a.snd = shop_snd
							a.m[0] = text(shop_cya_txt)
							a.y_sep += 2 * j
							
							scene = 3
						}
					break
				#endregion
			}
		break
	#endregion
	
	#region TALK CUTSCENE
		case 2:
			line = 0
		
			switch _id {
				default:
					if !trigger[0] {
						a = dial_create((40 - (4 * j)) - (8 * dj),268 + (12 * dj))
						a.preset = -1
						a.m[0] = text("talking_" + string(curIt))
						a.y_sep += 2 * j
						
						trigger[0] = 1
					}
					else {
						if !dial_exists() {scene = 1}
					}
				break
			}
		break
	#endregion

	#region EXIT SHOP
		case 3:
			line = 0
			var map = asset_get_index(global.curRoom)
			var nmus = global.m_name[0]
			global.m_name[2] = nmus

			if !dial_exists() and !fading() {
				f = fade()
				f.m = map
				f.nmus = nmus
				f.X = global.X
				f.Y = global.Y
				f.F = global.F
			}
		break
	#endregion
}

if delay > 0 {delay -= 0.5}

if line {
	draw_font(1)
	draw_set_color(c_white)
	if !dw {draw_rectangle(420 + (20 * j),240,427 + (20 * j),479,0)}

	var gtxt = string(global.g[dw]) + string_upper(text("g_" + string(dw)))

	draw_txt(((460 + (14 * j)) - (20 * dw)) - (10 * dj),(428 - (4 * j)) + (2 * dj),gtxt)
	draw_txt((560 + (16 * j)) - (20 * dj),(428 - (4 * j)) + (2 * dj),string(item_amt(dw)) + "/8")
}