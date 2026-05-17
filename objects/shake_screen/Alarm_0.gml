if sh_f != 0 {
	view_xport[c] += sh_f
	view_yport[c] += sh_f
<<<<<<< HEAD
	if sh_f < 0 and !cont {sh_f++}
=======
	
	if sh_f < 0 and !cont {sh_f++}
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	sh_f *= -1
}
else {destroy()}

alarm[0] = sh_time