function r_hold(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if keyboard_check(global.bt[1,0]) or keyboard_check(global.bt[1,1]) {bt = 1}
	if con > -1 {
		var ch = g.dch

		if ch != 1 and gamepad_button_check(con,gp_padr) {bt = 1}
		if ch != 2 and gamepad_axis_value(con,gp_axislv) >= g.sens[0] {bt = 1}
	}

	return bt
}
