global.scrSC = 1
global.scrSHOT = -1
if variable_global_exists("buff") {buffer_delete(global.buff)}
global.buff = buffer_create(1048576,buffer_fixed,1)

//player
global.debug = 0
global.showcol = 0
global.inBeta = 0
global.pname = ""
global.soul_name = "NULL"
global.lv = 1
global.skin = 0
global.tp = 0
global.xp = 0
global.next = 10
global.fplay = 0

global.f_n[0] = ""
global.char[0] = o_mainchara

for (var i = 0;i < 3;i++) {
	global.name[i] = "Null"
	global.color[i] = c_red

	for (var o = 0;o < 2;o++) {
		global.hp[i,o] = 20
		global.maxhp[i,o] = 20

		global.wep[i,o] = "None"
		global.wep_b[i,o] = 0
	
		global.arm[i,o] = "None"
		global.arm_b[i,o] = 0
	
		global.at[i,o] = 8 + (global.lv * 2)
		global.df[i,o] = 9 + ceil(global.lv / 4)
	}
}

del_fl_arrays()

for (var i = 0;i < 2;i++) {
	global.g[i] = 0
	global.kills[i] = 0
	global.spares[i] = 0
}

global.curRoom = "rm_startup"
global.X = 0
global.Y = 0
global.F = 0

global.route = 0 // 0 is pacifist, 1 is neutral and its variants, 2 is genocide
global.area = 0 //checks if its ruins themed, or other stages themed yknow

for (var musics = 0;musics < 3;musics++) {
	global.music[musics] = -1 //0 = previous, 1 = current,2 = next
	global.m_name[musics] = ""
}

global.next_play = 0
global.pitch = 1

//CONFIGURATIONS
global.simpleVFX = 0
global.autoRUN = 0
global.lmode = 0
global.s_vol = 1
global.m_vol = 1
global.lang = -1
reset_keys()

global.time = 0
global.roomName = "--"

global.inBattle = 0
global.battled = 0
global.bstory = 0
global.en_r = 0

global.choice = -1

for (var i = 0;i < 13;i++) {
	for (var o = 0;o < 6;o++) {global.item[i,o] = ""}
	for (var o = 0;o < 2;o++) {global.box[i,o] = ""}
}

for (var st = 0;st < 128;st++) {global.story[st] = 0}
global.howfar = 0

global.lay = 0

global.shop_id = 0
global.date_id = 0

global.noclip = 0

global.gamemode = 0
global.changeName = 1
global.canRun = 0
global.hasLmode = 0

global.world = 0 //0 = LIGHT; 1 = DARK;etc...
if !variable_global_exists("curCh") {global.curCh = 1}
if !i_exists(gpad) {i_create(,,,gpad)}

global.hard = 0
global.fun = 0
global.init = 0

if !i_exists(touchpad) {
	i_create(,,depth - 20,touchpad)
	if is_web() {
		global.init = -2
		i_create(,,depth - 9,web_check)
		if !variable_global_exists("m_file") {music_preload()}
	}
}

var _c = "config.ini"

if f_exists(_c) {
	ini_open(_c)
		global.autoRUN = load_real("autoRUN",,_c)
		global.simpleVFX = load_real("simpleVFX",,_c)
		global.s_vol = load_real("s_vol",1,_c)
		global.m_vol = load_real("m_vol",1,_c)
		global.lang = load_real("lang",global.lang,_c)
		global.debug = load_real("debug",,_c)
		global.showcol = load_real("showcol",,_c)
		global.inBeta = load_real("beta",,_c)
		global.bstory = load_real("bstory",,_c)
		global.gamemode = load_real("gmode",,_c)
		global.world = load_real("world",global.world,_c)
		global.area = load_real("a",global.area,_c)
		global.hard = load_real("hard",global.hard,_c)
		global.init = load_real("init",global.init,_c)
		global.date_id = load_real("date",global.date_id,_c)

		for (var i = 0;i < arlen(global.story);i++) {
			global.story[i] = load_real($"st_{i}",global.story[i],_c)
			global.story[i] = load_real($"dvu_{i}",global.story[i],_c)
		}
	ini_close()
}

load_soul()
load_langs()

window_set_caption($"UNDERTALE {str_u(global.soul_name)}")

global.tooMuch = "toomuch"
var t = $"toomuch_{str_l(global.soul_name)}"
if f_exists($"{working_directory}mus_{t}.ogg") {global.tooMuch = t}
print(global.tooMuch)

var sname = str_l(global.soul_name)

if f_exists(global.soulfile) {
	ini_open(global.soulfile)
		global.lmode = load_real("lmode",,sname)
		global.fun = load_real("fun",,sname)
	ini_close()
}

lmode_ef()

if !i_exists(border) {i_create(x - 159.5,y - 32,depth - 15,border)}
else {
	_c = global.soulfile

	if f_exists(_c) {
		ini_open(_c)
			border.cur_b = load_real("b",border.cur_b,str_l(global.soul_name))
		ini_close()
	}
}

if !i_exists(display) {i_create(0,0,depth - 10,display)}

depth = -9999
quit = 0
resetted = 0

reload_memory()