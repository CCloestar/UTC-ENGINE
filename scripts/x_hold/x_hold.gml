function x_hold(){
	var g = gpad
	var con = g._gpad
	
	if con < 0 {return keyboard_check(global.bt[5,0]) or keyboard_check(global.bt[5,1])}
	else {return gamepad_button_check(con,get_gp(g.bt[1]))}
}