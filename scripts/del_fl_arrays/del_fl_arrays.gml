function del_fl_arrays(){
	for (var i = 0;i < array_length(global.char) * 10;i++) {
		array_delete(global.char,i,1)
		array_delete(global.f_n,i,1)
	}

	global.f_n[0] = ""
	global.char[0] = o_mainchara
}