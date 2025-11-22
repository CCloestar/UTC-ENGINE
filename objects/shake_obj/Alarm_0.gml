if sh_f != 0 {
	obj.x += sh_f
	if sh_f < 0 and !cont {sh_f++}
	sh_f = round(sh_f)
	
	sh_f *= -1
}
else {destroy()}

alarm[0] = sh_time