function gp_check_any(){
	var con = gpad._gpad

	for (var i = gp_face1;i < gp_extra6;i++) {return gamepad_button_check(con,i)}
}