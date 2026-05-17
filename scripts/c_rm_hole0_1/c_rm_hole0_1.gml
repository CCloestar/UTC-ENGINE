function c_rm_hole0_1(){
	var _c = o_mainchara
	var _n = o_npc
	var _p = o_warnobj
	var dvu = (global.story[0] = -1)

	if !global.story[0] {
		switch trigger[0] {
			case 0:
				with (_n) {
					dep = 0
					sprite_index = frog_1
					depth = _c.depth + 40
					x = 141
					y = 133
				}
			
				with (_c) {
					f = -1
					sprite_index = chopper_c_0
					image_speed = 0
					x = 139
					y = 123
				}

				sprite_index = tori_worry_0_0
				image_speed = 0
				x = 165
				y = 104
				
				if dvu {
					with (_c) {
						sprite_index = chopper_0
						x = 142
						y = 114
					}
					
					sprite_index = tori_worry_1
					x = 174
					y = 90
				}

				audio_free()
				char_stop()
				cam_pos()

				timer[0]++
			
				if timer[0] >= 60 {
					a = dial_create()
					a.c = ["Toriel"]
					a.m = [tr("* Um... hello?")]
					a.e = [16]
					a.mo = [t_m_down1]
					a.play = 0

					timers_reset()
					trigger[0] = 1
				}
			break
		
			case 1:
				if dial_exists() {image_index = a.talkfr}
				else {
					image_index = 0
					timer[0]++

					if timer[0] >= 40 {
						a = dial_create()
						a.c = ["Toriel"]
						a.m = [tr($"tori_0_0_{dvu}")]
						a.e = [16]
						a.mo = [t_m_down1]
						a.finish = dvu
						a.play = 0

						timers_reset()
						trigger[0] = 2
					}
				}
			break
		
			case 2:
				if !dvu {
					image_index = a.talkfr
				
					if a.length >= 13 {image_index = 2}
					if a.length >= 17 {image_index = 3}
					if a.length >= 23 {image_index = 4}           

					if !a.draw {
						sprite_index = tori_worry_0_1
						image_index = 0
						x = 175
						y = 96

						_c.image_index = 1
						shake(0,2,_c)

						audio_play(dial_toriel,,,,,1.15)
						audio_play(swallow,,,,,1.2)

						destroy(a)
						trigger[0] = 3
					}
				}
				else {
					if dial_exists() {image_index = a.talkfr}
					else {
						image_index = 2

						_c.sprite_index = chopper_c_1
						shake(0,2,_c)

						audio_play(dial_toriel,,,,,1.15)
						audio_play(swallow,,,,,1.2)
						i_create(x + 10,y - 11,depth - 10,o_warnobj)

						trigger[0] = 3
					}
				}
			break
		
			case 3:
				timer[0]++
			
				switch timer[0] {
					case 3:
						image_index = 1 + dvu
					break
				
					case 40:
						with (_c) {
							if !dvu {
								f = 0
								image_index = 0
								x = 142
								y = 114
							}
							else {image_index = 1}

							shake(0,2)
							audio_play(swallow,,,,,1.1)
						}
					break
				
					case 70:
						destroy(o_warnobj)
					
						a = dial_create()
						for (var i = 0;i < 3;i++) {
							a.c[i] = "Toriel"
							a.m[i] = tr($"tori_1_{i}") 
						}
						a.m[0] = tr($"tori_1_0_{dvu}")
						a.e[0] = 2
						a.mo[0] = t_m_up2
						a.play = 0
						_c.image_index = dvu

						timers_reset()
						trigger[0] = 4
					break
				}
			break
		
			case 4:
				if dial_exists() {
					image_index = a.talkfr + 2

					if dvu {
						image_index = a.talkfr + 3
						timer[0] = 4
					}
					
					if sprite_index = tori_worry_2 {image_index = 1}

					if a.cur_m {
						_c.f = 3
						_c.image_index = 0
					}
				}
				else {
					timer[0]++

					if timer[0] >= 3 {image_index = 4}
					if timer[0] >= 6 {image_index = 5}
					if timer[0] >= 9 {
						sprite_index = toriel_1_t
						x = 170
						y = 87

						a = dial_create()
						for (var i = 0;i < 6;i++) {
							a.c[i] = "Toriel"
							a.m[i] = tr($"tori_2_{i}")
						}
						a.e[2] = 4
						a.e[3] = 2
						a.e[4] = 5
						a.e[5] = 2
						a.mo[2] = t_m_up2
						a.mo[4] = t_m_down1
						a.play = 0

						music_play("toriel",,0.86)
						timers_reset()
						trigger[0] = 5
					}
				}
			break
		
			case 5:
				if dial_exists() {image_index = a.talkfr}
				else {
					timer[0]++

					if timer[0] >= 20 {
						sprite_index = tori_worry_2
						image_index = 1
					
						a = dial_create()
						for (var i = 0;i < 2;i++) {
							a.c[i] = "Toriel"
							a.e[i] = 5
							a.mo[i] = t_m_down1
							a.m[i] = tr($"tori_3_{i}")
						}

						a.play = 0

						timers_reset()
						trigger[0] = 6
					}
				}
			break
		
			case 6:
				if !dial_exists() {
					with (_c) {
						f = 0
						image_speed = 0.2
						y += 2
					
						if y >= 150 {
							f = 2
							y = 150
							image_speed = 0
							image_index = 0
							o_cutscene.trigger[0] = 7
						}
					}
				}
			break
		
			case 7:
				timer[0]++
			
				if timer[0] >= 20 {
					if !timer[1] {
						audio_play(poing,,,0.5,,0.9)
						_n.y -= 10
					}

					timer[1]++

					with (_n) {
						dep = 1
						sprite_index = frog_0
						x = 144
					}

					_n.y -= 4 - (timer[1] * 0.6)

					if _n.y >= 125 {
						_n.y = 125
						timers_reset()
						trigger[0] = 8
					}
				}
			break
		
			case 8:
				timer[0]++
			
				if timer[0] >= 20 {
					a = dial_create()
					for (var i = 0;i < 4;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_4_{i}")
					}
					a.c[1] = ""
					a.e[0] = 5
					a.mo[0] = t_m_down1
					a.play = 0
					a.pos = 1

					timers_reset()
					trigger[0] = 9
				}
			break
		
			case 9:
				if dial_exists() {
					if a.cur_m = 2 {sprite_index = toriel_1_t}
					image_index = a.talkfr
					if sprite_index = tori_worry_2 {image_index = 1}
				}
				else {
					image_speed = 0.2
					sprite_index = toriel_0
				
					_p = i_create(242,132,,o_warnobj)
					_p.visible = 0
					i_move(,_p,40)
				
					trigger[0]++
				}
			break
		
			case 10:
				if i_exists(_p) {
					if x >= 242 and y >= 132 {
						sprite_index = toriel_1_t
						cam_pos()
				
						a = dial_create()
						a.c = ["Toriel"]
						a.m = [tr("* Come, this way!")]
						a.pos = 1

						destroy(_p)
					}
				}
				else {
					if dial_exists() {image_index = a.talkfr}
					else {trigger[0] = 11}
				}
			break
		
			case 11:
				mask_lay(toriel_mask,1)

				if x < 603 {
					timer[0]++
					
					if timer[0] < 3 {sprite_index = toriel_0}
					else {
						_p = 242 + (120 * (timer[1] + 1))
						if abs(_p - _c.x) < 60 {timer[1]++}

						if x < _p {
							x += 3
							sprite_index = toriel_3
							image_speed = 0.2
						}
						else {
							x = _p
							sprite_index = toriel_1
							image_index = 0
							image_speed = 0
						}
					}
				
					image_alpha = 2.2
				}
				else {
					x = 603
					sprite_index = toriel_2
					y -= 3
					image_alpha -= 0.2

					if image_alpha <= 0 {
						end_cuts()
						destroy()
					}
				}
				
				if fading() and (_c.y < y or _c.x > x) {global.story[0] = 0.1}
			break
		}
	}
	else {destroy()}
}