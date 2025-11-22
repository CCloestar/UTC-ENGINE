function music_get_pitch(mus = global.music[1]){
	if music_exists(mus) {return audio_sound_get_pitch(mus)}
}