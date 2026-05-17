function move_obj(obj1 = o_follower,obj2 = o_mainchara,delay = 10) {
	_mov = i_create(,,,o_mover)
	_mov.d[0] = obj1
	_mov.d[1] = obj2
	_mov.sp = delay

	return _mov
}