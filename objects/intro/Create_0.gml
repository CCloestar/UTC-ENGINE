p = 0
p_a = 0

f_alp = 0
f_col = c_black

skip = 0
s_alp = 0

a = dial_create(120 - (4 * l_check()),328)

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

var spr = asset_get_index("intro_" + string_lower(global.soul_name))
	
if sprite_exists(spr) {sprite_index = spr}

music_play("mus_story",,0.91)