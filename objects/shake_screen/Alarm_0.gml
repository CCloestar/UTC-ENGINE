if sh_f != 0 {
	view_xport[c] += sh_f
	view_yport[c] += sh_f
	
	if sh_f < 0 and !cont {sh_f++}
	
	sh_f *= -1
}
else {destroy()}

alarm[0] = sh_time