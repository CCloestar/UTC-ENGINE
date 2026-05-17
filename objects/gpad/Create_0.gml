gpads = []
_gpad = -1

reset_gpad()

var _c = "config.ini"

debug = 0

<<<<<<< HEAD
if f_exists(_c) {
	ini_open(_c)
		dch = load_real("dc",dch,_c)
		for (var i = 0;i < 3;i++) {bt[i] = load_real($"bt_{i}",bt[i],_c)}
		for (var i = 0;i < 2;i++) {sens[i] = load_real($"bs_{i}",sens[i],_c)}
		debug = (load_real("device",,_c) = 1)
=======
if file_exists(_c) {
	ini_open(_c)
		dch = ini_read_real(_c,"dc",dch)
		for (var i = 0;i < 3;i++) {bt[i] = ini_read_real(_c,"bt_" + string(i),bt[i])}
		for (var i = 0;i < 2;i++) {sens[i] = ini_read_real(_c,"bs_" + string(i),sens[i])}
		debug = ini_read_real(_c,"device",0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	ini_close()
}

sens[2] = sens[0] * 0.5