function char_free(){
	if i_exists(o_mainchara) {
		with (o_mainchara) {
			inMenu = 0
			c = 0
			t = 0
			d = 0
		}
	}
	
	if i_exists(o_follower) {o_follower.c = 0}
}