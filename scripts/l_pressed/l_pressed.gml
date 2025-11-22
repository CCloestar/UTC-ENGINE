function l_pressed(){
	var g = gpad
	var con = g._gpad
	
	if con < 0 {return keyboard_check_pressed(global.bt[3,0]) or keyboard_check_pressed(global.bt[3,1])}
	else {return gamepad_button_check_pressed(con,gp_padl)}
}