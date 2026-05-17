function music_is_playing(mus = global.music[1]){
	if music_exists(mus) {return audio_is_playing(mus)}
}