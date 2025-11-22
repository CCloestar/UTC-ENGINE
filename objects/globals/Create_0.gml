global.scrSC = 1
global.scrSHOT = -1
if !variable_global_exists("buff") {global.buff = buffer_create(1048576,buffer_fixed,1)}

//player
global.debug = 0
global.showcol = 0
global.inBeta = 0
global.pname = ""
global.changeName = 1
global.soul_name = "NULL"
global.canRun = 0
global.hasLmode = 0
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
	global.music[musics] = no_sound //0 = previous, 1 = current,2 = next
	global.m_name[musics] = "no_sound"
}

global.next_play = 0
global.pitch = 1

//CONFIGURATIONS
global.autoRUN = 0
global.SHAKE_OPTION = 1
global.s_vol = 1
global.m_vol = 1
global.lang = 0
global.lmode = 0
reset_keys()

global.time = 0
global.roomName = "--"

global.inBattle = 1
global.battled = 0
global.bstory = 0

global.choice = -1

global.enAmt = 1

for (var i = 0;i < 13;i++) {
	for (var o = 0;o < 6;o++) {global.item[i,o] = ""}
	for (var o = 0;o < 2;o++) {global.box[i,o] = ""}
}

for (var st = 0;st < 128;st++) {global.story[st] = 0}
global.howfar = 0

global.lay = 0
global.shop_id = 0

global.noclip = 0

global.gamemode = 0
global.world = 0 //0 = LIGHT; 1 = DARK;etc...
if !variable_global_exists("curCh") {global.curCh = 1}
if !i_exists(gpad) {i_create(,,,gpad)}

global.hard = 0
global.fun = 0
global.init = 0

var _c = "config.ini"

if file_exists(_c) {
	ini_open(_c)
		global.autoRUN = ini_read_real(_c,"autoRUN",0)
		global.SHAKE_OPTION = ini_read_real(_c,"shake",1)
		global.BORDEROP = ini_read_real(_c,"border",0)
		global.s_vol = ini_read_real(_c,"s_vol",1)
		global.m_vol = ini_read_real(_c,"m_vol",1)
		global.lang = ini_read_real(_c,"lang",0)
		global.debug = ini_read_real(_c,"debug",0)
		global.showcol = ini_read_real(_c,"showcol",0)
		global.inBeta = ini_read_real(_c,"beta",0)
		global.bstory = ini_read_real(_c,"bstory",0)
		global.gamemode = ini_read_real(_c,"gmode",0)
		global.world = ini_read_real(_c,"world",global.world)
		global.area = ini_read_real(_c,"a",global.area)
		global.hard = ini_read_real(_c,"hard",global.hard)
		global.init = ini_read_real(_c,"init",global.init)

		for (var i = 0;i < array_length(global.story);i++) {
			global.story[i] = ini_read_real(_c,"st_" + string(i),global.story[i])
			global.story[i] = ini_read_real(_c,"dvu_" + string(i),global.story[i])
		}
	ini_close()
}

if !variable_global_exists("font_init") {
	load_soul()
	load_langs()
	load_keys()
	load_fonts()
	
	global.font_init = 1
}

window_set_caption("UNDERTALE " + string_upper(global.soul_name))

global.tooMuch = "mus_toomuch"
var tmus = "mus_toomuch_" + string_lower(global.soul_name)
if file_exists(working_directory + tmus + ".ogg") {global.tooMuch = tmus}

var sname = string_lower(global.soul_name)

if file_exists(global.soulfile) {
	ini_open(global.soulfile)
		global.lmode = ini_read_real(sname,"lmode",0)
		global.fun = ini_read_real(sname,"fun",0)
	ini_close()
}

lmode_ef()

if !i_exists(border) {i_create(x - 160,y - 32,depth - 9,border)}

myHP = 0
itPronoun = 0
itPr[0] = "o"
itPr[1] = "a"

curwpslot = 0
curarslot = 0

drawroom = 0
prevroom = room
drawroomtxt = ""
roomcolor = c_dkgray
invalidname = 0
invalidalpha = 0
invalidtimer = 0

depth = -9999
quit = 0
frame = 0
frame_adv = 0
quitAlp = 0

drawmus = 0
musvol = 1
muspit = 1
musloop = 1
resetted = 0