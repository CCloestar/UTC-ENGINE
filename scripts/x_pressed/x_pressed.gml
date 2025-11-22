function x_pressed(){
	var g = gpad
	var con = g._gpad
	
	if con < 0 {return keyboard_check_pressed(global.bt[5,0]) or keyboard_check_pressed(global.bt[5,1])}
	else {return gamepad_button_check_pressed(con,get_gp(g.bt[1]))}
}