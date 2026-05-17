function audio_stop(soundid) {
	if audio_is_playing(soundid) {return audio_stop_sound(soundid)}
}