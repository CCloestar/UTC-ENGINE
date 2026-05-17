pos = 0
<<<<<<< HEAD
snd = -1
=======
snd = no_sound
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

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

<<<<<<< HEAD
for (var i = 0;i < 25 * arlen(global.char);i++) {
=======
for (var i = 0;i < 25 * array_length(global.char);i++) {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	_x[i] = ch.x
	_y[i] = ch.y
	_f[i] = ch.f
}

<<<<<<< HEAD
draw_spr_c(n)
=======
chara_spr(n)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

alarm[0] = 1

depth = ch.depth + 5

image_speed = 0
image_index = 0