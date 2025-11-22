var _gp = async_load[? "pad_index"]

switch async_load[? "event_type"] {
	case "gamepad discovered":
		array_push(gpads,_gp)
	break
	
	case "gamepad lost":
		var i = array_get_index(gpads,_gp)
		if i >= 0 {array_delete(gpads,i,1)}
	break
}

if array_length(gpads) > 0 {_gpad = gpads[0]}
else {_gpad = -1}