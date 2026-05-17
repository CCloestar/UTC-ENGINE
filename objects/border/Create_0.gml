alp = 0
force = 1 / 30

application_surface_enable(1)
application_surface_draw_enable(0)

cur_b = 0
max_b = 3
max_ex = 3

for (var i = 0;i < 2;i++) {
	img[i] = 0
	trigger[i] = 0
	timer[i] = 0
}

a = 0
f = 0
fspr = 0
ft = 0

var _c = "config.ini"

<<<<<<< HEAD
if f_exists(_c) {
	ini_open(_c)
		window_set_fullscreen(load_real("fScreen",,_c))
	ini_close()
}
if is_deck() or (is_mobile() and !touchpad.debug) {window_set_fullscreen(1)}

_c = global.soulfile

if f_exists(_c) {
	ini_open(_c)
		cur_b = load_real("b",cur_b,str_l(global.soul_name))
=======
if is_deck() {window_set_fullscreen(1)}
else if file_exists(_c) {
	ini_open(_c)
		window_set_fullscreen(ini_read_real(_c,"fScreen",0))
	ini_close()
}

_c = global.soulfile

if file_exists(_c) {
	ini_open(_c)
		cur_b = ini_read_real(string_lower(global.soul_name),"b",cur_b)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	ini_close()
}