function music_exists(mus){
	if is_str(mus) {
		var loc = working_directory
		var m = mus
		var _sm = $"{m}_{str_l(global.soul_name)}"

		if f_exists($"{loc}{_sm}.ogg") {m = _sm}
		return f_exists($"{loc}{m}.ogg")
	}
	else {return audio_exists(mus)}
}

function music_preload() {
	var _f = file_find_first("*.ogg",0)
	global.m_file = []
	
	while (_f != "") {
		var s = audio_create(_f)
		var d = {id: s,name: filename_change_ext(_f,"")}
		arpush(global.m_file,d)

		_f = file_find_next()
	}
	file_find_close()
}

function music_play(music,vol = 1,pitch = global.pitch,loop = 1,loopTime = 0,m = 1){
	var loc = is_web() ? "" : working_directory
	var mus = music
	if !f_exists($"{loc}{mus}.ogg") {mus = $"mus_{mus}"}

	var _sm = $"{mus}_{str_l(global.soul_name)}"
	if f_exists($"{loc}{_sm}.ogg") {mus = _sm}
	
	var l_mus = $"{mus}_{tr_l("lang")}"
	if f_exists($"{loc}{l_mus}.ogg") {mus = l_mus}
	
	var _m = -1
	var locmus = $"{loc}{mus}.ogg"
	
	print(locmus)

	if f_exists(locmus) {
		if m > -1 and music_is_playing(global.music[m]) {music_stop(m)}
		if !is_web() {_m = audio_create(locmus)}
		else {
			for (var i = 0;i < arlen(global.m_file);i++) {
				if global.m_file[i].name = mus {
					_m = global.m_file[i].id
					break
				}
			}
		}

		if loop {
			audio_sound_loop_start(_m,loopTime)
			audio_sound_loop_end(_m,audio_sound_length(_m))
		}

		global.music[m] = audio_play_sound(_m,-9998,loop,vol * global.m_vol)
		global.m_name[m] = mus
		if pitch = -1 {pitch = 1}
		music_pitch(global.music[m],pitch)
	}
}
	
function music_pause(mus = global.music[1]){
	if music_exists(mus) {return audio_pause_sound(mus)}
}

function music_is_paused(mus = global.music[1]){
	return audio_is_paused(mus)
}

function music_resume(mus = global.music[1]){
	if music_exists(mus) {return audio_resume_sound(mus)}
}

function music_is_playing(mus = global.music[1]){
	if music_exists(mus) {return audio_is_playing(mus)}
}

function music_stop(mus = 1){
	if mus > -1 {
		var _mu = global.music[mus]

		if music_exists(_mu) {
			audio_stop_sound(_mu)
			audio_destroy(_mu)

			global.music[mus] = -1
			global.m_name[mus] = ""
		}
	}
	else {
		for (var i = 0;i < 3;i++) {music_stop(i)}
	}
}

function music_pitch(mus = global.music[1],p = global.pitch) {
	if p > -1 {return audio_sound_pitch(mus,p)}
	else {return audio_sound_get_pitch(mus)}
}

function music_pos(mus = global.music[1],p = -1) {
	if p > -1 {return audio_sound_set_track_position(mus,p)}
	else {return audio_sound_get_track_position(mus)}
}

function music_vol(mus = global.music[1],v = 1) {
	if mus = -1 {return 0}
	if v > -1 {return audio_sound_gain(mus,v * global.m_vol,0)}
	else {return audio_sound_get_gain(mus)}
}