if !DIE {
	if sprite_exists(global.scrSHOT) {
		draw_sprite(global.scrSHOT,0,0,0)
		draw_self()
	}
}
else {
	draw_self()
	if sprite_exists(global.scrSHOT) {sprite_delete(global.scrSHOT)}
	
	switch global.gamemode {
		default:
			timer++
		
			switch trigger {
				case 0:
					if timer >= 20 {
						sprite_index = heart_broken
						audio_play(heart_break_0)
						timer = 0
						trigger = 1
					}
				break
				
				case 1:
					if timer >= 40 {
						audio_play(heart_break_1)
						sprite_index = no_spr
						
						i_create(x - 2,y,,shard)
						i_create(x,y + 3,,shard)
						i_create(x + 2,y + 6,,shard)
						i_create(x + 8,y,,shard)
						i_create(x + 10,y + 3,,shard)
						i_create(x + 12,y + 6,,shard)
						
						timer = 0
						trigger = 2
					}
				break
				
				case 2:
					if timer >= 50 {
						im_dead()

						timer = 0
						trigger = 3
					}
				break
				
				case 3:
					if timer >= 80 {
						a = dial_create(160 - (29 * l_check()),328)
						a.preset = -1
						a.x_sep = 20 - l_check()
						a.space_sep = a.x_sep
						a.sp = 2
						a.dw = 0

						timer = 0
						trigger = 4
					}
				break
				
				case 4:
					if !dial_exists() and z_pressed() {
						if !i_exists(white_fade) {
							wf = i_create(0,0,,white_fade)
							wf.style = 2
							wf.alphaValue = 0.03
							wf.color = c_black
						}
						else {music_set_volume(,1 - wf.alpha)}
					}
				break
			}

			if trigger > 2 {
				if alp < 1 {alp += 0.02}
				
				var o = #FEFEFE

				draw_font(7)
				draw_set_halign(fa_center)
				draw_txt_outline(330,36,"GAME",#FEFEFE,,alp,alp,,8,8,,,,1)
				draw_txt_outline(324,132,"OVER",o,,alp,alp,,8,8,,,,1)
				draw_set_halign(fa_left)
			}
		break
	}
}

function im_dead() {
	music_play("mus_gameover",,1)

	if global.hard = 2 {
		var att = 0
					
		if file_exists(global.soulfile) {
			ini_open(global.soulfile)
				att = ini_read_real(string_lower(global.soul_name),"h_a",att)
			ini_close()
		}

		att++

		ini_open(global.soulfile)
			save_file(att,"h_a",0,global.soulfile)
		ini_close()
	}	
}