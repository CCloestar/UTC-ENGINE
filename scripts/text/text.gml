function text(){
	var t = argument[0]
	
	if ds_map_exists(global.l_map,t) {
		var tt = ds_map_find_value(global.l_map,t)
		var sid = 0

		while (sid < argument_count - 1) {
			var sub = "[" + string(sid) + "]"
		
			tt = string_replace_all(tt,sub,argument[sid + 1])
			sid++
		}

		return tt
	}
	else {return t}
}