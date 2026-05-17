function dialsm_create(_x = x + 397,_y = y + 66,m = "Small test\nmessage",c = "Toriel",e = 1,mo = t_m_main,mo_f = 0,_id = 0,dep = depth - 100,dir = -180,pos = -1){
	var _ds = i_create(_x,_y,dep,dialsmall)
	_ds.direction = dir
	_ds.c = c
	_ds.m = m
	_ds.e = e
	_ds.mo = mo
	_ds.mo_f = mo_f
	_ds._id = _id
	_ds.pos = pos

	return _ds
}