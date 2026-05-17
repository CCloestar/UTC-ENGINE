timer += d_sp

if timer >= d_dest {
	timer = 0
<<<<<<< HEAD

	g -= force
	p -= pforce

=======
	
	g -= force
	p -= pforce
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	if g > 0 {audio_play(s,pr,l,g,o,p)}
	else {destroy()}
}