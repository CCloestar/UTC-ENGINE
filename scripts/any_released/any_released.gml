function any_released(){
	var g = gpad
	var con = g._gpad > -1
	
	if !con {return keyboard_check_released(vk_anykey)}
	else {
		if !g.debug {return gp_check_any_released()}
		else {return keyboard_check_released(vk_anykey)}
	}
}