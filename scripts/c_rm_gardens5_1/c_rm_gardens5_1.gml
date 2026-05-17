function c_rm_gardens5_1(){
	var _c = o_mainchara
	var _cc = o_camera
	var _p = o_warnobj
	var _l = 0
	var _s = global.story[12]
	if _s = -1 {_s = 0}

	image_speed = 0
	mask_lay(,1)

	if _s < 3 {
		switch trigger[0] {
			case 0:
				image_index = 0
			
				if _s < 2 {
					if _c.y <= 740 {
						char_stop()

						music_pause()
						trigger[0] = 1
					}
				}
				else {
					music_resume()
					char_stop()
					_c.c = 1
					_c._vol = 1
					_cc.y = 660
					
					sprite_index = ant_0
					x = 153
					y = 646
					
					switch _s {
						case 2.1:
							sprite_index = ant_0_scared
						break
						
						case 2.2:
							sprite_index = ant_cuts
							image_index = 8
							x -= 3
							y -= 6
						break
						
						case 2.3:
							visible = 0
						break
					}

					timer[1] = x
					
					if _s = 2.3 {destroy(g5_antbush)}
					trigger[0] = 8 + (3 * (_s = 2.3))
				}
			break
			
			case 1:
				_cc.y -= 3

				if _cc.y <= 660 {
					_cc.y = 660
					
					timer[0]++
					
					var _v = timer[0] / 35
					if _v >= 1 {_v = 1}
					
					if timer[0] % 14 == 0 {
						audio_play(poing,,,_v,,rnd_r(0.9,1))
						audio_play(leaf,,,_v,,rnd_r(0.9,1.2))
					} 
					
					if timer[0] >= 40 {
						sprite_index = ant_cuts
						image_index = 2
						audio_play(poing,,,,,1.1)
						audio_play(leaf,,,,,1.2)
						
						timers_reset()
						trigger[0] = 2
					}
				}
			break
			
			case 2:
				timer[0]++
			
				y += (timer[0] * 0.8)
				x += 6
				
				if y >= 570 {
					audio_play(wing,,,,,1)
					_l = 1
					image_index = 4

					timers_reset()
					trigger[0] = 3
				}
			break
			
			case 3:
				timer[0]++

				y -= 2 - (timer[0] * 0.5)
				x += 5

				if y >= 640 {
					y = 640
					image_index = 3
					audio_play(bump)
					timers_reset()
					trigger[0] = 4
				}
			break
			
			case 4:
				if abs(x - 150) > 0.01 {x += (150 - x) / 4}
				else {
					x = 150
					timer[0]++
					
					if timer[0] >= 60 - (20 * _s) {
						if !_s {
							image_index = 4
							audio_play(poing,,,,,1.1)
						}

						timers_reset()
						trigger[0] = 5 + _s
					}
				}
			break
			
			case 5:
				_l = 2

				if timer[1] {
					timers_reset()
					
					a = dial_create()
					for (var i = 0;i < 3;i++) {a.m[i] = tr($"ant_0_{i}")}
					a.play = 0
					a.pos = 1
					
					trigger[0] = 6
				}
			break

			case 6:
				if dial_exists() {
					_l = 2
					
					if a.cur_m = 2 and !a.draw {dial_destroy()}
				}
				else {					
					if image_index {
						y = 640
						shake(0,2,,2)
						
						timers_reset()
						trigger[0] = 6
						audio_play(battle_begin_0)

						_c.f = 2
						image_index = 0
					}
					
					timer[0]++
					
					if timer[0] >= 60 {
						image_index = 1
						shake(0,2,,1)

						global.bstory = 1
						_c.enc[0] = 1

						_p = i_create(x + 5,y - 9,depth - 5,o_warnobj)
						_p.area = 0
						end_cuts(12,1)

						trigger[0] = 7
					}
				}
			break
			
			case 8:
				var _st = ((_s > 2) * (1 + (_s = 2.2))) * 0.5
			
				timer[0]++
				x = timer[1] + rnd_r(_st,-_st)
				
				if timer[0] >= 60 {
					image_index++
					
					timers_reset()

					if _s < 2.2 {
						audio_play(dial_ant,,,,,1 + ((_s = 2.1) * 0.2))
						trigger[0] = 9
					}
					else {
						shake(0,2,,2)
						_p = i_create(x + 5,y - 9,depth - 5,o_warnobj)
						_p.area = 0
						trigger[0] = 8.5
					}
				}
			break
			
			case 8.5:
				timer[0]++
				
				if timer[0] >= 40 {
					destroy(_p)
					
					sprite_index = ant_0_scared
					x = 153
					y = 646
					
					if timer[0] >= 70 {
						audio_play(ant_s)

						sprite_index = ant_cuts
						image_index = 1
						x = 150
						y = 640

						shake(0,2,,1)
						timers_reset()
						trigger[0] = 9
					}
				}
			break
			
			case 9:
				image_index = (audio_is_playing(dial_ant) or audio_is_playing(ant_s))
				
				if !audio_is_playing(dial_ant) {
					timer[0]++

					if timer[0] >= 20 {
						sprite_index = ant_cuts
						image_index = 2
						x = 150
						y = 640
						
						audio_play(poing)
						timers_reset()
						trigger[0] = 10
					}
				}
			break
			
			case 10:
				timer[0]++
				
				y -= 4 - (timer[0] * 0.3)
				x += 5
				
				if x >= 270 {_l = 1}
				if x >= 280 {
					timers_reset()
					trigger[0] = 11
				}
			break

			case 11:
				timer[0]++
				
				if timer[0] >= 40 + (20 * (_s = 2.3)) {
					_cc.y += 2
					
					if _cc.y >= _c.y + 20 {
						cam_pos()
						char_free()

						end_cuts(12,_s + 1)
						_l = 3
					}
				}
			break
		}
	}
	else {_l = 3}

	switch _l {
		case 1:
			var rand = irnd_r(3,7)

			repeat (rand) {
				audio_play(leaf,,,,,rnd_r(0.9,1.2))
				var l = i_create(x + rnd(sprite_width),y + sprite_height - 2,depth - 20,g_leaf)
				l.vspeed = rnd_r(-2,-1)
				l.gravity = choose(0.03,0.05)
			}
		break
		
		case 2:
			timer[0]++
							
			y -= 4 - (timer[0] * 0.6)

			if timer[0] = 13 {
				audio_play(poing,,,,,rnd_r(0.9,1.1))

				y = 640
				if image_index < 7 {image_index++}
				else {image_index = 4}

				timer[1]++
				timer[0] = 0
			}
		break
		
		case 3:
			if _s >= 3.3 {destroy(g5_antbush)}
			g5_arcint.x = 140
			destroy()
		break
	}
}