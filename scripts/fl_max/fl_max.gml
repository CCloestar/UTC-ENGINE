function fl_max(){
	var f1,f2
	
	f1 = array_length(global.char) - 1
	f2 = array_length(global.name) - 1
	
	if f1 > f2 {f1 = f2}
	
	return f1
}