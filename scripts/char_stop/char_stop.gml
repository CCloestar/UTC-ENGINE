function char_stop(stopanims = 1,fl = 0){
	with (o_mainchara) {
		c = 1
		r = 0
		
		if stopanims {
			w = 0
			image_speed = 0
			image_index = 0
		}
	}
	
	if fl and i_exists(o_follower) {
		with (o_follower) {
			c = 1
			r = 2
			
			image_speed = 0
			image_index = 0
		}
	}
}