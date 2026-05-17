function add_follower(_x = x,_y = y,_n = "Null"){
	var i = array_length(global.char)
	
	if !i {i = 1}

	global.char[i] = i_create(_x,_y,depth,o_follower)
	global.char[i].pos = (i - 1)
	global.char[i].fl = (12 * i)

	global.f_n[i - 1] = _n
	
	return global.char[i]
}