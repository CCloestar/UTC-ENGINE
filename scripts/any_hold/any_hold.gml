function any_hold(){
	var g = gpad
	var con = g._gpad > -1
	
	if !con {return keyboard_check(vk_anykey)}
	else {
		if !g.debug {return gp_check_any()}
		else {return keyboard_check(vk_anykey)}
	}
}