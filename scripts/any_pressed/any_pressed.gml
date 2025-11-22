function any_pressed(){
	var g = gpad
	var con = g._gpad > -1
	
	if !con {return keyboard_check_pressed(vk_anykey)}
	else {
		if !g.debug {return gp_check_any_pressed()}
		else {return keyboard_check_pressed(vk_anykey)}
	}
}