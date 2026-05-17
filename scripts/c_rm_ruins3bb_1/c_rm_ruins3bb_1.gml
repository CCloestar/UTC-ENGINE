function c_rm_ruins3bb_1(){
	var _c = o_mainchara
	var cam = o_camera
	var _p = o_warnobj
	var _b = r_bridge
	var dvu = global.story[6] = -1
	var _sha = 0
	
	var w_y = 520

	switch trigger[0] {
		case 1:
		case 0:
			mask_lay(toriel_mask,1)
		
			sprite_index = tori_bridge_0
			image_speed = 0
			x = 129
			y = 153
			
			if !trigger[1] {
				timer[0]++
			
				var _d = irnd_r(40,70)
			
				if timer[0] >= _d + irnd(20) {
					image_index = 1

					timer[0] = 0
					trigger[1] = 1
				}
			}
			else {
				timer[1]++

				if timer[1] >= 6 {
					image_index = 0
					timer[1] = 0
					trigger[1] = 0
				}
			}
			
			if !trigger[0] {
				if _c.y >= y + 5 and abs(_c.x - 160) <= 20 {
					char_stop()
					a = dial_create()
					a.c = ["Toriel"]
					a.m = [tr("* Hold on, I am just&&  making sure we are safe&&  enough to continue...")]
					a.play = 0
					
					trigger[0] = 1
				}
			}
			else {
				if !dial_exists() {
					timer[2]++
					
					if timer[2] >= 40 {
						image_index = 2
						
						shake(0,1)
						audio_play(swallow,,,,,1.2)
						audio_play(bump,,,,,rnd_r(0.6,0.9))
						timers_reset()
						
						for (var i = 0;i < _b.lim;i++) {_b._y[i,1] = -1}

						trigger[0] = 2
					}
				}
			}
		break
		
		case 2:
			timer[0]++
			
			for (var i = 0;i < _b.lim;i++) {
				if _b._y[i,1] < 0 {_b._y[i,1] += 0.25}
			}
			
			if timer[0] >= 60 {
				sprite_index = tori_worry_2
				image_index = 0
				x = 132
				y = 148
				
				a = dial_create()
				for (var i = 0;i < 3;i++) {
					a.c[i] = "Toriel"
					a.m[i] = tr($"tori_17_{i}")
					a.e[i] = 5
					a.mo[i] = t_m_down1
				}
				a.e[2] = 1
				a.mo[2] = t_m_main
				a.play = 0
				
				timers_reset()
				trigger[0] = 3
			}
		break
		
		case 3:
			if dial_exists() {
				if a.cur_m = 2 {
					sprite_index = toriel_0_t
					image_index = a.talkfr
				}
			}
			else {
				_p = i_create(162,172,,o_warnobj)
				_p.visible = 0
				
				i_move(_c,_p,15)

				with (_c) {
					f = 0
					image_speed = 0.2
				}
				
				trigger[0] = 4
			}
		break
		
		case 4:
			if i_exists(_p) {
				if abs(_c.x - 162) < 1 and abs(_c.y - 172) < 1 {
					_c.x = 162
					_c.y = 172
					
					destroy(_p)
				}
			}
			else {
				_c.y += 3
				
				sprite_index = toriel_0
				timer[0]++ 
				
				if timer[0] >= 8 {
					image_speed = 0.2
					y += 3
				}
			}

			cam_pos()
			
			if _c.y >= w_y {
				_c.y = w_y
				sprite_index = toriel_0_t
				image_speed = 0
				image_index = 0
				
				with (_c) {
					f = -1
					sprite_index = chopper_c_1
					image_speed = 0
					image_index = 0
				}
				
				a = dial_create()
				for (var i = 0;i < 7;i++) {
					a.c[i] = "Toriel"
					a.m[i] = tr($"tori_18_{i}")
				}
				a.e[0] = 2
				a.e[2] = 2
				a.e[3] = 5
				a.e[6] = 5
				a.mo[3] = t_m_up1
				a.mo[6] = t_m_down1
				a.play = 0

				timers_reset()
				trigger[0] = 5
			}
		break
		
		case 5:
			if dial_exists() {
				image_index = a.talkfr
				
				if a.cur_m = 2 {_c.f = 2}
				
				if a.cur_m = 5 {					
					if !timer[1] {
						sprite_index = tori_bridge_1
						x = 133
						y = w_y - 41
						
						shake(0,2,,1)
						timer[1] = 1
					}
					
					image_index = 0
				}
				
				if a.cur_m = 6 {image_index = 1}
			}
			else {
				timer[0]++
				
				if timer[0] >= 30 {
					image_index = 2
					
					a = dial_create()
					for (var i = 0;i < 2;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_19_{i}")
						a.e[i] = 5
						a.mo[i] = t_m_down1
					}
					
					a.play = 0
					timers_reset()
					trigger[0] = 6
				}
			}
		break
		
		case 6:
			if dial_exists() {
				if a.cur_m {image_index = 1}
			}
			else {
				with (_c) {
					f = -1
					sprite_index = chopper_c_1
					image_index = 2
				}
				
				timers_reset()
				timer[2] = _c.y - 22
				
				sprite_index = tori_worry_3
				image_speed = 0.2
				
				_p = i_create(149,timer[2],,o_warnobj)
				_p.visible = 0
				
				i_move(,_p,25)
				
				trigger[0] = 7
			}
		break
		
		case 7:
			if i_exists(_p) {
				if abs(x - 149) < 1 and abs(y - timer[2]) < 1 {
					_c.visible = 0
					x = 145
					y = w_y - 13
				
					sprite_index = tori_worry_4
					image_index = 0
				
					a = dial_create()
					for (var i = 0;i < 3;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_20_{i}")
						a.e[i] = 29
						a.mo[i] = t_m_down2
					}
					a.e[2] = 30
					a.play = 0
					
					destroy(_p)
				}
			}
			else {
				if !dial_exists() {
					timer[0]++
					
					if timer[0] >= 60 {
						_c._vol = 1
						music_resume()
						music_vol(,1)
						image_index = 1
						
						a = dial_create()
						for (var i = 0;i < 3;i++) {
							a.c[i] = "Toriel"
							a.m[i] = tr($"tori_21_{i}")
						}
						a.e = [16,2,1]
						a.mo[0] = t_m_static
						a.mo_f[0] = 8

						a.play = 0
						
						timers_reset()
						trigger[0] = 8
					}
				}
			}
		break
		
		case 8:
			if dial_exists() {
				if a.cur_m = 2 and a.length >= 43 {
					a.e[2] = 49
					a.mo[2] = t_m_up2
				}
			}
			else {
				with (_c) {
					image_index = 0
					visible = 1
					f = 1
				}
				
				sprite_index = toriel_3
				image_speed = 0.2
				x -= 2
				y = w_y - (480 - 456)
				
				if x <= 132 {
					sprite_index = toriel_3_t
					image_speed = 0
					
					a = dial_create()
					a.c = ["Toriel"]
					a.m = [tr("* Now that we are over&&  with it, let us pro-.")]
					a.play = 0
					a.auto = 1
					
					trigger[0] = 9
				}
			}
		break
		
		case 9:
			if dial_exists() {image_index = a.talkfr}
			else {
				if !timer[1] {
					set_bridge(1)
					music_stop()
				
					with (_c) {
						f = -1
						sprite_index = chopper_c_1
						image_speed = 0
						image_index = 2
					}
				
					sprite_index = toriel_3_alt
					image_index = 0
				
					i_create(x + 10,y - 11,depth - 10,o_warnobj)
				
					shake(0,2,,1)
					shake(0,2,_c,1)
					audio_play(swallow,,,0.3,,1.1)
					timer[1] = 1
				}
				
				timer[0]++
				
				if timer[0] >= 140 {
					destroy(o_warnobj)
					
					a = dial_create()
					for (var i = 0;i < 2;i++) {
						a.m[i] = tr($"tori_22_{i}")
					}
					a.play = 0
					a.snd = dial_toriel
					a.pit = 0.98

					timers_reset()
					trigger[0] = 10
				}
			}
		break
		
		case 10:
			if dial_exists() {
				if a.cur_m and !a.draw {destroy(a)}
				
				if !timer[4] {
					timer[1] = x - (5 * dvu)
					timer[2] = y - 1
					timer[3] = _c.x
					timer[4] = _c.y
				}

				if dvu and a.cur_m {
					a.skip = 0
					a.finish = 0
					
					_c.x -= 2

					if _c.x < timer[3] - 3 {
						_c.x = timer[3] - 2
						destroy(a)
						set_bridge(2)
						
						with (_c) {
							f = -1
							sprite_index = chopper_b_0
							image_speed = 0
							image_index = 0
						}
						
						sprite_index = tori_grab_0
						x = timer[1] + 1
						timer[1] = x
						timer[3] = _c.x
						timer[4] = _c.y

						a = dial_create()
						a.c = ["Toriel"]
						a.m = [tr("* Wait, my child!&&* What are you doing!?")]
						a.e = [37]
						a.mo = [t_m_down1]
						a.pit = 1.1
						a.auto = 1
						a.play = 0
						
						trigger[0] = 11.5
					}
				}
			}
			else {
				_sha = 1
				
				set_bridge(2)
				image_index = 1

				timer[0]++
				
				if timer[0] >= 30 {
					a = dial_create()
					for (var i = 0;i < 2;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_23_{i}")
						a.e[i] = 32
						a.mo[i] = t_m_down1
					}
					a.pit = 1.05
					a.play = 0

					trigger[0] = 11
				}
			}
		break
		
		case 11:
			if dial_exists() {_sha = 1}
			else {
				if !timer[5] {
					set_bridge(3)

					if !dvu {
						x = timer[1] + 1
						sprite_index = toriel_0
					}
					else {sprite_index = tori_grab_1}
					image_speed = 0.4

					timer[5] = 1
				}

				y += 5
				
				with (_c) {
					if !dvu {
						f = 0
						r = 1
					}
					else {sprite_index = chopper_b_1}

					image_speed = 0.4
					y += 5
				}
				
				cam_pos()
				
				if _c.y >= 980 {
					if !timer[6] {
						audio_play(poing,,,,,1.1)
						audio_play(dial_toriel,,,,,1.3)
						if dvu {_c.x += 2}
					}
					
					timer[6]++
					
					y -= 3 - (timer[6] * 0.5)
					sprite_index = toriel_trip
					image_speed = 0
					image_index = dvu
					
					if dvu {
						_c.sprite_index = chopper_skid
						_c.image_index = 1
						_c.y -= 3 - timer[6] * 0.5
					}
				}
				
				if _c.y >= 1050 {
					timers_reset()
					
					with (_c) {
						r = 0
						image_index = 0
						image_speed = 0
					}

					sprite_index = toriel_sus_1
					x -= 6
					audio_play_echo(tori_s,,,,,0.98,0.26,0.18,1,-0.01)
					audio_play_echo(fall_0,,,,,,0.3,0.2,1)
					trigger[0] = 12
				}
			}
		break
		
		case 11.5:
			_sha = 1
			
			if dial_exists() {
				if a.length = strlen(a.m[0]) - 2 {destroy(a)}
			}
			else {trigger[0] = 11}
		break
		
		case 12:
			timer[0]++

			if timer[0] % 3 == 0 {
				_c.f++
				if _c.f > 3 {_c.f = 0}
			}

			x -= 2
			y -= 4 - (timer[0] * 0.5)

			_c.x += 2
			_c.y -= 4 - (timer[0] * 0.5)
			
			if !audio_is_playing(bump) {
				timer[1]++
				
				if timer[1] >= 10 {room_goto(rm_ruins4g)}
			}
		break
	}

	if trigger[0] > 5 and trigger[0] < 8 {
		_c._vol = 0
		music_vol(,music_vol(,-1) - 0.01)

		if music_vol(,-1) <= 0 {
			music_vol(,0)
			music_pause()
		}
	}

	if _sha {
		x = timer[1] + (irnd_r(1,-1) * !global.simpleVFX)
		y = timer[2] + irnd_r(1,-1)
		
		if _sha != 2 {
			_c.x = timer[3] + (irnd_r(1,-1) * !global.simpleVFX)
			_c.y = timer[4] + irnd_r(1,-1)
		}
	}
}

function set_bridge(state = 0) {
	var _b = r_bridge
	
	for (var i = 0;i < arlen(_b.trigger);i++) {
		if _b.trigger[i] != state {
			_b.timer[i] = 0
			_b.trigger[i] = state
		}
	}
}