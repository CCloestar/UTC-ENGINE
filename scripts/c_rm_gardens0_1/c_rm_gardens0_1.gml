function c_rm_gardens0_1(){
	var _c = o_mainchara
	
	if !global.story[8] {
		switch trigger[0] {
			case 0:
				char_stop()
				destroy(start_fade)

				with (_c) {
					x = 170
					y = 156
					cam_pos()
					
					x = 165
					y = 165
					f = -1
					sprite_index = chopper_c_0
					image_speed = 0
					image_index = 0
				}

				timer[0]++

				if timer[0] >= 60 {
					shake(0,2,_c,1)
					audio_play(battle_begin_0,,,0.6,,1.1)
					_c.image_index = 1
					
					timers_reset()
					trigger[0] = 1
				}
			break
			
			case 1:
				timer[0]++
				
				if timer[0] >= 30 {
					with (_c) {
						x = 170
						y = 156
						f = 0
						image_index = 0
					}
					
					shake(0,2,_c,1)
					audio_play(battle_begin_0,,,0.6,,0.9)
					
					timers_reset()
					trigger[0] = 2
				}
			break
			
			case 2:
				if !i_exists(shake_obj) {
					char_free()
					end_cuts(8)
					destroy()
				}	
			break
		}
	}
	else {destroy()}
}