function music_set_volume(mus = global.music[1],vol = 1){
	if music_exists(mus) {return audio_sound_gain(mus,vol * global.m_vol,0)}
}