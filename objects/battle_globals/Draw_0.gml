if global.debug {
	for (var i = 0;i < enAmt;i++) {
		if ord_hold(str(i + 1)) {
			if ord_hold("K") {en[i].hp -= irnd(100) * (l_pressed() - r_pressed())}
		}

		if ord_pressed(str(i + 1)) {
			if ord_hold("S") {en[i].spare = !en[i].spare}
			if ord_hold("W") {en[i].wide_dust = !en[i].wide_dust}
		}
	}

	if ord_pressed("A") {bfade = !bfade}
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
	}
#endregion

var lh = 32 + (4 * l_check())
var ast = l_check() ? "＊" : "*"

var monsters = [
	tr("Toriel")
]

if ar_contains(monsters,_n) {
	destroy(act)

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

	can_select[2] = item_amt()
	if scene > -1 and !remain {b_scene(-1)}

	switch scene {
		case -9:
			it = dial_create(52,278)
			with (it) {
				preset = -1
				snd = dial_alt
				x_sep = 8
				space_sep = 8
				image_xscale = 1
				image_yscale = 1
				m = [tr("* But nobody came.")]
			}

			scene--
		break

		case -1:
			if !i_exists(b_runner) {
				var g_tp = floor(global.tp / 10) * global.curCh
				var arm

				b_gold += g_tp
				global.g[dw] += g_tp

				music_stop(0)
				curBt = -1

				var _lv = "* Your LOVE increased."

				var mult = ""
				if b_gold != 1 {mult = "s"}

				var wtxt = tr($"wintxt{dw}",b_xp,b_gold,mult)
				if lv_up {wtxt += $"&&{tr(_lv)}"}

				it = dial_create(52,278)
				it.preset = -1
				it.finish = 1
				it.snd = dial_alt
				it.m = [wtxt]

				for (var i = 0;i < 3;i++) {
					if global.hp[i,dw] < 0 {global.hp[i,dw] = ceil(global.maxhp[i,dw] / 6)}
				}

				scene = -10
			}
		break

		case -10:
			if !dial_exists() {
				fade()

				with (end_fade) {
					al[1] = 0.06
					if !global.bstory and heart.scene != -2 {al[1] = 10}

					music_vol(global.music[0],1 - al[0])
					m = a_index(global.curRoom)
				}
			}
		break

		case 0:
			if !dial_exists() {
				it = dial_create(52,278)
				it.preset = -1
				it.finish = 0
				it.snd = dial_alt
				it.m = [tr(btxt)]
			}

			if l_pressed() or r_pressed() {
				curBt += r_pressed() - l_pressed()
				audio_play(click)
			}

			curBt %= 4
			if curBt < 0 {curBt = 3}

			if z_pressed() and !d {
				if can_select[curBt] {
					heart.x = 64
					curIt = 0

					if btID[curBt] < 2 {						
						heart.y = 278 - l_check()

						if en[0].dead {
							heart.y = (278 + lh) - l_check()
							curIt = 1
						}

						if enAmt > 1 {
							if en[1].dead and en[0].dead {
								heart.y = (278 + (lh * 2)) - l_check()
								curIt = 2
							}
						}
					}
					else {heart.y = 278 - l_check()}

					dial_destroy()
					load_button_txts()

					p = 0
					d = 1
					scene++
				}

				audio_play(a_index($"select_{can_select[curBt]}"))
			}
		break

		case 1:
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
								}
							}
						}

						if d_pressed() and curIt < enAmt - 1 {
							if !en[curIt + 1].dead {
								curIt++
								heart.y += lh
								audio_play(click)
							}
							else {
								if curIt + 2 <= enAmt - 1 {
									if !en[curIt + 2].dead {
										curIt += 2
										heart.y += lh * 2
										audio_play(click)
									}
								}
							}
						}

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

						if z_pressed() and !d {
							dial_destroy()
							d = 1
							fight_xx = board.l[1] + irnd_r(240,420,2)

							if btID[curBt] = 1 {
								heart.y = 278 - l_check()

								var pp
								var che
								var checo

								for (var i = 0;i < arlen(en[curIt].a) + 1;i++) {
									pp[i,0] = 100 + (256 * (i % 2 == 1))
									pp[i,1] = 278 + (lh * (ceil((i + 1) / 2) - 1))

									che[0] = tr("* Check")
									checo[0] = c_white

									if i {
										che[i] = en[curIt].a[i - 1,0]
										checo[i] = en[curIt].a[i - 1,2]
									}

									ac[i] = dial_create(pp[i,0],pp[i,1])
									ac[i].preset = 1
									ac[i].d_col = checo[i]
									ac[i].m = [che[i]]
								}
							}
							else {
								i_create(0,0,board.depth - 2,fight_1)
								soul_state(-1)
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
							}
							else {audio_play(select_0)}
						}
					break
				#endregion

				#region MERCY
					case 3:
						var limit = canRun

						if u_pressed() {
							if curIt {
								curIt--
								heart.y -= lh
								audio_play(click)
							}
						}

						if d_pressed() {
							if curIt < limit {
								curIt++
								heart.y += lh
								audio_play(click)
							}
						}

						if z_pressed() and !d {
							dial_destroy()
							d = 1

							switch curIt {
								case 0:
									audio_play(select_1)

									for (var i = 0;i < enAmt;i++) {
										if en[i].spare and !en[i].dead {en[i].dead = 2}
									}

									soul_state(-1)
									b_scene(3)
								break

								case 1:
									var rch = rnd(100) + 10 * b_turn

									if rch >= 50 {
										scene = -10
										audio_play(run_away)
										curBt = -1
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
									}
								break
							}
						}
					break
				#endregion
			}

			if x_pressed() and !d {
				dial_destroy()
				curIt = 0
				p = 0
				d = 1
				scene--
			}
		break

		case 2:
			switch btID[curBt] {
				case 1:
					var limit = arlen(en[curIt].a) + 1

					if l_pressed() and curAct % 2 == 1 {
						curAct--
						heart.x = 64
						audio_play(click)
					}

					if u_pressed() and curAct >= 2 {
						curAct -= 2
						heart.y -= lh
						audio_play(click)
					}

					if r_pressed() {
						if curAct % 2 == 0 and curAct + 1 < limit {
							curAct++
							heart.x = 324
							audio_play(click)
						}
					}

					if d_pressed() {
						if curAct + 2 < limit {
							curAct += 2
							heart.y += lh
							audio_play(click)
						}
					}

					if z_pressed() and !d {
						audio_play(select_1)
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
						load_button_txts()
						curAct = 0
						d = 1
						scene--
					}
				break
			}
		break

		case 3:
			switch btID[curBt] {
				case 1:
					if curAct {
						en[curIt].heard = curAct - 1

						switch en[curIt].a[curAct - 1,0] {
							default:
								if !dial_exists() {b_scene(4)}
							break
						}
					}
					else {
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
		break

		case 5:
			if !dial_exists() {
				timer[0] = 0
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
				curIt = 0
				curAct = 0
				b_turn++
				scene = 0
			}
		break
	}

	if d {d -= 0.5}
#endregion