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

<<<<<<< HEAD
if f_exists(_c) {
	ini_open(_c)
		cuts = load_real("cuts",1,_c)
=======
if file_exists(_c) {
	ini_open(_c)
		cuts = ini_read_real(_c,"cuts",1)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	ini_close()
}

if !cuts {destroy()}

<<<<<<< HEAD
scr = [
	$"c_{str_l(room_get_name(room))}",
	$"c_battle_{str_l(global.bstory)}",
	$"c_date_{str_l(global.date_id)}"
]

for (var i = 0;i < arlen(scr);i++) {scr[i] += $"_{global.curCh}"}

curscr = 0
if global.inBattle {curscr = 1}
if room = rm_date {curscr = 2}

scr_execute(scr[curscr])
=======
scr[0] = "c_" + room_get_name(room) + "_" + string_lower(global.curCh)
scr[1] = "c_rm_battle_" + string_lower(global.bstory) + "_" + string_lower(global.curCh)

c = asset_get_index(scr[global.inBattle])
if script_exists(c) {script_execute(c)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
