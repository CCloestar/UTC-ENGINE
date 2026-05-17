function music_pause(mus = global.music[1]){
	if music_exists(mus) {return audio_pause_sound(mus)}
}