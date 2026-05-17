function mask_lay(spr = sprite_index,dep = 0) {
	if event_type = ev_create {
		lay = all
		yoffset = 0
	}
	else {
		for (var i = 0;i < 9;i++) {
			if layer_exists("upinstances_" + string(i)) and layer = layer_get_id("upinstances_" + string(i)) {lay = i + 1}	
		}
		
		var _lay = 1
		
		var nolays = ["behind","upperinstances"]
		
		for (var i = 0;i < array_length(nolays);i++) {
			if layer_exists(nolays[i]) and layer = layer_get_id(nolays[i]) {_lay = 0}
		}

		if _lay {
			if lay = global.lay or lay = all {
				mask_index = spr
				if dep {depth = (1 - ((y * 10) + (sprite_height * 10)) + yoffset * 10)}
			}
			else {
				mask_index = no_spr
				if dep and lay > -1 {depth = (1000 - ((y * 10) + (sprite_height * 10)) + yoffset * 10)}
			}
		}
	}
}