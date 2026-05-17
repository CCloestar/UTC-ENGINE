function shake(scr = 1,f = 2,obj = self,time = 2,continous = 0) {
	if scr {s = i_create(f,f,globals.depth,shake_screen)}
	else {
		s = i_create(obj.x,obj.y,globals.depth,shake_obj)
		s.obj = obj
	}
	
	s.sh_time = time
	s.sh_f = f
	s.cont = continous
	
	return s
}