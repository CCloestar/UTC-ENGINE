#macro arlen array_length
#macro arpush array_push
#macro ar_contains array_contains
function ar_high(a) {
	var _m = a[0]
	
	for (var i = 0;i < arlen(a);i++) {
		if a[i] > _m {_m = a[i]}
	}
	
	return _m
}
function ar_delete(a,i,n) {return array_delete(a,i,n)}
#macro arresize array_resize

#macro rnd random
#macro irnd irandom
function rndseed(n,fix = 1,get = 1) {
	if get {return random_get_seed()}
	return random_set_seed(n,fix)
}
function rnd_r(n1,n2,r = 1) {
	var _r = [n1,n2]

	repeat (r) {
		_r[0] = random_range(n1,n2)
		_r[1] = random_range(n1,n2)
	}
	
	return random_range(_r[0],_r[1])
}
function irnd_r(n1,n2,r = 1) {
	var _r = [n1,n2]

	repeat (r) {
		_r[0] = irandom_range(n1,n2)
		_r[1] = irandom_range(n1,n2)
	}
	
	return irandom_range(_r[0],_r[1])
}