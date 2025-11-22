scene = 0

for (var i = 0;i < 3;i++) {
	timer[i] = 0
	frame[i] = 0
}

global.tp = 0

r = color_get_red(global.color[0])
g = color_get_green(global.color[0])
b = color_get_blue(global.color[0])

dcol = c_red
hcol = c_maroon

inv = 0
moving = 0

sp = 4
dsp = 4

soul_change()

w_tut = 0
hits = 0

if file_exists(global.soulfile) {
	ini_open(global.soulfile)
		w_tut = ini_read_real(string_lower(global.soul_name),"w",0)
	ini_close()
}
