function check_follow(){
	var o = array_length(global.char)
	
	for (var i = 1;i < o;i++) {
		global.char[i] = i_create(x,y,depth,o_follower)
		global.char[i].pos = (i - 1)
		global.char[i].fl = (12 * i)
	}
}