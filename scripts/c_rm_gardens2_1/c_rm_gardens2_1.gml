function c_rm_gardens2_1(){
	var _c = o_mainchara
	
	sprite_index = ant_cuts
	image_speed = 0
	sil = 1
	scol = #151515
	
	if !global.story[10] {
		switch trigger[0] {
			case 0:
				if g1_lever0.trigger and !g1_lever1.trigger and g1_lever2.trigger {
					if !timer[1] {
						o_spikes.trigger = 1
						audio_play(press,,,0.6)
						timer[1] = 1
					}
				}
			
				if _c.x >= 360 {
					image_index = 1
					shake(0,2,,1)
					audio_play(dial_ant,,,0.5,,1.3)
					trigger[0] = 1
				}
			break
		
			case 1:
				timer[0]++
			
				if timer[0] >= 10 {
					image_index = 2
					audio_play(poing,,,0.5,,1.1)
					timers_reset()
					trigger[0] = 2
				}
			break
		
			case 2:
				timer[0]++
			
				y -= 8 - (timer[0] * 0.9)
				x += 10
			
				if x >= room_width {
					end_cuts(10)
					destroy()
				}
			break
		}
	}
	else {
		destroy(a_int0)
		o_spikes.trigger = 1
		destroy()
	}
}