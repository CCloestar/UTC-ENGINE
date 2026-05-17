function fade(out = 0,dep = -90000){
	if out {return i_create(,,dep,start_fade)}
	else {return i_create(,,dep,end_fade)}
}
	
function fading(out = 0){
	var obj = end_fade	
	if out {obj = start_fade}

	return i_exists(obj)
}

function shake(scr = 1,f = 2,obj = self,time = 2,continous = 0) {
	if scr {s = i_create(f,f,globals.depth,shake_screen)}
	else {
		s = i_create(obj.x,obj.y,globals.depth,shake_obj)
		s.obj = obj
	}
	
	if i_exists(s) {
		s.sh_time = time
		s.sh_f = f
		s.cont = continous
		
		return s
	}
}
	
function a_image(spr = sprite_index,img = image_index,_x = xprevious,_y = yprevious,_dep = depth,sc = [image_xscale,image_yscale],bg_blend = 0,col = image_blend,ef = 0,rev = 0,sp = 0.05) {
	var s = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]
	var c = is_array(col) ? [col[0],col[1]] : [col,col]

	a = i_create(_x,_y,_dep,afterimage)
	a.spr = spr
	a.sc = [s[0],s[1]]
	a.bg_blend = bg_blend
	a.col = [c[0],c[1]]
	a.ef = ef
	a.rev = rev
	a.sp = sp
	a.c = img

	return a
}