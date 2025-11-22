function l_released(){
	var g = gpad
	var con = g._gpad
	
	if con < 0 {return keyboard_check_released(global.bt[3,0]) or keyboard_check_released(global.bt[3,1])}
	else {return gamepad_button_check_released(con,gp_padl)}
}