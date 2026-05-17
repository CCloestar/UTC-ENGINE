function r_released(){
	var g = gpad
	var con = g._gpad
	var bt = 0

	if keyboard_check_released(global.bt[1,0]) or keyboard_check_released(global.bt[1,1]) {bt = 1}
	if con > -1 {
		if gamepad_button_check_released(con,gp_padr) {bt = 1}
	}

	return bt
}
