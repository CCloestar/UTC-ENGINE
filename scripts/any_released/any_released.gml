function any_released(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if keyboard_check_released(vk_anykey) {bt = 1}
	if con > -1 {
		for (var i = gp_face1;i < gp_extra6;i++) {
			if gamepad_button_check_released(con,i) {bt = 1}
		}
	}

	return bt
}
