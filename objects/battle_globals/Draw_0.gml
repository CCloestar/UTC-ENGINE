if global.debug {
<<<<<<< HEAD
	for (var i = 0;i < enAmt;i++) {
		if ord_hold(str(i + 1)) {
			if ord_hold("K") {en[i].hp -= irnd(100) * (l_pressed() - r_pressed())}
		}

		if ord_pressed(str(i + 1)) {
			if ord_hold("S") {en[i].spare = !en[i].spare}
			if ord_hold("W") {en[i].wide_dust = !en[i].wide_dust}
=======
	if ord_hold("K") {
		for (var i = 0;i < global.enAmt;i++) {
			if ord_pressed(string(i + 1)) {en[i].hp -= irandom(100)}
		}
	}
	
	if ord_hold("S") {
		for (var i = 0;i < global.enAmt;i++) {
			if ord_pressed(string(i + 1)) {en[i].spare = !en[i].spare}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		}
	}

	if ord_pressed("A") {bfade = !bfade}
<<<<<<< HEAD
=======
	
	if ord_hold("W") {
		for (var i = 0;i < global.enAmt;i++) {
			if ord_pressed(string(i + 1)) {en[i].wide_dust = !en[i].wide_dust}
		}
	}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}

if !killer {
	if bfade {
		if image_alpha <= 0.5 {image_alpha = 0.5}
		image_alpha -= 0.04
		b_enemy.depth = depth + 1
	}
	else {
		if image_alpha >= 1 {
			image_alpha = 1
			b_enemy.depth = depth - 1
		}
		image_alpha += 0.04
	}
}

<<<<<<< HEAD
draw_rec(-5,-5,room_width + 5,room_height + 5,,c_black,1 - image_alpha)
item_check()
var unf = (global.hard = 2)

#region DRAW HUD
	draw_col(c_white)

	var n,_n,js,lv,jx,hp,hp_w,hp_t
	n = global.pname
	_n = l_check() ? draw_name(n,6) : str_u(draw_name(n,6))
	js = 3 - (2 * l_name())

	lv = global.lv

	hp = [global.maxhp[0,dw],global.hp[0,dw]]
	hp_w = [275 + (hp[0] * 1.2),275 + (hp[1] * 1.2)]
	hp_t = ""

	if !unf {
		if hp[1] < 10 {hp_t += "0"}
		hp_t += $"{hp[1]} / {hp[0]}"
	}

	draw_col(c_white)
	draw_font(4 + (5 * (l_name() or l_check())))
	draw_txt(30,403,_n,js)

	jx = !l_name() ? (str_w(_n) * 3) : (11.85714286 * strlen(n))

	draw_font(4)
	draw_txt(30 + jx,403,$"   {tr("LV")} {lv}",3)
	draw_txt(hp_w[0] + 15,403,hp_t,3)

	if !unf {
		draw_font(7)
		draw_txt(244,405,tr("HP"),1)

		for (var i = 0;i < 2;i++) {draw_rec(275,400,hp_w[i],420,,make_rgb(,[255,255 * i,0]))}
=======
draw_set_color(c_black)
draw_set_alpha(1 - image_alpha)
draw_rectangle(-5,-5,room_width + 5,room_height + 5,0)
draw_set_alpha(1)

load_d_dw()
item_check()

#region DRAW HUD
	draw_set_color(c_white)
	
	var name,lv,my_hp,my_mhp,hpb,mhpb,namm,hp,mhp,jpsc
	
	name = text(global.pname)

	lv = global.lv
	my_hp = global.hp[0,dw]
	my_mhp = global.maxhp[0,dw]

	hpb = 275 + (my_hp * 1.2)
	mhpb = 275 + (my_mhp * 1.2)
	
	draw_font(4 - j_name(),j_name())
	namm = string_upper(draw_name(name,6))

	if l_check() {namm = draw_name(name,6)}

	jpsc = 3 - (2 * j_name())
	
	draw_txt(30,403 + j_name(),namm,jpsc,jpsc)
	
	draw_font(4)
	var jpx = 30 + (string_width(namm) * 3)
	if j_name() {jpx = 30 + (11.85714286 * string_length(namm))}

	draw_txt(jpx,403,"   " + text("LV") + " " + string(lv),3,3)

	if global.hard < 2 {
		hp = string(my_hp)
		mhp = string(my_mhp)
	
		if my_hp < 10 {hp = "0" + string(my_hp)}
		if my_mhp < 10 {mhp = "0" + string(my_mhp)}
		
		if my_hp <= 0 {
			my_hp = 0
			hp = "00"
		}
		
		if my_mhp <= 0 {
			my_mhp = 0
			mhp = "00"
		}
	
		var hptxt = hp + " / " + mhp
	
		var krcol = c_white
		var curhp = my_hp

		draw_set_color(krcol)
		draw_txt(mhpb + 15,403,hptxt,3,3)
	
		draw_font(7,1)
		draw_set_color(c_white)
		draw_txt(244,405,text("HP"),1,1)

		draw_set_color(c_red)
		draw_rectangle(275, 400,mhpb, 420,0)

		draw_set_color(c_yellow)
		draw_rectangle(275, 400,hpb, 420,0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	}
#endregion

var lh = 32 + (4 * l_check())
<<<<<<< HEAD
var ast = l_check() ? "＊" : "*"

var monsters = [
	tr("Toriel")
]

if ar_contains(monsters,_n) {
	destroy(act)

=======

var monsters = [
	text("Toriel")
]

if array_contains(monsters,name) {
	destroy(act)
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	if !i_exists(magic) {
		butt[1] = i_create(185,432,depth + 1,magic)
		btID[1] = 4
	}
}
else {
	destroy(magic)
	
	if !i_exists(act) {
		butt[1] = i_create(185,432,depth + 1,act)
		btID[1] = 1
	}
}

#region FUNCTIONS
	level_up()

<<<<<<< HEAD
	can_select[2] = item_amt()
	if scene > -1 and !remain {b_scene(-1)}
=======
	can_select[2] = item_amt(dw)
	
	if scene > -1 and !remain {set_scene(-1)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

	switch scene {
		case -9:
			it = dial_create(52,278)
<<<<<<< HEAD
			with (it) {
				preset = -1
				snd = dial_alt
				x_sep = 8
				space_sep = 8
				image_xscale = 1
				image_yscale = 1
				m = [tr("* But nobody came.")]
			}
=======
			it.preset = -1
			it.snd = dial_alt
			it.x_sep = 8
			it.space_sep = 8
			it.image_xscale = 1
			it.image_yscale = 1
			it.m[0] = text("* But nobody came.")
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

			scene--
		break

		case -1:
			if !i_exists(b_runner) {
				var g_tp = floor(global.tp / 10) * global.curCh
				var arm

<<<<<<< HEAD
=======
				for (var i = 0;i < fl_max() + 1;i++) {
					arm[i] = global.arm[i,dw]

					if arm[i] = "Lucky Ribbon" {
						var l_ex = floor((global.area * 1.5) / (heart.hits + 1))
					
						if !l_ex {l_ex = 0}
					
						g_tp += l_ex
					}
				}

>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				b_gold += g_tp
				global.g[dw] += g_tp

				music_stop(0)
				curBt = -1
<<<<<<< HEAD

=======
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				var _lv = "* Your LOVE increased."

				var mult = ""
				if b_gold != 1 {mult = "s"}

<<<<<<< HEAD
				var wtxt = tr($"wintxt{dw}",b_xp,b_gold,mult)
				if lv_up {wtxt += $"&&{tr(_lv)}"}
=======
				var wtxt = text("wintxt" + string(dw),b_xp,b_gold,mult)
				if lv_up {wtxt += "&&" + text(_lv)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

				it = dial_create(52,278)
				it.preset = -1
				it.finish = 1
				it.snd = dial_alt
<<<<<<< HEAD
				it.m = [wtxt]

				for (var i = 0;i < 3;i++) {
					if global.hp[i,dw] < 0 {global.hp[i,dw] = ceil(global.maxhp[i,dw] / 6)}
				}
=======
				it.m[0] = wtxt
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

				scene = -10
			}
		break

		case -10:
			if !dial_exists() {
				fade()
<<<<<<< HEAD

				with (end_fade) {
					al[1] = 0.06
					if !global.bstory and heart.scene != -2 {al[1] = 10}

					music_vol(global.music[0],1 - al[0])
					m = a_index(global.curRoom)
=======
			
				with (end_fade) {
					alphaValue = 0.06
					if !global.bstory and heart.scene != -2 {alphaValue = 10}

					music_set_volume(global.music[0],musicFadeOut)
					m = asset_get_index(global.curRoom)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				}
			}
		break

		case 0:
			if !dial_exists() {
				it = dial_create(52,278)
				it.preset = -1
				it.finish = 0
				it.snd = dial_alt
<<<<<<< HEAD
				it.m = [tr(btxt)]
			}

			if l_pressed() or r_pressed() {
				curBt += r_pressed() - l_pressed()
				audio_play(click)
			}

			curBt %= 4
			if curBt < 0 {curBt = 3}

=======
				it.m[0] = text(btxt)
			}
	
			if l_pressed() {
				audio_play(click)
			
				if curBt {curBt--}
				else {curBt = 3}
			}
		
			if r_pressed() {
				audio_play(click)
			
				if curBt < 3 {curBt++}
				else {curBt = 0}
			}
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			if z_pressed() and !d {
				if can_select[curBt] {
					heart.x = 64
					curIt = 0

					if btID[curBt] < 2 {						
						heart.y = 278 - l_check()
<<<<<<< HEAD

=======
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						if en[0].dead {
							heart.y = (278 + lh) - l_check()
							curIt = 1
						}

<<<<<<< HEAD
						if enAmt > 1 {
=======
						if global.enAmt > 1 {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							if en[1].dead and en[0].dead {
								heart.y = (278 + (lh * 2)) - l_check()
								curIt = 2
							}
						}
					}
					else {heart.y = 278 - l_check()}

<<<<<<< HEAD
					dial_destroy()
					load_button_txts()

=======
					destroy(dialogue)
					load_button_txts()
					audio_play(select_1)
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					p = 0
					d = 1
					scene++
				}
<<<<<<< HEAD

				audio_play(a_index($"select_{can_select[curBt]}"))
=======
				else {audio_play(select_0)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			}
		break

		case 1:
<<<<<<< HEAD
			switch btID[curBt] {
				#region FIGHT and ACT
					case 1:
					case 0:
						var showhps,ww,xbar,nams
						showhps = (btID[curBt] = 0)
						ww = 0
						xbar = 190

						for (var i = 0;i < arlen(f);i++) {
							if strlen(nam) < strlen(f[i].m[0]) {nam = f[i].m[0]}
							ww = strlen(nam) * 16
							xbar = 190 + ww
						}

						if showhps {
							for (var i = 0;i < enAmt;i++) {
								if en[i].showhp and !en[i].dead {
									draw_rec(xbar,280 + (lh * i),xbar + 100,296 + (lh * i),,c_red)
									draw_rec(xbar,280 + (lh * i),xbar + ((en[i].hp / en[i].maxhp) * 100),296 + (lh * i),,c_lime)
=======
			var showhps,ww,xbar,nams
			showhps = (btID[curBt] = 0)
			ww = 0
			xbar = 190
			nams[0] = ""
			nams[1] = ""
			nams[2] = ""
			
			for (var i = 0;i < global.enAmt;i++) {
				nams[i] = text(en[i].name)

				if global.enAmt > 1 {
					if nams[1] = nams[0] {
						nams[0] += " A"
						nams[1] += " B"
					}
				}
	
				if global.enAmt > 2 {
					if nams[2] != nams[0] and nams[1] = nams[0] {
						nams[0] += " A"
						nams[1] += " B"
					}
					
					if nams[2] = nams[0] and nams[1] != nams[0] {
						nams[0] += " A"
						nams[2] += " B"
					}
					
					if nams[2] = nams[0] and nams[1] = nams[0] {
						nams[0] += " A"
						nams[1] += " B"
						nams[2] += " C"
					}
				}

				if string_length(nam) < string_length(nams[i]) {nam = nams[i]}
				ww = string_length(nam) * 16
				xbar = 190 + ww
			}

			switch btID[curBt] {
				#region FIGHT and ACT
					case 1:
					case 0:					
						if showhps {
							for (var i = 0;i < global.enAmt;i++) {
								if en[i].showhp and !en[i].dead {
									draw_set_color(c_red)
									draw_rectangle(xbar,280 + (lh * i),xbar + 100,296 + (lh * i),0)
					
									draw_set_color(c_lime)
									draw_rectangle(xbar,280 + (lh * i),xbar + ((en[i].hp / en[i].maxhp) * 100),296 + (lh * i),0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
								}
							}
						}

<<<<<<< HEAD
						if d_pressed() and curIt < enAmt - 1 {
=======
						if d_pressed() and curIt < global.enAmt - 1 {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							if !en[curIt + 1].dead {
								curIt++
								heart.y += lh
								audio_play(click)
							}
							else {
<<<<<<< HEAD
								if curIt + 2 <= enAmt - 1 {
=======
								if curIt + 2 <= global.enAmt - 1 {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
									if !en[curIt + 2].dead {
										curIt += 2
										heart.y += lh * 2
										audio_play(click)
									}
								}
							}
						}
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						if u_pressed() and curIt {
							if !en[curIt - 1].dead {
								curIt--
								heart.y -= lh
								audio_play(click)
							}
							else {
								if curIt - 2 > -1 {
									if !en[curIt - 2].dead {
										curIt -= 2
										heart.y -= lh * 2
										audio_play(click)
									}
								}
							}
						}
<<<<<<< HEAD

						if z_pressed() and !d {
							dial_destroy()
							d = 1
							fight_xx = board.l[1] + irnd_r(240,420,2)

=======
	
						if z_pressed() and !d {
							destroy(dialogue)
							d = 1
							fight_xx = board.l[1] + irandom_twice(240,420)
							
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							if btID[curBt] = 1 {
								heart.y = 278 - l_check()

								var pp
								var che
								var checo

<<<<<<< HEAD
								for (var i = 0;i < arlen(en[curIt].a) + 1;i++) {
									pp[i,0] = 100 + (256 * (i % 2 == 1))
									pp[i,1] = 278 + (lh * (ceil((i + 1) / 2) - 1))

									che[0] = tr("* Check")
									checo[0] = c_white

=======
								for (var i = 0;i < array_length(en[curIt].a) + 1;i++) {
									pp[i,0] = 100 + (256 * (i % 2 == 1))
									pp[i,1] = 278 + (lh * (ceil((i + 1) / 2) - 1))

									che[0] = text("* Check")
									checo[0] = c_white
									
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
									if i {
										che[i] = en[curIt].a[i - 1,0]
										checo[i] = en[curIt].a[i - 1,2]
									}

									ac[i] = dial_create(pp[i,0],pp[i,1])
									ac[i].preset = 1
									ac[i].d_col = checo[i]
<<<<<<< HEAD
									ac[i].m = [che[i]]
=======
									ac[i].m[0] = che[i]
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
								}
							}
							else {
								i_create(0,0,board.depth - 2,fight_1)
<<<<<<< HEAD
								soul_state(-1)
=======
								heart_state(-1)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							}

							audio_play(select_1)
							scene++
						}
					break
				#endregion

				#region ITEM
					case 2:
						var pager = 4 * p
						var its,n_it
<<<<<<< HEAD

						item_list()

						switch global.fntf {
							default:
								for (var i = 0;i < 4;i++) {
									var _i = global.item[i + pager,(1 + tense) + (3 * dw)]
									its[i] = _i = "" ? "" : $"{ast} {tr(_i)}"
									it[i].m = [its[i]]
								}

								pg.m = [tr("page",p + 1)]
								for (var o = 1;o < 4;o++) {n_it[o - 1] = global.item[curIt + o,3 * dw]}

								if l_pressed() {
									if curIt % 2 == 1 {
										curIt--
										audio_play(click)
										heart.x = 64
									}
									else {
										if p {
											curIt -= 3
											p--
											audio_play(click)
											heart.x = 312
										}
									}
								}

								if u_pressed() and ((curIt - 2) = pager or (curIt - 2) = pager + 1) {
									curIt -= 2
									audio_play(click)
									heart.y = 278
								}

								if r_pressed() {
									if curIt % 2 == 0 {
										if n_it[0] != "" {
											curIt++
											audio_play(click)
											heart.x = 312
										}
									}
									else {
										if n_it[2] != "" {
											curIt += 3
											p++
											audio_play(click)
											heart.x = 64
										}
									}
								}

								if d_pressed() and n_it[1] != "" and curIt < 2 + pager {
									curIt += 2
									audio_play(click)
									heart.y = 310
								}
							break

							case 1:
								for (var i = 0;i < 3;i++) {
									var _i = global.item[i + p,3 * dw]
									its[i] = _i = "" ? "" : $"{ast} {tr(_i)}"
									it[i].m = [its[i]]
								}

								if u_pressed() and curIt {
									audio_play(click)
									curIt--
									heart.y -= lh

									if heart.y < 278 - l_check() {
										if p {p--}
										heart.y = 278 - l_check()
									}
								}

								if d_pressed() and curIt < item_amt() - 1 {
									audio_play(click)
									curIt++
									heart.y += lh

									if heart.y > 342 + (7 * l_check()) {
										if curIt > 2 {p++}
										heart.y = 342 + (7 * l_check())
									}
								}

								if item_amt() > 3 {
									var _y = floor((board.u[0] + board.d[0] / 2) - 127) - 5 * (2 + item_amt())
									var a_y = round(min(((global.time % 30) / 30),0.5) * 6)
									var yy = _y - a_y

									if p {draw_sprite_general(arrow,0,0,5,7,4,587,yy + 5,2,2,-180,c_white,c_white,c_white,c_white,1)}
									_y += 10

									for (var i = 0;i < item_amt();i++) {
										var cur = 3 * (curIt = i)
										draw_rec(578 - cur,_y - cur,581 + cur,(_y + 3) + cur,,c_white)
										_y += 10
									}

									if (p + 3) < item_amt() {draw_sprite_general(arrow,0,0,5,7,4,573,(_y + a_y) - 1,2,2,0,c_white,c_white,c_white,c_white,1)}
								}
							break
						}

						if z_pressed() and !d {
							if can_use {
								dial_destroy()
								soul_state(-1)
								d = 1
								item_use_dial(dw)
								b_scene(3)
=======
						
						item_list()
						
						if !l_check() {
							for (var i = 0;i < 4;i++) {
								its[i] = "* " + text(global.item[i + pager,(1 + tense) + (3 * dw)])
								if global.item[i + pager,(1 + tense) + (3 * dw)] = "" {its[i] = ""}

								it[i].m[0] = its[i]
							}
					
							pg.m[0] = text("page",p + 1)
						
							for (var o = 1;o < 4;o++) {n_it[o - 1] = global.item[curIt + o,3 * dw]}

							if l_pressed() {
								if curIt % 2 == 1 {
									curIt--
									audio_play(click)
									heart.x = 64
								}
								else {
									if p {
										curIt -= 3
										p--
										audio_play(click)
										heart.x = 312
									}
								}
							}
						
							if u_pressed() and ((curIt - 2) = pager or (curIt - 2) = pager + 1) {
								curIt -= 2
								audio_play(click)
								heart.y = 278
							}
						
							if r_pressed() {
								if curIt % 2 == 0 {
									if n_it[0] != "" {
										curIt++
										audio_play(click)
										heart.x = 312
									}
								}
								else {
									if n_it[2] != "" {
										curIt += 3
										p++
										audio_play(click)
										heart.x = 64
									}
								}
							}
						
							if d_pressed() and n_it[1] != "" and curIt < 2 + pager {
								curIt += 2
								audio_play(click)
								heart.y = 310
							}
						}
						else {
							for (var i = 0;i < 3;i++) {
								its[i] = "＊ " + text(global.item[i + p,3 * dw])
								if global.item[i + p,3 * dw] = "" {its[i] = ""}

								it[i].m[0] = its[i]
							}
							
							if u_pressed() and curIt {
								audio_play(click)
								curIt--
								heart.y -= lh
								
								if heart.y < 277 {
									if p {p--}
									heart.y = 277
								}
							}
							
							if d_pressed() and curIt < item_amt() - 1 {
								audio_play(click)
								curIt++
								heart.y += lh
								
								if heart.y > 349 {
									if curIt > 2 {p++}
									heart.y = 349
								}
							}
								
							if item_amt() > 3 {
								var _y = floor((board.u[0] + board.d[0] / 2) - 127) - 5 * (2 + item_amt())
								var a_y = round(min(((global.time % 30) / 30),0.5) * 6)
								var yy = _y - a_y
								
								if p {draw_sprite_general(arrow,0,0,5,7,4,587,yy + 5,2,2,-180,c_white,c_white,c_white,c_white,1)}//draw_sprite_general(arrow,0,0,5,7,9,573,yy,2,2,0,c_white,c_white,c_white,c_white,1)}

								_y += 10
								
								for (var i = 0;i < item_amt();i++) {
									var cur = 3 * (curIt = i)
									
									draw_set_color(c_white)
									draw_rectangle(578 - cur,_y - cur,581 + cur,(_y + 3) + cur,0)
									
									_y += 10
								}

								if (p + 3) < item_amt() {draw_sprite_general(arrow,0,0,5,7,4,573,(_y + a_y) - 1,2,2,0,c_white,c_white,c_white,c_white,1)}//draw_sprite_general(arrow,0,0,5,7,9,573,_y + 10 + a_y,2,2,-180,c_white,c_white,c_white,c_white,1)}
							}
						}
						
						if z_pressed() and !d {
							if can_use {
								destroy(dialogue)
								heart_state(-1)
								d = 1
								item_use_dial(dw)
								set_scene(3)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							}
							else {audio_play(select_0)}
						}
					break
				#endregion
<<<<<<< HEAD

				#region MERCY
					case 3:
						var limit = canRun

=======
			
				#region MERCY
					case 3:
						var limit = canRun
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						if u_pressed() {
							if curIt {
								curIt--
								heart.y -= lh
								audio_play(click)
							}
						}
<<<<<<< HEAD

=======
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						if d_pressed() {
							if curIt < limit {
								curIt++
								heart.y += lh
								audio_play(click)
							}
						}
<<<<<<< HEAD

						if z_pressed() and !d {
							dial_destroy()
=======
					
						if z_pressed() and !d {
							destroy(dialogue)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							d = 1

							switch curIt {
								case 0:
									audio_play(select_1)

<<<<<<< HEAD
									for (var i = 0;i < enAmt;i++) {
										if en[i].spare and !en[i].dead {en[i].dead = 2}
									}

									soul_state(-1)
									b_scene(3)
								break

								case 1:
									var rch = rnd(100) + 10 * b_turn

=======
									for (var i = 0;i < global.enAmt;i++) {
										if en[i].spare and !en[i].dead {en[i].dead = 2}
									}

									heart_state(-1)
									set_scene(3)
								break
						
								case 1:
									var rch = random(100) + 10 * b_turn
							
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
									if rch >= 50 {
										scene = -10
										audio_play(run_away)
										curBt = -1
<<<<<<< HEAD
										soul_state(-2)

										r = dial_create(100,278)
										r.preset = -1
										r.snd = dial_alt
										r.m = [ tr($"{tr_l(global.soul_name)}_e{irnd_r(0,3)}")]
									}
									else {
										audio_play(select_1)
										soul_state(-1)
										b_scene(3)
=======
										heart_state(-2)
								
										var runtxt = text(string_lower(global.soul_name) + "_e" + string(irandom_range(0,3)))
								
										r = dial_create(100,278)
										r.preset = -1
										r.snd = dial_alt
										r.m[0] = runtxt
									}
									else {
										audio_play(select_1)
										heart_state(-1)
										set_scene(3)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
									}
								break
							}
						}
					break
				#endregion
			}
<<<<<<< HEAD

			if x_pressed() and !d {
				dial_destroy()
=======
		
			if x_pressed() and !d {
				destroy(dialogue)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				curIt = 0
				p = 0
				d = 1
				scene--
			}
		break
<<<<<<< HEAD

		case 2:
			switch btID[curBt] {
				case 1:
					var limit = arlen(en[curIt].a) + 1

=======
		
		case 2:
			switch btID[curBt] {
				case 1:
					var limit = array_length(en[curIt].a) + 1
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					if l_pressed() and curAct % 2 == 1 {
						curAct--
						heart.x = 64
						audio_play(click)
					}
<<<<<<< HEAD

=======
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					if u_pressed() and curAct >= 2 {
						curAct -= 2
						heart.y -= lh
						audio_play(click)
					}
<<<<<<< HEAD

=======
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					if r_pressed() {
						if curAct % 2 == 0 and curAct + 1 < limit {
							curAct++
							heart.x = 324
							audio_play(click)
						}
					}
<<<<<<< HEAD

=======
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					if d_pressed() {
						if curAct + 2 < limit {
							curAct += 2
							heart.y += lh
							audio_play(click)
						}
					}

					if z_pressed() and !d {
						audio_play(select_1)
<<<<<<< HEAD
						dial_destroy()

						act_dial()
						soul_state(-1)
						scene++
						d = 1
					}

					if x_pressed() and !d {
						heart.x = 64
						heart.y = (278 + (lh * curIt)) - l_check()
						dial_destroy()
=======
						destroy(dialogue)
						
						act_dial()
						heart_state(-1)
						scene++
						d = 1
					}
				
					if x_pressed() and !d {
						heart.x = 64
						heart.y = (278 + (lh * curIt)) - l_check()
						destroy(dialogue)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						load_button_txts()
						curAct = 0
						d = 1
						scene--
					}
				break
			}
		break
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		case 3:
			switch btID[curBt] {
				case 1:
					if curAct {
						en[curIt].heard = curAct - 1
<<<<<<< HEAD

						switch en[curIt].a[curAct - 1,0] {
							default:
								if !dial_exists() {b_scene(4)}
=======
						
						switch en[curIt].a[curAct - 1,0] {
							default:
								if !dial_exists() {set_scene(4)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							break
						}
					}
					else {
<<<<<<< HEAD
						if !dial_exists() {b_scene(4)}
					}
				break

				default:
					if !dial_exists() {b_scene(4)}
				break
			}
		break

		case 4:
			create_bubble()
			b_scene(5)
=======
						if !dial_exists() {set_scene(4)}
					}
				break
				
				default:
					if !dial_exists() {set_scene(4)}
				break
			}
		break
		
		case 4:
			create_bubble()
			set_scene(5)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		break

		case 5:
			if !dial_exists() {
				timer[0] = 0
<<<<<<< HEAD
				b_scene(6)
			}
			else {
				var fin = 1

				with (dialogue) {
					if draw {fin = 0}
				}

				dialogue.finish = fin

				timer[0]++
				if timer[0] >= 110 {
					for (var i = 0;i < enAmt;i++) {destroy(en[i].bb)}
				}
			}
		break

		case 6:
			if c_hold() and global.debug {scene = 7}
		break

		case 7:
			var b = board
			if i_exists(b_at_parent) {b_at_parent.n = ""}

			for (var i = 0;i < enAmt;i++) {en[i].heard = -1}

			b.preset = 0
			bfade = 0
			soul_state(-1)
			destroy(greenShield)
			destroy(fight_1)
			destroy(at_bar)

			if b.l[1] = 37 and b.r[1] = 601 and b.u[1] = 255 and b.d[1] = 384 {
				with (fight_0) {soul_state(,x + 8,y + 14)}
=======
				set_scene(6)
			}
			else {
				check_bubbles()
				
				timer[0]++
				
				if timer[0] >= 110 {
					for (var i = 0;i < global.enAmt;i++) {destroy(bb[i])}
				}
			}
		break
		
		case 6:
			if c_hold() and global.debug {scene = 7}
		break
		
		case 7:
			var b = board
			
			if i_exists(b_at_parent) {b_at_parent.n = ""}
			
			for (var i = 0;i < global.enAmt;i++) {en[i].heard = -1}

			b.preset = 0
			bfade = 0
			heart_state(-1)
			destroy(greenShield)
			destroy(fight_1)
			destroy(at_bar)
			
			if b.l[1] = 37 and b.r[1] = 601 and b.u[1] = 255 and b.d[1] = 384 {
				with (fight_0) {heart_state(,x + 8,y + 14)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				curIt = 0
				curAct = 0
				b_turn++
				scene = 0
			}
		break
	}

	if d {d -= 0.5}
<<<<<<< HEAD
#endregion
=======
#endregion

function create_bubble(){
	var bx,by,bb_id,bb_pit,bb_sound,bb_dial,bb_vol,bb_font,rand,ens,curens

	curens = en[curIt]
	
	for (var i = 0;i < global.enAmt;i++) {
		ens[i] = en[i]
		bx[i] = ens[i].x + ens[i].sprite_width - 6
		by[i] = ens[i].y
		bb_id[i] = 0
		bb_pit[i] = 1
		bb_sound[i] = dial_main
		bb_vol[i] = 1
		bb_font[i] = 2
		rand[i] = irandom(100)
		bb_dial[i] = "^wdummy&&longtext&&verylong&&text"

		with (ens[i]) {
			var he = (heard > -1)
			
			show_debug_message("ENEMY " +string(i) + " HEARD " + string(heard))
		}
		
		switch global.bstory {
			default:
				if ens[i].dead = 0 {
					bb[i] = dial_create(bx[i],by[i],ens[i].depth - 2)
					
					with (bb[i]) {
						preset = 2
						dw = 0
						finish = 0
						bubble = bb_id[i]
						pit = bb_pit[i]
						snd = bb_sound[i]
						vol = bb_vol[i]
						fnt = bb_font[i]
						m[0] = bb_dial[i]
					}
				}
			break
		}
	}
}

function check_bubbles(){
	switch global.enAmt {
		case 1:
			if !en[0].dead and i_exists(bb[0]) and !bb[0].draw {bb[0].finish = 1}
		break
		
		case 2:
			if !(en[0].dead or en[1].dead) {
				if (i_exists(bb[0]) and !bb[0].draw) and (i_exists(bb[1]) and !bb[1].draw) {
					bb[0].finish = 1
					bb[1].finish = 1
				}
			}
			else {
				if en[0].dead {
					if (i_exists(bb[1]) and !bb[1].draw) {bb[1].finish = 1}
				}
							
				if en[1].dead {
					if (i_exists(bb[0]) and !bb[0].draw) {bb[0].finish = 1}
				}
			}
		break
		
		case 3:
			if !(en[0].dead or en[1].dead or en[2].dead) {
				if (i_exists(bb[0]) and !bb[0].draw)
				and (i_exists(bb[1]) and !bb[1].draw)
				and (i_exists(bb[2]) and !bb[2].draw) {
					bb[0].finish = 1
					bb[1].finish = 1
					bb[2].finish = 1
				}
			}
			else {
				if en[0].dead {
					if !en[1].dead {
						if (i_exists(bb[1]) and !bb[1].draw)
						and (i_exists(bb[2]) and !bb[2].draw) {
							bb[1].finish = 1
							bb[2].finish = 1
						}
					}
					else {
						if (i_exists(bb[2]) and !bb[2].draw) {bb[2].finish = 1}
					}
				}
				
				if en[1].dead {
					if !en[0].dead {
						if (i_exists(bb[0]) and !bb[0].draw)
						and (i_exists(bb[2]) and !bb[2].draw) {
							bb[0].finish = 1
							bb[2].finish = 1
						}
					}
					else {
						if (i_exists(bb[2]) and !bb[2].draw) {bb[2].finish = 1}
					}
				}
				
				
				if en[2].dead {
					if !en[0].dead {
						if (i_exists(bb[0]) and !bb[0].draw)
						and (i_exists(bb[1]) and !bb[1].draw) {
							bb[0].finish = 1
							bb[1].finish = 1
						}
					}
					else {
						if (i_exists(bb[1]) and !bb[1].draw) {bb[1].finish = 1}
					}
					
					if en[1].dead {
						if (i_exists(bb[0]) and !bb[0].draw) {bb[0].finish = 1}
					}
				}
			}
		break
	}
}
	
function load_button_txts(){
	var lh = 32 + (4 * l_check())
	var scol = c_white
	var scolf

	for (var o = 0;o < global.enAmt;o++) {
		scolf[o] = c_white
		
		var sparecol = c_yellow
		
		if global.story[100] {sparecol = #FFBBD4}

		if en[o].spare and !en[o].dead {
			scolf[o] = sparecol
			scol = sparecol
		}
	}
	
	switch btID[curBt] {
		case 1:
		case 0:
			var nams
			nams[0] = ""
			nams[1] = ""
			nams[2] = ""
			
			if global.enAmt > 0 {nams[0] = text(en[0].name)}
			if global.enAmt > 1 {nams[1] = text(en[1].name)}
			if global.enAmt > 2 {nams[2] = text(en[2].name)}
			
			if global.enAmt = 2 {
				if nams[0] = nams[1] {
					nams[0] += " A"
					nams[1] += " B"
				}
			}
				
			if global.enAmt = 3 {
				if nams[2] = nams[0] and nams[1] = nams[0] {
					nams[0] += " A"
					nams[1] += " B"
					nams[2] += " C"
				}
					
				if nams[2] != nams[1] and nams[2] = nams[0] {
					nams[0] += " A"
					nams[2] += " B"
				}
					
				if nams[2] != nams[0] and nams[1] = nams[2] {
					nams[1] += " A"
					nams[2] += " B"
				}
			}
			
			var ast = "* "
			if l_check() {ast = "＊ "}

			for (var i = 0;i < global.enAmt;i++) {
				f[i] = dial_create(100,278 + (lh * i),depth - 10)
				f[i].preset = 1
				f[i].d_col = scolf[i]
				if en[i].dead {f[i].m[0] = ""}
				else {f[i].m[0] = ast + nams[i]}
			}
		break
		
		case 2:
			var pp,its
		
			if !l_check() {
				pg = dial_create(388,342)
				pg.preset = 1
				pg.m[0] = text("page",p + 1)

				for (var i = 0;i < 4;i++) {
					pp[i,0] = 100 + (240 * (i % 2 == 1))
					pp[i,1] = 278 + (lh * (ceil((i + 1) / 2) - 1))
				
					its[i] = "* " + text(global.item[i + (4 * p),(1 + tense) + (3 * dw)])
					if global.item[i + (4 * p),(1 + tense) + (3 * dw)] = "" {its[i] = ""}

					it[i] = dial_create(pp[i,0],pp[i,1])
					it[i].preset = 1
					it[i].m[0] = its[i]
				}
			}
			else {
				for (var i = 0;i < 3;i++) {
					its[i] = "＊ " + text(global.item[i,3 * dw])
					if global.item[i + p,3 * dw] = "" {its[i] = ""}
					
					it[i] = dial_create(92,278 + (lh * i))
					it[i].preset = 1
					it[i].x_sep = 17
					it[i].m[0] = its[i]
				}
			}
		break
		
		case 3:
			s = dial_create(100,278)
			s.preset = 1
			s.reset = 0
			s.d_col = scol
			s.y_sep = lh
			s.m[0] = text("* Spare")

			if canRun {s.m[0] += "~W &&" + text("* Flee")}
		break
	}
}
	
function act_dial(){
	a = dial_create(52,278)
	a.preset = -1
	a.sound = dial_alt

	if curAct {
		var txt = "b_act_" + string(en[curIt]._id) + "_" + string(curAct - 1) + "_" + string(en[curIt].a[curAct - 1,1])

		a.m[0] = text(txt)
		
		if txt = "b_act_2_1_0" {a.m[1] = text("* (Maybe OBSERVE first...?)")}
	}
	else {a.m[0] = en[curIt].desc}
}
	
function level_up(){
	var lv = global.lv

	if lv = 1 {global.next = 10}
	if lv = 2 {global.next = 30}
	if lv = 3 {global.next = 70}
	if lv = 4 {global.next = 120}
	if lv = 5 {global.next = 200}
	if lv = 6 {global.next = 300}
	if lv = 7 {global.next = 500}
	if lv = 8 {global.next = 800}
	if lv = 9 {global.next = 1200}
	if lv = 10 {global.next = 1700}
	if lv = 11 {global.next = 2500}
	if lv = 12 {global.next = 3500}
	if lv = 13 {global.next = 5000}
	if lv = 14 {global.next = 7000}
	if lv = 15 {global.next = 10000}
	if lv = 16 {global.next = 15000}
	if lv = 17 {global.next = 25000}
	if lv = 18 {global.next = 50000}
	if lv = 19 {global.next = 99998}
	if lv = 20 {global.next = 99999}
	
	if global.xp >= global.next {
		global.lv++
		lv_up = 1
		audio_play(lv_plus,,,lv != global.lv)
	}
}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
