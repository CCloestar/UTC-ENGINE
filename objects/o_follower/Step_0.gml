chara_spr(n)

var xx,yy,m,sp

xx = x
yy = y
m = 0
r = 0

if pos < array_length(global.name) - 1 {
	global.name[pos + 1] = n
	global.color[pos + 1] = _c
}

if !c {
	m = (ch.x != _x[0] or ch.y != _y[0])

	if m {
		for (var i = array_length(_x);i > 0;i--) {
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
	if vk_hold(vk_shift) {
		if c_pressed() {
			if !c {c = 1}
			else {move_obj()}
		}
	}
}