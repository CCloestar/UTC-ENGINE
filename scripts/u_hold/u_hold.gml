function u_hold(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if keyboard_check(global.bt[2,0]) or keyboard_check(global.bt[2,1]) {bt = 1}
	if con > -1 {
		var ch = g.dch

		if ch != 1 and gamepad_button_check(con,gp_padu) {bt = 1}
		if ch != 2 and gamepad_axis_value(con,gp_axislh) <= -g.sens[0] {bt = 1}
	}

	return bt
}
