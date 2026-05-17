if !is_mobile() or room = rm_startup {exit}

ch += any_pressed()
if ch {ch_t++}
if ch_t >= 90 {
	ch = 0
	ch_t = 0
}

if ch >= 4 or on_controller() {f = 1}
if f {a -= 0.05}
else {a += 0.05}

if a >= 0.3 {a = 0.3}
if a < 0 {
	a = 0
	ch = 0
	ch_t = 0
}

var sca,sc,s,sep,col,_x,_y
sca = 1.5
sc = (4.65 - sca) * set[1]
s = sca + sc
sep = (4 * s)

var scrw = display_get_gui_width() / 7
var _d = [display_get_dpi_x() / 6,display_get_dpi_y() / 6]
_d[2] = (640 - _d[0]) - (spr_w() * s)

var lx = 104 - scrw
var rx = 536 + scrw

_x[3] = clamp(lx + (200 * set[1]) + (200 * set[0]),-1000,303)

var _x3 = _x[3] - (200 * set[1])

_x[0] = (_x3 - 36) + (134 * set[1])
_x[1] = (_x3 - 96) + (18 * set[1])
_x[2] = (_x3 - 60) + (84 * set[1])

_x[5] = clamp(rx - (200 * set[1]) - (200 * set[0]),336,1000)
var _x5 = _x[5] + (200 * set[1])

_x[4] = (_x5 + 60) - (84 * set[1])

_y[0] = 456 - (0 * set[1])
_y[1] = 420 - (66 * set[1])
_y[2] = 360 - (186 * set[1])
_y[3] = 396 - (116 * set[1])

_y[4] = 360 - (202 * set[1])
_y[5] = 420 - (76 * set[1])

if in_debug() and !f {
	draw_rec(_x[3] - (16 * s),_y[2],_x[3],455,1,c_red,a)
	draw_rec(_x[1],_y[2],_x[3],_y[2] + (16 * s),1,c_lime,a)
	draw_rec(_x[1],_y[2],_x[1] + (16 * s),455,1,c_fuchsia,a)
	draw_rec(_x[1],_y[0] - (16 * s),_x[3],455,1,c_aqua,a)
	draw_rec(_x[2] - sep,_y[3] - sep,_x[2] + (16 * s) + sep,_y[3] + (16 * s) + sep,1,[c_fuchsia,c_aqua,c_lime,c_red],a)

	draw_rec(_x[5],_y[5],_x[5] + (spr_w() * s),455,1,c_red,a)
	draw_rec(_x[4],_y[4],_x[4] + (spr_w() * s),_y[4] + (spr_h() * s),1,c_blue,a)
}

m = [
	m_rec(_x[1],_y[0] - (16 * s),_x[3],455),
	m_rec(_x[1],_y[2],_x[1] + (16 * s),455),
	m_rec(_x[1],_y[2],_x[3],_y[2] + (16 * s)),
	m_rec(_x[3] - (16 * s),_y[2],_x[3],455),

	m_rec(_x[4],_y[4],_x[4] + (spr_w() * s),_y[4] + (spr_h() * s)),
	m_rec(_x[5],_y[5],_x[5] + (spr_w() * s),455),

	m_rec(_d[0],_d[1],_d[0] + (spr_w() * s),_d[1] + (spr_h() * s)),
	m_rec(_x[2] - sep,_y[3] - sep,_x[2] + (16 * s) + sep,_y[3] + (16 * s) + sep),
	m_rec(_d[2],_d[1],_d[2] + (spr_w() * s),_d[1] + (spr_h() * s)) * is_web()
]

for (var i = 0;i < arlen(m);i++) {
	m[i] *= !f

	var o = (i < 7) ? ((i > 3) ? _hold(-(i - 3)) : _hold(i)) : _hold(-4)
	col[i] = make_rgb(,[255,127 + (128 * o),39 - (39 * o)]) 
}

for (var i = 0;i < 4;i++) {
	var _a = -180 - (90 * i)
	draw_spr(,4,_x[i],_y[i],s,_a,col[i],a)
}

for (var i = 4;i < 6;i++) {draw_spr(,i - 4,_x[i],_y[i],s,0,col[i],a)}

draw_spr(,2 + (i_exists(dialogue) and dialogue.skip),_d[0],_d[1],s,,col[6],a)
if is_web() {draw_spr(,5 + window_get_fullscreen(),_d[2],_d[1],s,,col[7],a)}