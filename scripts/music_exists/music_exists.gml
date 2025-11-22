function music_exists(mus){
	if is_string(mus) {
		var loc = string(working_directory)
		var m = mus
		var _sm = m + "_" + string_lower(global.soul_name)
		var locmus = loc + m + ".ogg"

		if file_exists(loc + _sm + ".ogg") {m = _sm}
		return file_exists(loc + m + ".ogg")
	}
	else {return audio_exists(mus)}
}