function c_rm_ruins4g_1(){
	var _c = o_mainchara
	var _p = o_warnobj
	var _s = global.simpleVFX
	var gards_point = 50
	
	a = rumble
	var g = titlecard

	_c.h_xx++

	var amt = 2 + (2 * _s)
	
	if _c.h_xx >= 20 and !(trigger[0] = 2 and timer[0] >= gards_point + 20) and trigger[0] < 3 {
		if _c.h_xx % amt == 0 {
			var gf = i_create(choose(rnd_r(-10,50,2),rnd_r(330,270,2)),o_camera.y + 240,,g_falllight)
			gf.gravity = rnd_r(-0.5,-1.5)
		}
	}

	switch trigger[0] {
		case 0:
			destroy(start_fade)
			audio_play(fall_1)
			gravity = 0.1
			a = audio_play(rumble,,1,0.7,,gravity)
			
			char_stop()
			with (_c) {
				f = -1
				sprite_index = chopper_fall_0
				image_speed = 0
				x = 150
				y = -40
			}
			
			timer[1] = _s
			trigger[0] = 1
		break
		
		case 1:
			var rh = room_height
			var _ss = 1.123 * _s

			if _s {_c.y += 12}
			else  {_c.y += 16}
			cam_pos()
			
			timer[0]++
			
			if _c.image_index < 4 {
				if timer[0] % floor(timer[1] + 1) == 0 {
					_c.image_index++

					if _c.image_index >= 4 {_c.image_index = 4 * (timer[1] >= 2.5)}

					if _s {timer[1] += 0.028}
					else {timer[1] += 0.05}
				}
			}
			else {
				timer[2]++
				
				if timer[2] >= 5 {
					_c.sprite_index = chopper_fall_1
					_c.image_speed = 0.2
					_c._dep = 0

					timers_reset()
					trigger[0] = 2
				}
			}
		break
		
		case 2:
			_c.y += 0.2

			timer[0]++

			_c.h_x += 0.025
			if _c.h_x >= 1 {_c.h_x = 1}
			
			if timer[0] >= gards_point {
				if !i_exists(_p) {
					_p = i_create(0,o_camera.y + 1200,_c.depth - 10,o_warnobj)
					with (_p) {
						sprite_index = g_bgintro
						image_speed = 0
					}
				}
				else {
					timer[1]++
					
					if timer[1] >= 120 {
						_p.y -= 80 / (1 + _s)
							
						if _c.y >= _p.y + 320 {
							_c.visible = 0
								
							audio_free()

							timer[2]++

							repeat (14) {audio_play_echo(leaf,,,rnd_r(0.7,1),rnd(0.3),rnd_r(0.7,1.2))}

							if timer[2] >= 10 {
								_c.visible = 0
								audio_play_echo(bigdoor,,,0.8,,0.8)
								audio_play(UT_0)

								var _d = 1

								if _d {
									g = i_create(,,,titlecard)
									g.txt = "DEMO 1 ~ Empire of Leaves ~"
								}

								timers_reset()
								trigger[0] = 3
							}
						}
					}
				}
			}
		break

		case 3:
			if i_exists(g) {
				timer[0]++
				
				if timer[0] >= 160 {
					g.image_alpha -= 0.1

					if g.image_alpha <= 0 {
						timer[0] = 0
						destroy(g)
					}
				}
			}
			else {
				timer[0]++
				if timer[0] >= 220 and !i_exists(g) {finish_plot()}
			}
		break
	}

	y = _c.y

	if audio_is_playing(a) {
		gravity += 0.05 - (0.01 * _s)
		audio_sound_pitch(a,gravity)
	}
}