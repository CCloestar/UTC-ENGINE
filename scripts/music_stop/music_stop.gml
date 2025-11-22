function music_stop(mus = 1){
	var _mu = global.music[mus]

	if music_exists(_mu) {
		audio_destroy_stream(_mu)
		audio_stop_sound(_mu)
		
		global.music[mus] = no_sound
		global.m_name[mus] = "no_sound"
	}
}