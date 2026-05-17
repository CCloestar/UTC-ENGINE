function j_name(name = global.pname){
	var jpch = 0

	for (var j = 0;j < string_length(name);j++) {
		if string_ord_at(name,j) > 12288 {jpch = 1}
	}
	
	if l_check() {jpch = 1}
	
	return jpch
}