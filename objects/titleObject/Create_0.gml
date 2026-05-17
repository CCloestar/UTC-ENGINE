menuScene = 0
op = 0
can_select = 1
delay = 0

timers_create(9)

wrote = ""

shakey = 0
s = 0
int = 0

if f_exists(global.filename) {
	ini_open(global.filename)
		for (var i = 0;i < arlen(global.story);i++) {global.story[i] = load_real($"st_{i}",global.story[i])}
	ini_close()
}

var _c = "config.ini"

if f_exists(_c) {
	ini_open(_c)
		global.simpleVFX = load_real("simpleVFX",global.simpleVFX,_c)
		global.autoRUN = load_real("autoRUN",global.autoRUN,_c)

		for (var i = 0;i < 7;i++) {
			for (var o = 0;o < 2;o++) {global.bt[i,o] = key_map(load_real($"k_{i}_{o}",global.bt[i,o],_c))}
		}

		global.lang = load_real("lang",global.lang,_c)
		load_langs()
	ini_close()
}

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