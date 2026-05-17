menuScene = 0
op = 0
can_select = 1
delay = 0

<<<<<<< HEAD
timers_create(9)
=======
for (var i = 0;i < 9;i++) {
	trigger[i] = 0
	timer[i] = 0
}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

wrote = ""

shakey = 0
s = 0
int = 0

<<<<<<< HEAD
if f_exists(global.filename) {
	ini_open(global.filename)
		for (var i = 0;i < arlen(global.story);i++) {global.story[i] = load_real($"st_{i}",global.story[i])}
=======
if file_exists(global.filename) {
	ini_open(global.filename)
		for (var i = 0;i < array_length(global.story);i++) {global.story[i] = ini_read_real("savefile","st_" + string(i),global.story[i])}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	ini_close()
}

var _c = "config.ini"

<<<<<<< HEAD
if f_exists(_c) {
	ini_open(_c)
		global.simpleVFX = load_real("simpleVFX",global.simpleVFX,_c)
		global.autoRUN = load_real("autoRUN",global.autoRUN,_c)

		for (var i = 0;i < 7;i++) {
			for (var o = 0;o < 2;o++) {global.bt[i,o] = key_map(load_real($"k_{i}_{o}",global.bt[i,o],_c))}
		}

		global.lang = load_real("lang",global.lang,_c)
=======
if file_exists(_c) {
	ini_open(_c)
		global.simpleVFX = ini_read_real(_c,"simpleVFX",global.simpleVFX)
		global.autoRUN = ini_read_real(_c,"arun",global.autoRUN)
		for (var i = 0;i < 7;i++) {
			for (var o = 0;o < 2;o++) {global.bt[i,o] = keyboard_get_map(ini_read_real(_c,"k_" + string(i) + "_" + string(o),global.bt[i,o]))}
		}

		global.lang = ini_read_real(_c,"lang",global.lang)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		load_langs()
	ini_close()
}

<<<<<<< HEAD
rfnt = 0

_c = global.soulfile
var _s = str_l(global.soul_name)

if f_exists(_c) {
	ini_open(_c)
		global.lmode = load_real("lmode",,_s)
	ini_close()
}

audio_free()

if global.init = -1 {
	menuScene = 6
	shakey = 1
}
else {audio_play(UT_0)}
=======
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
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
