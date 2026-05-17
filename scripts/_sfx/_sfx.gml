#macro snd_name audio_get_name

function audio_create(s) {
	var snd = audio_create_stream(s)
	reload_memory()
	return snd
}

function audio_destroy(s) {
	audio_destroy_stream(s)
	reload_memory()
}

function audio_play(s,pr = 1,loop = 0,gain = 1,pos = 0,pitch = 1){
	if s = -1 {return -1}
	var sn = [s,global.l_snd,0]

	if !is_str(sn[0]) {
		sn[0] = snd_name(s)
		sn[2] = 1
	}
	
	var fsn = [ $"{sn[0]}_{tr_l("lang")}",-1]

	switch sn[2] {
		case 0:
			if l_check() {fsn[0] = $"{sn[0]}_ja"}
			if l_check("US") {fsn[0] = $"{sn[0]}_en"}
			
			fsn[1] = global.l_sn[$ fsn[0]]
			
			if fsn[1] = undefined {
				fsn[1] = global.l_sn[$ $"{sn[0]}_en"]
				fsn[1] = (fsn[1] = undefined) ? global.l_sn[$ sn[0]] : fsn[1]
			}
			
			fsn[1] = fsn[1] ?? squeak
		break
		
		case 1:
			fsn[1] = a_index(sn[0])
		break
	}


	return audio_play_sound(fsn[1],pr,loop,gain * global.s_vol,pos,pitch)
}

function audio_pause(s){
	if audio_is_playing(s) {return audio_pause_sound(s)}
}

function audio_resume(s){
	if audio_is_paused(s) {return audio_resume_sound(s)}
}

function audio_stop(s) {
	if audio_is_playing(s) {return audio_stop_sound(s)}
}

function audio_play_echo(s = -1,pr = 0,loop = 0,gain = 1,pos = 0,pitch = 1,amt = 0.1,d_sp = 1,d_dest = 2,pamt = 0) {
	audio_play(s,pr,loop,gain,pos,pitch)
	
	ec = i_create(,,,echo)
	ec.s = s
	ec.pr = pr
	ec.l = loop
	ec.g = gain
	ec.o = pos
	ec.p = pitch
	ec.force = amt
	ec.d_sp = d_sp
	ec.d_dest = d_dest
	ec.pforce = pamt
}

function audio_free() {
	music_stop(-1)
	audio_stop_all()
}