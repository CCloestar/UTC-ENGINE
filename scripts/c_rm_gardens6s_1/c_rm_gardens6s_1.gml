function c_rm_gardens6s_1(){
	var _c = o_mainchara
	
	switch trigger[0] {
		case 0:
			if _c.x <= 10 {
				char_stop()

				with (_c) {
					r = 1
					f = 1
					image_speed = 0.1
					image_index = 1
				}
				
				audio_play(poing,,,,,rnd_r(0.9,1))
				trigger[0] = 1
			}
		break
		
		case 1:
			timer[0]++
			
			_c.x -= 2
			_c.y -= 3 - (timer[0] * 0.2)
		break
	}
}