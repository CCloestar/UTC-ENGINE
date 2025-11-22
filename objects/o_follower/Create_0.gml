pos = 0
snd = no_sound

ch = o_mainchara
fl = 12

n = global.f_n[pos]
c = 0
f = ch.f
r = 2
p = 0
_c = c_red

for (var i = 0;i < 25 * array_length(global.char);i++) {
	_x[i] = ch.x
	_y[i] = ch.y
	_f[i] = ch.f
}

chara_spr(n)

alarm[0] = 1

depth = ch.depth + 5

image_speed = 0
image_index = 0