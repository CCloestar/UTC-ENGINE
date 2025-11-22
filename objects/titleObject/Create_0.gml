menuScene = 0
op = 0
can_select = 1
delay = 0

for (var i = 0;i < 9;i++) {
	trigger[i] = 0
	timer[i] = 0
}

wrote = ""

shakey = 0
s = 0
int = 0

if file_exists(global.filename) {
	ini_open(global.filename)
		for (var i = 0;i < array_length(global.story);i++) {global.story[i] = ini_read_real("savefile","st_" + string(i),global.story[i])}
	ini_close()
}

var _c = "config.ini"

if file_exists(_c) {
	ini_open(_c)
		global.SHAKE_OPTION = ini_read_real(_c,"shake",global.SHAKE_OPTION)
		global.autoRUN = ini_read_real(_c,"arun",global.autoRUN)
		for (var i = 0;i < 7;i++) {
			for (var o = 0;o < 2;o++) {global.bt[i,o] = keyboard_get_map(ini_read_real(_c,"k_" + string(i) + "_" + string(o),global.bt[i,o]))}
		}

		global.lang = ini_read_real(_c,"lang",global.lang)
		load_langs()
	ini_close()
}

_c = global.soulfile
var _s = string_lower(global.soul_name)

if file_exists(_c) {
	ini_open(_c)
		global.lmode = ini_read_real(_s,"lmode",0)
	ini_close()
}

load_d_dw()
audio_stop_all()
audio_play(UT_0)