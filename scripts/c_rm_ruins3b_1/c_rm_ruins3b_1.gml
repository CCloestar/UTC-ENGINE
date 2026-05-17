function c_rm_ruins3b_1(){
	var _c = o_mainchara
	var _p1 = o_warnobj
	var _p2 = o_warnobj
	var dvu = (global.story[5] = -1)
	
	mask_lay(toriel_mask,1)
	
	if !global.story[5] {
		switch trigger[0] {
			case 0:
				with (_c) {
					c = 1
					f = 3
					image_speed = 0.2
				}
				
				sprite_index = toriel_3
				image_speed = 0.2
				
				_p1 = i_create(125,110,,o_warnobj)
				_p2 = i_create(170,85,,o_warnobj)
				o_warnobj.visible = 0
				
				i_move(_c,_p1,40)
				i_move(,_p2,40)
				
				trigger[0] = 1
			break
			
			case 1:
				if _c.x = 125 and _c.y = 110 and x = 170 and y = 85 {
					with (_c) {
						f = 2
						image_speed = 0
						image_index = 0
					}
					
					sprite_index = toriel_2_t
					image_speed = 0
					image_index = 0
					
					destroy(_p1)
					destroy(_p2)
					
					a = dial_create()
					for (var i = 0;i < 2;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_15_{i}")
					}
					a.play = 0
					
					trigger[0] = 2
				}
			break
			
			case 2:
				if dial_exists() {
					if a.cur_m {
						sprite_index = toriel_1_t
						_c.f = 3
					}

					image_index = a.talkfr
				}
				else {
					_c.f = 2
					
					_p1 = i_create(146,32,,o_warnobj)
					_p1.visible = 0
					
					i_move(,_p1,30)
					sprite_index = toriel_2
					image_speed = 0.2
					
					trigger[0] = 3
				}
			break
			
			case 3:
				if i_exists(_p1) {
					if abs(x - 146) <= 1 and abs(y - 32) <= 1 {
						sprite_index = tori_pull
						image_speed = 0
						
						x = 143
						y = 36

						destroy(_p1)
						
						shake_tori()
					}
				}
				else {
					timer[0]++
					
					var tim = 38 - timer[2]
					
					if timer[0] >= 60 + (tim * timer[1]) {
						shake_tori(1 + (timer[2] * 0.008))
						timer[1]++
						timer[2] += 2
					}
					
					if timer[0] >= 66 + (tim * timer[1]) or !audio_is_playing(bump) {image_index = 1}
				
					if timer[2] = 6 {
						a = dial_create()
						a.c = ["Toriel"]
						a.m = [tr("* Come on...")]
						a.e = [11]
						a.mo = [t_m_static]
						a.play = 0
						
						timers_reset()
						trigger[0] = 4
					}
				}
			break
			
			case 4:
				if dial_exists() {image_index = 1} 
				else {
					if timer[0] < 90 {
						if timer[0] % 20 == 0 {shake_tori()}
						if timer[0] % 26 == 0 {image_index = 1}
					}
					
					timer[0]++
					
					if timer[0] >= 120 {
						sprite_index = toriel_2_t
						x = 146
						y = 32
						
						a = dial_create()
						for (var i = 0;i < 6 - (3 * dvu);i++) {
							a.c[i] = "Toriel"
							a.m[0] = tr("tori_16_0")
							if i {a.m[i] = tr($"tori_16_{dvu}_{i}")}
							a.e[i] = 16 + (3 * dvu)
							a.mo[i] = t_m_static
							a.mo_f[i] = 8 - (5 * dvu)
						}
						a.c[0] = ""
						a.snd = dial_toriel
						if !dvu {
							a.e[1] = 49
							a.e[4] = 49
							a.e[5] = 4
							a.mo[1] = t_m_up3
							a.mo[4] = t_m_up3
							a.mo[5] = t_m_up4
						}
						a.play = !dvu

						timers_reset()
						trigger[0] = 5
					}
				}
			break
			
			case 5:
				if dial_exists() {
					if !dvu {
						a.pit = 1
					
						if a.cur_m {
							if a.cur_m = 1 and !dvu {a.pit = 1.1}
						
							sprite_index = tori_giggle
							image_speed = 0.2
						}
					}
					else {
						if a.cur_m {
							sprite_index = tori_worry_2
							image_index = 2
						}
					}
					
					if a.cur_m = 5 {
						sprite_index = toriel_0_t
						image_speed = 0
						image_index = a.talkfr
					}
				}
				else {trigger[0] = 7 - dvu}
			break
			
			case 6:
				if !timer[1] {
					if !timer[0] {
						sprite_index = toriel_2_t
						image_speed = 0
						
						audio_play(alert_0,,,0.6)
						_p1 = i_create(x + 10,y - 11,depth - 10,o_warnobj)
					}
					
					timer[0]++
					
					if timer[0] >= 20 {
						a = dial_create()
						for (var i = 0;i < 2;i++) {
							a.c[i] = "Toriel"
							a.m[i] = tr($"tori_16_1_{i + 3}")
						}

						destroy(_p1)
						timer[1] = 1
						
						sprite_index = tori_giggle
						image_speed = 0.2
					}
				}
				else {
					if !dial_exists() {trigger[0] = 7}
					else {
						if a.cur_m = 4 {
							sprite_index = toriel_2_t
							image_speed = 0
							image_index = a.talkfr
						}
					}
				}
			break
			
			case 7:
				end_cuts(5,0.1)
			
				sprite_index = toriel_0
				image_speed = 0.2
				y += 3

				if y > room_height {
					end_cuts(5)
					destroy()
				}
			break
		}
	}
	else {destroy()}
}

function shake_tori(_p = 1) {
	image_index = 0
	shake(0,2,,1)
	audio_play(bump,,,,,_p)
}