function z_pressed(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if keyboard_check_pressed(global.bt[4,0]) or keyboard_check_pressed(global.bt[4,1]) {bt = 1}
	if con > -1 {
		if gamepad_button_check_pressed(con,g.bt[0]) {bt = 1}
	}

	return bt
}
