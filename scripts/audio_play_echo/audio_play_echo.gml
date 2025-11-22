function audio_play_echo(soundid = no_sound,priority = 0,loop = 0,gain = 1,offset = 0,pitch = 1,amt = 0.1,d_sp = 1,d_dest = 2,pamt = 0) {
	audio_play(soundid,priority,loop,gain,offset,pitch)
	
	ec = i_create(,,,echo)
	ec.s = soundid
	ec.pr = priority
	ec.l = loop
	ec.g = gain
	ec.o = offset
	ec.p = pitch
	ec.force = amt
	ec.d_sp = d_sp
	ec.d_dest = d_dest
	ec.pforce = pamt
}