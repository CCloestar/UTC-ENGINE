scene = 0

for (var i = 0;i < 3;i++) {
	timer[i] = 0
	frame[i] = 0
}

global.tp = 0

<<<<<<< HEAD
r = cg_r(global.color[0])
g = cg_g(global.color[0])
b = cg_b(global.color[0])

col = [c_red,c_maroon]
=======
r = color_get_red(global.color[0])
g = color_get_green(global.color[0])
b = color_get_blue(global.color[0])

dcol = c_red
hcol = c_maroon
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

inv = 0
moving = 0

sp = 4
dsp = 4

soul_change()

w_tut = 0
hits = 0

<<<<<<< HEAD
if f_exists(global.soulfile) {
	ini_open(global.soulfile)
		w_tut = load_real("w",,str_l(global.soul_name))
	ini_close()
}
=======
if file_exists(global.soulfile) {
	ini_open(global.soulfile)
		w_tut = ini_read_real(string_lower(global.soul_name),"w",0)
	ini_close()
}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
