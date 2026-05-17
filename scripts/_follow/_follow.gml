function fl_create(_x = x,_y = y,_n = "Null"){
	var i = arlen(global.char)

	if !i {i = 1}

	global.char[i] = i_create(_x,_y,depth,o_follower)
	global.char[i].pos = (i - 1)
	global.char[i].fl = (12 * i)

	global.f_n[i - 1] = _n

	return global.char[i]
}

function check_follow(){
	var o = arlen(global.char)

	for (var i = 1;i < o;i++) {
		global.char[i] = i_create(x,y,depth,o_follower)
		global.char[i].pos = (i - 1)
		global.char[i].fl = (12 * i)
	}
}

function fl_max(){
	var f1,f2
	
	f1 = arlen(global.char) - 1
	f2 = arlen(global.name) - 1
	
	if f1 > f2 {f1 = f2}
	
	return f1
}

function fl_destroy(){
	var i,o
	
	i = arlen(global.char) - 1

	if i {
		destroy(global.char[i])
		ar_delete(global.char,i,1)
	}
	
	o = arlen(global.f_n) - 1
	
	if o {ar_delete(global.f_n,o,1)}
	else {global.f_n[0] = ""}
}

function del_fl_arrays(){
	arresize(global.char,0)
	arresize(global.f_n,0)

	global.char[0] = o_mainchara
	global.f_n[0] = ""
}