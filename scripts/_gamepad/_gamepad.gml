#macro gp_axis gamepad_axis_value
#macro gp_set_deadzone gamepad_set_axis_deadzone
#macro gp_get_deadzone gamepad_get_axis_deadzone

#macro gp_hold gamepad_button_check
#macro gp_pressed gamepad_button_check_pressed
#macro gp_released gamepad_button_check_released

function on_controller() {
	var g = gpad
	var con = g._gpad

	return (con > -1 or g.debug)
}

function reset_gpad() {
	with (gpad) {
		dch = 0

		bt = [gp_face1,gp_face2,gp_face4]
		sens = [0.15,0.01]
		sens[2] = sens[0] * 0.5
	}
}