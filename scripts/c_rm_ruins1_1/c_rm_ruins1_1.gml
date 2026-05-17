function c_rm_ruins1_1(){
	if !global.story[2] {global.story[2]++}
	
	var _c = o_mainchara
	var _p = o_warnobj
	var _r = (global.story[2] = 1.1)

	mask_lay(toriel_mask,1)

	if global.story[3] < 2 {
		switch trigger[0] {
			case 0:
				image_speed = 0
				image_index = 0

				if !global.story[3] {
					if !_r {
						if abs(_c.x - x) > 15 or _c.y < 180 {
							a = dial_create()
							for (var i = 0;i < 6;i++) {
								a.c[i] = "Toriel"
								a.m[i] = tr($"tori_6_{i}")
							}
							a.play = 0
							a.pos = 1

							trigger[0] = 1
						}
					}
					else {
						with (_c) {
							c = 1
							x += 10
						}
						
						x -= 10
						y = room_height + 10
						sprite_index = toriel_2
						image_speed = 0.2

						trigger[0] = 0.5
					}
				}
				else {
					x = 195
					y = 40

					trigger[0] = 5
				}
			break
			
			case 0.5:
				y -= 3
				
				if y <= 100 {
					y = 100
					sprite_index = toriel_3_alt
					x += 3
					
					if x >= 145 {
						sprite_index = toriel_2_t
						x = 145
						
						a = dial_create()

						for (var i = 0;i < 10;i++) {
							a.c[i] = "Toriel"
							a.m[i] = tr($"tori_6B_{i}")
							
							if i > 5 {a.m[i] = tr($"tori_6_{i - 4}")}
						}

						a.e[0] = 16
						a.e[2] = 5
						a.e[3] = 4
						a.e[4] = 5
						a.mo[0] = t_m_down1
						a.mo[2] = t_m_up1
						a.mo[3] = t_m_up2
						a.mo[4] = t_m_up1
						a.play = 0
						a.pos = 1
						
						i_create(x + 10,y - 11,,o_warnobj)
						
						trigger[0] = 1
					}
				}
			break

			case 1:
				if dial_exists() {
					image_index = a.talkfr

					if a.cur_m {
						sprite_index = toriel_0_t
						_c.f = 2
						destroy(o_warnobj)
					}
					if a.cur_m = 2 + (4 * _r) {sprite_index = toriel_3_t}
					if a.cur_m = 5 + (4 * _r) {sprite_index = toriel_0_t}
				}
				else {
					image_speed = 0.2

					trigger[0] = 2
				}
			break
			
			case 2:
				var t_sp = 4
			
				switch trigger[1] {
					case 0:
						sprite_index = toriel_3
						x += t_sp
						
						if x >= 215 {trigger[1]++}
					break
					
					case 1:
						sprite_index = toriel_2
						y -= t_sp
						
						if y <= 60 {trigger[1]++}
					break
					
					case 2:
						sprite_index = toriel_1
						x -= t_sp
						
						if x <= 175 {trigger[1]++}
					break
					
					case 3:
						sprite_index = toriel_2
						y -= t_sp
						
						if y <= 40 {
							y = 40
							trigger[1]++
						}
					break
					
					case 4:
						sprite_index = toriel_3
						x += t_sp
						
						if x >= 195 {
							sprite_index = toriel_2
							image_speed = 0
							image_index = 0
							
							i_create(r1_lever0.x,r1_lever0.y,,hitbox)
							
							trigger[1] = 0
							trigger[0] = 3
						}
					break
				}
			break
			
			case 3:
				timer[0]++
				
				if timer[0] = 40 {sprite_index = toriel_1_t}
				if timer[0] = 80 {
					a = dial_create()
					a.c = ["Toriel"]
					a.m = [tr("* ... Excuse me, this&&  puzzle does not seem to&&  work as expected.")]
					a.e = [5]
					a.mo = [t_m_down1]
					a.pos = 1
					a.play = 0
					
					timers_reset()
					trigger[0] = 4
				}
			break
			
			case 4:
				if dial_exists() {image_index = a.talkfr}
				else {
					switch timer[0] {
						case 74:
						case 70:
						case 40:
						case 30:
						case 0:
							sprite_index = toriel_2
							audio_play(battle_begin_0,,,0.4)
						break
					}
				
					timer[0]++
				
					if timer[0] >= 125 {
						timer[1]++
						
						if timer[1] < 4 {sprite_index = toriel_1}
						else {
							sprite_index = toriel_0_t
							
							a = dial_create()
							for (var i = 0;i < 2;i++) {
								a.c[i] = "Toriel"
								a.m[i] = tr($"tori_7_{i}")
							}
							a.e[0] = 5
							a.e[1] = 2
							a.mo[0] = t_m_down1
							a.pos = 1
							
							end_cuts(3)
							timers_reset()
							trigger[0] = 5
						}
					}
				}
			break
			
			case 5:
				var _a = dialogue
			
				if dial_exists() and _a.speak = 0 {
					image_index = _a.talkfr
					
					if (_a.m[_a.cur_m] = tr("tori_8_3") and _a.length >= 50)
					or (_a.m[_a.cur_m] = tr("tori_9_1") and _a.length >= 65) {
						_a.e[_a.cur_m] = 49
						_a.mo[_a.cur_m] = t_m_up3
					}
				}			
					
				if !(r1_butt0.trigger and r1_butt1.trigger) {
					if _c.y < 75 {sprite_index = toriel_1_t}
					else {sprite_index = toriel_0_t}
				}
				else {
					char_stop()
					
					timer[0]++
					
					if timer[0] = 60 {sprite_index = toriel_1_t}
					if timer[0] = 120 {
						a = dial_create()
						for (var i = 0;i < 3;i++) {
							a.c[i] = "Toriel"
							a.m[i] = tr($"tori_10_{i}")
							a.e[i] = 5
							a.mo[i] = t_m_down1
						}
						a.pos = 1
						a.play = 0
						
						timers_reset()
						trigger[0] = 6
					}
				}
					
				if r1_lever1.trigger {		
					a = dial_create()
					
					for (var i = 0;i < 3;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_10B_{i}")
					}
					a.e[0] = 12
					a.e[1] = 5
					a.e[2] = 4
					a.mo[0] = t_m_static
					a.mo[1] = t_m_up1
					a.mo[2] = t_m_up2
					a.play = 0
					
					destroy(hitbox)
					r1_finish()

					sprite_index = tori_worry_2
					image_index = 1

					trigger[0] = 5.5
				}
			break

			case 6:
			case 5.5:
				var dvu = (trigger[0] = 5.5)

				if dial_exists() {		
					if !dvu and a.cur_m = 1 {
						sprite_index = tori_worry_2
						image_index = 1
					}
					
					if a.cur_m = 2 and a.length >= 10 {
						sprite_index = toriel_1_t

						if !dvu {
							a.e[2] = 2
							a.mo[2] = t_m_up2
						}
					}

					if sprite_index != tori_worry_2 {image_index = a.talkfr}
				}
				else {trigger[0] = 7 + (dvu * 2)}
			break
			
			case 7:
				sprite_index = toriel_1
				image_speed = 0.2
				x -= 4
				
				if x <= 175 {
					x = 175
					
					sprite_index = toriel_2
					image_speed = 0
					image_index = 0

					audio_play(battle_begin_0,,,0.4)
					r1_finish()
					
					trigger[0] = 8
				}
			break
			
			case 8:
				timer[0]++
				
				if timer[0] >= 30 {
					sprite_index = tori_tada
					image_index = 0
					x = 168
					y = 43
					shake(0,2,,1)
					
					a = dial_create()
					for (var i = 0;i < 3;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_11_{i}")
					}
					a.e = [49,2,2]
					a.mo = [t_m_up3,t_m_up2,t_m_up2]
					a.pos = 1
					a.play = 0

					timers_reset()
					trigger[0] = 9
				}
			break
			
			case 9:
				if dial_exists() {
					a.pit = 1
					
					if !a.cur_m and a.length < 9 {a.pit = 1.15}
					if a.cur_m {
						sprite_index = toriel_0_t
						x = 175
						y = 40
					}
					
					if sprite_index = toriel_0_t {image_index = a.talkfr}
				}
				else {
					sprite_index = toriel_0
					image_speed = 0.2
					
					_p = i_create(255,120,,o_warnobj)
					_p.visible = 0
					
					i_move(,_p,40)
					
					trigger[0] = 10	
				}
			break
			
			case 10:
				if i_exists(_p) {
					if abs(x - 255) < 1 and abs(y - 120) < 1 {
						x = 255
						y = 120
						destroy(_p)
					}
				}
				else {
					sprite_index = toriel_1_t
					image_speed = 0
					image_index = 0
					
					a = dial_create()
					a.c = ["Toriel"]
					a.m = [tr("* Now, let us proceed to&&  the alternate path.")]
					
					trigger[0] = 11
				}
			break
			
			case 11:
				if dial_exists() {image_index = a.talkfr}
				else {
					timer[0]++
					
					if timer[0] < 4 {sprite_index = toriel_0}
					else {
						sprite_index = toriel_3
						image_speed = 0.2
						x += 4

						if x > room_width {
							end_cuts(3,2)
							destroy()
						}
					}
				}
			break
		}
	}
	else {
		r1_finish(0)
		destroy()
	}
}

function r1_finish(snd = 1) {
	if snd {
		shake()
		audio_play(puzzle_open)
		o_butt.trigger = 1
	}
	
	r1_wall.image_yscale = 1

	destroy(r1_tori)
	destroy(r1_lever1)
	
	b = i_create(180,60,,interactable)
	b.txt = "r1"
	
	layer_set_visible("Tiles_3",0)
}