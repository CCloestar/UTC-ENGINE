function gp_check_any_pressed(){
	var con = gpad._gpad
	
	for (var i = gp_face1;i < gp_extra6;i++) {return gamepad_button_check_pressed(con,i)}
}