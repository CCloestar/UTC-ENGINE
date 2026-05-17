function c_rm_gardens3_1(){
	var _c = o_mainchara
	var _m = 0
	var _l = 0
	end_cuts(10)

	sprite_index = ant_cuts
	image_speed = 0
	sil = 1
	scol = #151515

	if global.story[11] < 2 {
		if !g2_lever0.trigger and g2_lever1.trigger {
			if !o_spikes.trigger {
				audio_play(press,,,0.6)
				o_spikes.trigger = 1
			}
		}
		
		if !global.story[11] {
			switch trigger[0] {
				case 0:
					if global.story[11] != 0.2 {
						image_index = 1
				
						if _c.y >= 100 {
							audio_play(poing,,,0.8)
							end_cuts(11,0.2)
							trigger[0] = 1
						}
					}
					else {_m = 1}
				break
			
				case 1:
					timer[0]++

					y -= 5 - (timer[0] * 0.2)
					x -= 7

					if y >= 100 {
						y = 100
						if !timer[2] {
							_l = 1
							timer[2] = 1
						}
						mask_lay(,1)
						image_index = 0
					}
				
					if x <= -80 {_m = 1}
				break

				case 2:
					image_index = 1

					if _c.y >= 320 {
						audio_play(poing,,,0.8)
						trigger[0] = 3
					}
				break
			
				case 3:
					timer[0]++
				
					y -= 5 - (timer[0] * 0.2)
					x += 7.5

					if y >= 360 {
						y = 360
						if !timer[3] {
							_l = 1
							timer[3] = 1
						}
						image_index = 0
					}
				
					if x > room_width + 40 {
						trigger[0] = 4
						end_cuts(11)
					}
				break
			}
		}
	}
	else {
		o_spikes.trigger = 1
		destroy()
	}
	
	if _m {
		timers_reset()
		y = 340
		x = 0
		image_xscale = -1
		trigger[0] = 2
	}
	
	if _l {
		var rand = irnd_r(3,7)

		repeat (rand) {
			audio_play(leaf,,,,,rnd_r(0.9,1.2))
			var l = i_create(x + rnd(sprite_width),y + sprite_height - 2,depth - 20,g_leaf)
			l.vspeed = rnd_r(-2,-1)
			l.gravity = choose(0.03,0.05)
		}
	}
}