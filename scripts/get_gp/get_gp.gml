function get_gp(_g = 0){
	var g = gpad
	var gg = g._gpad
	var gp

	for (var i = 32770;i < 32770 + gamepad_button_count(gg);i++) {gp[i - 32770] = i}

	return gp[g]
}