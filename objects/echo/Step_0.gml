timer += d_sp

if timer >= d_dest {
	timer = 0
	
	g -= force
	p -= pforce
	
	if g > 0 {audio_play(s,pr,l,g,o,p)}
	else {destroy()}
}