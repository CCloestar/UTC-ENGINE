function u_hold(){
	var g = gpad
	var con = g._gpad
	
	if con < 0 {return keyboard_check(global.bt[2,0]) or keyboard_check(global.bt[2,1])}
	else {
		var ch = g.dch
		var sens = g.sens[0] * (g.sens[1] * 10)

		if ch = 0 {return gamepad_button_check(con,gp_padu) or gamepad_axis_value(con,gp_axislh) < sens}
		if ch = 1 {return gamepad_axis_value(con,gp_axislh) < sens}
		if ch = 2 {return gamepad_button_check(con,gp_padu)}
	}
}