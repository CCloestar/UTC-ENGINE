<<<<<<< HEAD
draw_spr_c(n)
=======
chara_spr(n)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

var xx,yy,m,sp

xx = x
yy = y
m = 0
r = 0

<<<<<<< HEAD
if pos < arlen(global.name) - 1 {
=======
if pos < array_length(global.name) - 1 {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	global.name[pos + 1] = n
	global.color[pos + 1] = _c
}

if !c {
	m = (ch.x != _x[0] or ch.y != _y[0])

	if m {
<<<<<<< HEAD
		for (var i = arlen(_x);i > 0;i--) {
=======
		for (var i = array_length(_x);i > 0;i--) {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			_x[i] = _x[i - 1]
			_y[i] = _y[i - 1]
			_f[i] = _f[i - 1]
		}
		
		_x[0] = ch.x
		_y[0] = ch.y
		_f[0] = ch.f

		if abs(_x[fl + 1] - _x[fl]) > 4 or abs(_y[fl + 1] - _y[fl]) > 4 {r = 1}

		x = _x[fl]
		y = _y[fl]
		f = _f[fl]
	}
	else {
		image_speed = 0
		r = 2
		
		if dial_exists() and dialogue.snd = snd {image_index = dialogue.talkfr}
		else {image_index = 0}
	}

	if x != xx or y != yy {
		switch global.gamemode {
			default:
				image_speed = 0.2 * (r + 1)
			break
		}
	}	
}

if global.debug {
<<<<<<< HEAD
	if key_hold(vk_shift) {
		if c_pressed() {
			if !c {c = 1}
			else {i_move(o_follower)}
=======
	if vk_hold(vk_shift) {
		if c_pressed() {
			if !c {c = 1}
			else {move_obj()}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		}
	}
}

if _alp != 0 {
	var _res = (_alp > 0)

	if image_alpha != _res {image_alpha += _alp * 0.1}
	else {
		image_alpha = _res
		_alp = 0
	}
}