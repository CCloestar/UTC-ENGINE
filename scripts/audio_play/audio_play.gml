function audio_play(soundid,priority = 1,loops = 0,gain = 1,offset = 0,pitch = 1){
	if audio_exists(soundid) {return audio_play_sound(soundid,priority,loops,gain * global.s_vol,offset,pitch)}
}