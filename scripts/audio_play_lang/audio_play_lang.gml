function audio_play_lang(soundid,priority = 1,loops = 0,gain = 1,offset = 0,pitch = 1){
	var f_snd = soundid + "_" + string_lower(text("lang"))
	
	if l_check() {f_snd = soundid + "_ja"}
	if l_check("US") {f_snd = soundid + "_en"}
	
	var final = ds_map_find_value(global.l_snd,f_snd)
	
	if !ds_map_exists(global.l_snd,f_snd) {
		final = ds_map_find_value(global.l_snd,soundid + "_en")
		
		if !ds_map_exists(global.l_snd,soundid + "_en") {
			final = ds_map_find_value(global.l_snd,soundid)
			
			if !ds_map_exists(global.l_snd,soundid) {final = squeak}
		}
	}

	if final != undefined {f_snd = final}
	else {f_snd = squeak}

	return audio_play(f_snd,priority,loops,gain,offset,pitch)
}