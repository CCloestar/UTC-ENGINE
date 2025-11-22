function remove_follower(){
	var i,o
	
	i = array_length(global.char) - 1

	if i {
		destroy(global.char[i])
		array_delete(global.char,i,1)
	}
	
	o = array_length(global.f_n) - 1
	
	if o {array_delete(global.f_n,o,1)}
	else {global.f_n[0] = ""}
}