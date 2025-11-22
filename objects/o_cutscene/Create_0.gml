mask_lay(,1)
for (var i = 0;i < 10;i++) {
	trigger[i] = 0
	_sin[i] = 0
	_cos[i] = 0
	_tan[i] = 0
	timer[i] = 0
}

a = dialogue
time = 0
sil = 0
scol = c_black

var cuts = 1
var _c = "config.ini"

if file_exists(_c) {
	ini_open(_c)
		cuts = ini_read_real(_c,"cuts",1)
	ini_close()
}

if !cuts {destroy()}

scr = "c_" + room_get_name(room) + "_" + string_lower(global.curCh)
c = asset_get_index(scr)

if script_exists(c) {script_execute(c)}