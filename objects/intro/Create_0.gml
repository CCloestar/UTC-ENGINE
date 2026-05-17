p = 0
p_a = 0

f_alp = 0
f_col = c_black

skip = 0
s_alp = 0

a = dial_create(120,328)

with (a) {
	preset = -1
	skip = 0
	play = 0
	finish = 0
	x_sep = 18
	y_sep += 2 * l_check()
	snd = dial_alt
	sp = 2
}

m = 0
cur_t = 0
_fade = 0

for (var i = 0;i < 3;i++) {timer[i] = 0}

var spr = a_index($"intro_{str_l(global.soul_name)}")
if spr_exists(spr) {sprite_index = spr}

music_play("story",,0.91)