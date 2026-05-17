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

if f_exists(_c) {
	ini_open(_c)
		cuts = load_real("cuts",1,_c)
	ini_close()
}

if !cuts {destroy()}

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