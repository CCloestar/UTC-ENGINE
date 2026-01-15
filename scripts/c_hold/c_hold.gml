function c_hold(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if keyboard_check(global.bt[6,0]) or keyboard_check(global.bt[6,1]) {bt = 1}
	if con > -1 {
		if gamepad_button_check(con,g.bt[2]) {bt = 1}
	}
	
	return bt
}
