gpads = []
_gpad = -1

reset_gpad()

var _c = "config.ini"

debug = 0

if file_exists(_c) {
	ini_open(_c)
		dch = ini_read_real(_c,"dc",dch)
		for (var i = 0;i < 3;i++) {bt[i] = ini_read_real(_c,"bt_" + string(i),bt[i])}
		for (var i = 0;i < 2;i++) {sens[i] = ini_read_real(_c,"bs_" + string(i),sens[i])}
		debug = ini_read_real(_c,"device",0)
	ini_close()
}