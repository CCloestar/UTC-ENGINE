scene = 0

for (var i = 0;i < 3;i++) {
	timer[i] = 0
	frame[i] = 0
}

global.tp = 0

r = cg_r(global.color[0])
g = cg_g(global.color[0])
b = cg_b(global.color[0])

col = [c_red,c_maroon]

inv = 0
moving = 0

sp = 4
dsp = 4

soul_change()

w_tut = 0
hits = 0

if f_exists(global.soulfile) {
	ini_open(global.soulfile)
		w_tut = load_real("w",,str_l(global.soul_name))
	ini_close()
}