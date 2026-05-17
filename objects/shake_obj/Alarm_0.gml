if sh_f != 0 {
	obj.x += sh_f
	if sh_f < 0 and !cont {sh_f++}
	sh_f = round(sh_f)
<<<<<<< HEAD
=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	sh_f *= -1
}
else {destroy()}

alarm[0] = sh_time