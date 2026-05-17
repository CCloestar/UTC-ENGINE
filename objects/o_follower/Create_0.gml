pos = 0
snd = -1

ch = o_mainchara
fl = 12

n = global.f_n[pos]
c = 0
f = ch.f
r = 2
p = 0
_c = c_red
_dep = 1
_alp = 0

for (var i = 0;i < 25 * arlen(global.char);i++) {
	_x[i] = ch.x
	_y[i] = ch.y
	_f[i] = ch.f
}

draw_spr_c(n)

alarm[0] = 1

depth = ch.depth + 5

image_speed = 0
image_index = 0