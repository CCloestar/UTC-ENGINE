if !DIE {
<<<<<<< HEAD
	if spr_exists(global.scrSHOT) {
=======
	if sprite_exists(global.scrSHOT) {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		draw_sprite(global.scrSHOT,0,0,0)
		draw_self()
	}
}
else {
	draw_self()
<<<<<<< HEAD
	if spr_exists(global.scrSHOT) {spr_del(global.scrSHOT)}

	switch global.gamemode {
		default:
			timer++

=======
	if sprite_exists(global.scrSHOT) {sprite_delete(global.scrSHOT)}
	
	switch global.gamemode {
		default:
			timer++
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			switch trigger {
				case 0:
					if timer >= 20 {
						sprite_index = heart_broken
						audio_play(heart_break_0)
						timer = 0
						trigger = 1
					}
				break
<<<<<<< HEAD

=======
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				case 1:
					if timer >= 40 {
						audio_play(heart_break_1)
						sprite_index = no_spr
<<<<<<< HEAD

=======
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						i_create(x - 2,y,,shard)
						i_create(x,y + 3,,shard)
						i_create(x + 2,y + 6,,shard)
						i_create(x + 8,y,,shard)
						i_create(x + 10,y + 3,,shard)
						i_create(x + 12,y + 6,,shard)
<<<<<<< HEAD

=======
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						timer = 0
						trigger = 2
					}
				break
<<<<<<< HEAD

=======
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				case 2:
					if timer >= 50 {
						im_dead()

						timer = 0
						trigger = 3
					}
				break
				
				case 3:
					if timer >= 80 {
<<<<<<< HEAD
						a = dial_create(160 - (21 * l_check()),328)
						with (a) {
							preset = -1
							x_sep = 20 - (2 * l_check())
							space_sep = x_sep - (4 * l_check())
							y_sep += 2 * l_check()
							sp = 2
							dw = 0
						}

						if global.hard = 2 {
							a.snd = -1
							a.x_sep = 16
							a.space_sep = 16
							for (var i = 0;i < 4;i++) {a.m[i] = tr($"go_h{i}",str_u(global.pname))}
						}
=======
						a = dial_create(160 - (29 * l_check()),328)
						a.preset = -1
						a.x_sep = 20 - l_check()
						a.space_sep = a.x_sep
						a.sp = 2
						a.dw = 0
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

						timer = 0
						trigger = 4
					}
				break
<<<<<<< HEAD

=======
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				case 4:
					if !dial_exists() and z_pressed() {
						if !i_exists(white_fade) {
							wf = i_create(0,0,,white_fade)
							wf.style = 2
<<<<<<< HEAD
							wf.al[1] = 0.03
							wf.col = c_black
						}
						else {music_vol(,1 - wf.al[0])}
=======
							wf.alphaValue = 0.03
							wf.color = c_black
						}
						else {music_set_volume(,1 - wf.alpha)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					}
				break
			}

			if trigger > 2 {
				if alp < 1 {alp += 0.02}
<<<<<<< HEAD

				var o = #FEFEFE

				draw_font(6)
				draw_set_halign(fa_center)
				draw_txt_outline(330,36,"GAME",#FEFEFE,,alp,alp,,8,,1)
				draw_txt_outline(324,132,"OVER",o,,alp,alp,,8,,1)
=======
				
				var o = #FEFEFE

				draw_font(7)
				draw_set_halign(fa_center)
				draw_txt_outline(330,36,"GAME",#FEFEFE,,alp,alp,,8,8,,,,1)
				draw_txt_outline(324,132,"OVER",o,,alp,alp,,8,8,,,,1)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				draw_set_halign(fa_left)
			}
		break
	}
}

function im_dead() {
<<<<<<< HEAD
	music_play("gameover",,1)
	var sf = global.soulfile

	if global.hard = 2 {
		var att = 0

		if f_exists(sf) {
			ini_open(sf)
				att = load_real("h_a",att,str_l(global.soul_name))
=======
	music_play("mus_gameover",,1)

	if global.hard = 2 {
		var att = 0
					
		if file_exists(global.soulfile) {
			ini_open(global.soulfile)
				att = ini_read_real(string_lower(global.soul_name),"h_a",att)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			ini_close()
		}

		att++

<<<<<<< HEAD
		ini_open(sf)
			save_file(att,"h_a",0,sf)
=======
		ini_open(global.soulfile)
			save_file(att,"h_a",0,global.soulfile)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		ini_close()
	}	
}