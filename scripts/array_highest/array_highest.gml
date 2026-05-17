function array_highest(a){
	var _m = a[0]
	
	for (var i = 0;i < array_length(a);i++) {
		if a[i] > _m {_m = a[i]}
	}
	
	return _m
}