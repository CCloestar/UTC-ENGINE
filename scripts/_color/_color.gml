#macro cg_r color_get_red
#macro cg_g color_get_green
#macro cg_b color_get_blue

function draw_col(c = -1) {
	if c = -1 {return draw_get_color()}
	else {return draw_set_color(c)}
}

function make_rgb(c = global.color[0],_c = [cg_r(c),cg_g(c),cg_b(c)],v = [0,0,0],inv = 0) {
	var _cc = [0,0,0]

	for (var i = 0;i < 3;i++) {
		_cc[i] = !inv ? (_c[i] + v[i]) : (v[i] - _c[i])
		_cc[i] = clamp(_cc[i],0,255)
	}

	return make_color_rgb(_cc[0],_cc[1],_cc[2])
}

function i_col(c = draw_col()) {return make_rgb(c,,[255,255,255],1)}

function get_rgb(c = draw_col()) {
	var _c = [cg_r(c),cg_g(c),cg_b(c)]
	return print(_c)
}

#macro make_hsv make_color_hsv