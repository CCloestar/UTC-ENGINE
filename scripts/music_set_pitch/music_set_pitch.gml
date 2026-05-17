function music_set_pitch(mus = global.music[1],pit = global.pitch){
	if music_exists(mus) {return audio_sound_pitch(mus, pit)}
}