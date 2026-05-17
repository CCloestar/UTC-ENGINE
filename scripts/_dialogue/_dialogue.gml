function dial_create(xx = 0,yy = 0,dep = globals.depth + 1) {return i_create(xx,yy,dep,dialogue)}
function dial_exists() {return i_exists(dialogue)}
function dial_destroy() {return destroy(dialogue)}

function dialsm_create(_x = x + 397,_y = y + 66,m = "Small test\nmessage",c = "Toriel",e = 1,mo = t_m_main,mo_f = 0,_id = 0,dep = depth - 100,dir = -180,pos = -1){
	_ds = i_create(_x,_y,dep,dialsmall)
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
function dialsm_exists() {return i_exists(dialsmall)}
function dialsm_destroy() {return destroy(dialsmall)}

function choice_create(c_id = 0,dep = "D",d = dialogue){
	if dial_exists() {
		if dep = "D" {dep = dialogue.depth - 5}
		
		_choice = i_create(,,dep,choicer)
		_choice._id = c_id
		_choice.d = d
	 
		return _choice
	}
}
function choice_exists() {return i_exists(choicer)}