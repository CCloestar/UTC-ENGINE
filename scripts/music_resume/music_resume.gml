function music_resume(mus = global.music[1]){
	if music_exists(mus) {return audio_resume_sound(mus)}
}