function music_set_pos(mus = global.music[1],pos = 0){
	return audio_sound_set_track_position(mus,pos)
}