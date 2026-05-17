function music_play(music,vol = 1,pitch = global.pitch,loop = 1,loopTime = 0,m = 1){
	var loc = string(working_directory)
	var mus = music
	var _sm = mus + "_" + string_lower(global.soul_name)
	
	if file_exists(loc + _sm + ".ogg") {mus = _sm}

	var _m = no_sound

	if file_exists(loc + mus + ".ogg") {
		_m = audio_create_stream(loc + mus + ".ogg")
		
		if loop {
			audio_sound_loop_start(_m,loopTime)
			audio_sound_loop_end(_m,audio_sound_length(_m))
		}

		global.music[m] = audio_play_sound(_m,-9998,loop,vol * global.m_vol)
		global.m_name[m] = mus
		music_set_pitch(global.music[m],pitch)
	}
}