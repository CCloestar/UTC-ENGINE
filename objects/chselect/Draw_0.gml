<<<<<<< HEAD
draw_rec(-5,-5,room_width + 5,room_height + 5,,c_black)
=======
draw_set_color(c_black)
draw_rectangle(-5,-5,room_width + 5,room_height + 5,0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

if delay > 0 {delay -= 0.5}

for (var t3 = 0;t3 < tt + 1;t3++) {
	if s[t3,1] != "- -" {t2 = t3}
}

var t4 = t2 + 1
var st = 8
<<<<<<< HEAD
draw_font(1)
=======
var j = 4 * l_check()
draw_font(!j)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

switch global.gamemode {
	default: //UNDERTALE
		#region interface
			draw_set_halign(fa_center)
<<<<<<< HEAD
			draw_col(c_white)
			draw_txt(hw,(24 - yy) - ((ys * 2) * can),tr("SELECT A SOUL"))
=======
			draw_set_color(c_white)
			draw_txt(half_width,(24 - yy) - ((ys * 2) * can) - j,text("SELECT A SOUL"))
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		#endregion

		#region souls and controls
			switch can {
				case 0:
					if !cur_page {
<<<<<<< HEAD
						draw_col(cur_page = -1 ? c_yellow : c_white)
						draw_txt(hw,442 + yy,tr("QUIT"))
					}

					draw_set_halign(fa_left)

					switch cur_page {
						case 0:
							if dir_pressed() {audio_play(click,,,0.5)}
							cur_op -= (l_pressed() - r_pressed())
							if cur_op < 0 {cur_op = t2}
							if cur_op > t2 {cur_op = 0}

							if z_pressed() and !delay {
								audio_play(select_1,,,0.5)
								cur_page = 1
								cur_sel = 0
								delay = 1
							}

							if d_pressed() or u_pressed() {cur_page = -1}
						break

						case 1:
							for (var i = 0;i < 2;i++) {
								var bt = [tr("Play"),tr("Do Not")]
								draw_col(cur_sel = i ? c_yellow : c_white)
								draw_txt_outline(102 + (380 * i),358,str_u(bt[i]),,,xs,xs)
							}

=======
						draw_set_color(c_white)

						if cur_page = -1 {draw_set_color(c_yellow)}
						draw_txt(half_width,442 + yy,string_upper(text("Quit")))
					}
			
					draw_set_halign(fa_left)
				
					switch cur_page {
						case 0:
							if dir_pressed() {audio_play(click,,,0.5)}
							
							if l_pressed() {
								if cur_op > 0 {cur_op--}
								else {cur_op = t2}
							}
							
							if r_pressed() {
								if cur_op < t2 {cur_op++}
								else {cur_op = 0}
							}
							
							if z_pressed() and !delay {
								audio_play(select_1,,,0.5)
								cur_page = 1
								delay = 1
							}
							
							if d_pressed() or u_pressed() {cur_page = -1}
						break
						
						case 1:
							draw_set_color(c_white)
							if !cur_sel {draw_set_color(c_yellow)}
							draw_txt_outline(102,358 - j,string_upper(text("Play")),,,xs,xs)
			
							draw_set_color(c_white)
							if cur_sel {draw_set_color(c_yellow)}
							draw_txt_outline(482,358 - j,string_upper(text("Do Not")),,,xs,xs)
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							if l_pressed() or r_pressed() {
								audio_play(click,,,0.5)
								cur_sel = !cur_sel
							}

							if x_pressed() {
								cur_page = 0
								cur_sel = 0
							}

							if z_pressed() and !delay {
								delay = 1

								if !cur_sel {
									audio_play(select_1,,,0.5)
									can = 1
									faderer = 1
								}
								else {
									cur_page = 0
									cur_sel = 0
								}
							}
						break
<<<<<<< HEAD

=======
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						case -1:
							if d_pressed() or u_pressed() {
								audio_play(click,,,0.5)
								cur_page = 0
							}
<<<<<<< HEAD

=======
							
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							if z_pressed() and !delay {
								audio_play(select_1,,,0.5,,0.8)
								game_end()
							}
						break
					}
				break
			}

			rot -= angle_difference(rot,-cur_op * (360 / t4)) / 5

			var pr,p
			p = 0
			pr = ds_priority_create()
<<<<<<< HEAD

=======
			
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			repeat (t4) {
				ds_priority_add(pr,p,lengthdir_y(1, (rot - 90) + p * (360 / t4)))
				p++
			}
<<<<<<< HEAD

			fly[p] = 0
			fly[cur_op * (cur_op > -1)]++

			var sx,sy,syy

=======
			
			fly[p] = 0
			fly[cur_op * (cur_op > -1)]++
			
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			repeat (t4) {
				p = ds_priority_delete_min(pr)
				var wid = 500
				var hei = 52
				var rotdiv = (rot - 90) + p * (360 / t4)
<<<<<<< HEAD
				var pos = [hw - 16,hh - 10]

				var lwid = lengthdir_x(wid / 2,rotdiv)
				var lhei1 = lengthdir_y((hei) / 2,rotdiv)

				sx = (pos[0] + lwid) + cos(fly[p] / 9) * 1.2
				sy = (pos[1] + lhei1) + sin(fly[p] / 9) * 3

=======
				var pos
				pos[0,0] = half_width - 16
				pos[0,1] = half_height - 10

				var lwid = lengthdir_x(wid / 2,rotdiv)
				var lhei1 = lengthdir_y((hei) / 2,rotdiv)
				
				var sx = (pos[0,0] + lwid) + cos(fly[p] / 9) * 1.2
				var sy = (pos[0,1] + lhei1) + sin(fly[p] / 9) * 3
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				var selme = 0
				selme = can * (cur_op = p)

				if cur_op = p and cur_page != -1 {
					draw_set_halign(fa_center)
<<<<<<< HEAD
					draw_col(c_white)
					draw_txt_outline(sx + spr_w(ch[p,1]) + 2,((sy + (yy * 2)) + ((ys * 2) * !selme) - (spr_h(ch[p,1]) + 16)) + 8,tr(s[p,0]),c_white,,xs,xs,,1)
					draw_set_halign(fa_left)
				}

				syy = ((sy + (yy * 2)) + ((ys * 2) * !selme)) - (rise * (cur_op = p))

				draw_spr(ch[p,1],0,sx + spr_x(ch[p,1]),syy + spr_y(ch[p,1]),2,0,c[p,l[p]],1)
				draw_spr(ch[p,1],0,sx + spr_x(ch[p,1]),syy + spr_y(ch[p,1]),2,0,c_black,0.5 * (cur_op != p))
=======
					draw_set_color(c_white)
					draw_txt_outline(sx + sprite_get_width(ch[p,1]) + j,((sy + (yy * 2)) + ((ys * 2) * !selme) - (sprite_get_height(ch[p,1]) + 16)) + (8 - j),text(s[p,0]),c_white,,xs,xs,,1,1)
					draw_set_halign(fa_left)
				}

				var syy = ((sy + (yy * 2)) + ((ys * 2) * !selme)) - (rise * (cur_op = p))

				draw_sprite_ext(ch[p,1],0,sx + sprite_get_xoffset(ch[p,1]),syy + sprite_get_yoffset(ch[p,1]),2,2,0,c[p,l[p]],1)
				draw_sprite_ext(ch[p,1],0,sx + sprite_get_xoffset(ch[p,1]),syy + sprite_get_yoffset(ch[p,1]),2,2,0,c_black,0.5 * (cur_op != p))
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			}

			ds_priority_destroy(pr)
		#endregion

		#region fade effects
<<<<<<< HEAD
			var ax = spr_w(ch[cur_op,1])
			var ay = spr_h(ch[cur_op,1])

=======
			var ax = sprite_get_width(ch[cur_op,1])
			var ay = sprite_get_height(ch[cur_op,1])
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			if faderer < 2 {
				a = lerp(a,0,0.06)
				col = surface_getpixel(application_surface,sx + ax,syy + ay)
			}

			switch faderer {
				case 0:
					yy = lerp(yy,0,0.14)
				break
<<<<<<< HEAD

=======
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				case 1:
					ys += (ys / 8)
					if xs > 0 {xs -= 0.2}
					if rise < 30 {rise += 2}

<<<<<<< HEAD
					if music_exists(global.music[1]) {music_vol(,music_vol(,-1) - 0.05)}

					switch trigger {
						case 0:
							if ys >= 120 {timer++}

=======
					if music_exists(global.music[1]) {music_set_volume(,music_get_volume() - 0.05)}
				
					switch trigger {
						case 0:
							if ys >= 120 {timer++}
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							if timer >= 30 {
								global.curCh = ch[cur_op,0]
								ch_sound()
								audio_play(heart_create_0)
								trigger = 1
								timer = 0
							}
						break
<<<<<<< HEAD

=======
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						case 1:
							can2 += 0.5

							if !global.simpleVFX {
								for (var i = 0;i < 12;i++) {
									gpu_set_blendmode(bm_add)
<<<<<<< HEAD
										var al = can2 / 16 - i / 12
										draw_rec(320 - i * i - can2 * i,-5,320 + i * i + can2 * i,500,,col,al)
										draw_rec(320 - i * i - (can2 / 2) * i,-5,320 + i * i + (can2 / 2) * i,500,,c_white,al)
									gpu_set_blendmode(bm_normal)
								}
							}
							else {
								draw_alp(can2 / 20)

								gpu_set_blendmode(bm_add)
									draw_rec(-5,-5,room_width + 5,room_height + 5,,c_white)
								gpu_set_blendmode(bm_normal)
							}

=======
										draw_set_color(col)
										draw_set_alpha(can2 / 16 - i / 12)
										draw_rectangle(320 - i * i - can2 * i,-5,320 + i * i + can2 * i,500,0)
										draw_set_color(c_white)
										draw_rectangle(320 - i * i - (can2 / 2) * i,-5,320 + i * i + (can2 / 2) * i,500,0)
									gpu_set_blendmode(bm_normal)
									draw_set_alpha(1)
								}
							}
							else {
								draw_set_alpha(can2 / 20)
								
								gpu_set_blendmode(bm_add)
									draw_set_color(c_white)
									draw_rectangle(-5,-5,room_width + 5,room_height + 5,0)
								gpu_set_blendmode(bm_normal)
							}
							
							draw_set_alpha(1)
							
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							if !audio_is_playing(heart_create_0) {faderer = 2}
						break
					}
				break
<<<<<<< HEAD

				case 2:
					draw_rec(-5,-5,room_width + 5,room_height + 5,,c_white)
					a = lerp(a,1,0.125)

=======
				
				case 2:
					draw_set_color(c_white)
					draw_rectangle(-5,-5,room_width + 5,room_height + 5,0)
					a = lerp(a,1,0.125)
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					if a >= 1 {game_go()}
				break
			}
		#endregion
	break
}

<<<<<<< HEAD
draw_rec(-5,-5,room_width + 5,room_height + 5,,c_black,a)
=======
draw_set_alpha(a)
draw_set_color(c_black)
draw_rectangle(-5,-5,room_width + 5,room_height + 5,0)
draw_set_alpha(1)

function ch_sound() {
	chsnd = heart_create_1
	
	var ech = 0
	var e_amt = 0.8
	var e_dest_sp = 0.2
	var e_dest = 1

	var exsnd = loc + s[global.curCh,1] + "/chSnd"

	if file_exists(exsnd) {chsnd = audio_create_stream(exsnd)}
	else {
		if !ech {audio_play(chsnd)}
		else {audio_play_echo(chsnd,,,,,,e_amt,e_dest_sp,e_dest)}
	}
}

function game_go() {
	var game = @"\Customs\" + string(s[global.curCh,1])

	audio_free()
	game_change(game,"-game data.win")
	
	load_soul()
	window_set_caption("UNDERTALE " + string_upper(global.soul_name)) 
	room_goto(rm_intro)
}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
