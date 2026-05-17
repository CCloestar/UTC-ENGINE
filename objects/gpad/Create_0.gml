gpads = []
_gpad = -1

reset_gpad()

var _c = "config.ini"

debug = 0

if f_exists(_c) {
	ini_open(_c)
		dch = load_real("dc",dch,_c)
		for (var i = 0;i < 3;i++) {bt[i] = load_real($"bt_{i}",bt[i],_c)}
		for (var i = 0;i < 2;i++) {sens[i] = load_real($"bs_{i}",sens[i],_c)}
		debug = (load_real("device",,_c) = 1)
	ini_close()
}

sens[2] = sens[0] * 0.5