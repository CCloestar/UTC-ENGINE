var _gp = async_load[? "pad_index"]

switch async_load[? "event_type"] {
	case "gamepad discovered":
<<<<<<< HEAD
		arpush(gpads,_gp)
=======
		array_push(gpads,_gp)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		if os_type != os_linux {gamepad_set_axis_deadzone(gpads,sens[0])}
		else {sens[2] = sens[0] * 0.5}
	break

	case "gamepad lost":
		var i = array_get_index(gpads,_gp)
<<<<<<< HEAD
		if i > -1 {ar_delete(gpads,i,1)}
	break
}

if arlen(gpads) > 0 {_gpad = gpads[0]}
=======
		if i > -1 {array_delete(gpads,i,1)}
	break
}

if array_length(gpads) > 0 {_gpad = gpads[0]}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
else {_gpad = -1}