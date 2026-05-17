function i_create(_x = x,_y = y,_dep = depth - 1,obj = noone){return instance_create_depth(_x,_y,_dep,obj)}
#macro i_exists instance_exists
#macro i_number instance_number

function destroy(obj = self){
	if i_exists(obj) {instance_destroy(obj)}
}

function i_move(obj1 = self,obj2 = o_mainchara,delay = 10) {
	_mov = i_create(,,,o_mover)
	_mov.d[0] = obj1
	_mov.d[1] = obj2
	_mov.sp = delay

	return _mov
}