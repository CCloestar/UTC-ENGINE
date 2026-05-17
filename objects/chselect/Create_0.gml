camt = 0
xchaps = 0

<<<<<<< HEAD
loc = $"{working_directory}customs/"

if f_exists($"{loc}customs.ini") {
	ini_open($"{loc}customs.ini")
		xchaps = load_real("apps",,"apps")
=======
loc = string(working_directory) + @"customs\"

if file_exists(loc + "customs.ini") {
	ini_open(loc + "customs.ini")
		xchaps = ini_read_real("apps","apps",0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	ini_close()
}

global.init = 1

tt = camt + xchaps
cur_op = 0
cur_sel = -1
cur_page = 0
a = 1
yy = 40
xs = 1
ys = 1
faderer = 0
can = 0
demon = 1
op = -1
delay = 0
<<<<<<< HEAD
chsnd = -1
csnd = 0
=======
chsnd = no_sound
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
rot = 0
trigger = 0
timer = 0

for (var o = 0;o < tt + 7;o++) {
	//Trait name, Chapter name, Color name (for file management)
	s[o,0] = "NULL"
	s[o,1] = "- -"
	s[o,2] = "NULL"
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	//Color, Color (light mode), The light mode itself.
	c[o,0] = c_white
	c[o,1] = c_white
	l[o] = 0

<<<<<<< HEAD
	//Chapter index (for global.curCh), Chapter icon, Chapter icon frame, Custom sprite (for cleaning)
	ch[o,0] = o + 1
	ch[o,1] = heart_main
	ch[o,2] = 0
	ch[o,3] = 0

	ico[o] = "dummy"

	s[0,0] = "COOLEST \"TRAIT\""
	s[0,1] = "UNDERTALE NULL"
	s[0,2] = "NULL"
	c[0,0] = c_red
	c[0,1] = c_yellow

	//file loading for light mode, SPECIFICALLY FOR LIGHT MODE. YEAH.
	if f_exists("file9.ini") {
		ini_open("file9.ini")
			l[o] = load_real("lmode",,str_l(s[o,2]))
=======
	//Chapter index (for global.curCh), Chapter icon, Chapter icon frame
	ch[o,0] = o + 1
	ch[o,1] = heart_main
	ch[o,2] = 0
	
	ico[o] = "dummy"

	s[0,0] = "NULL"
	s[0,1] = "UNDERTALE NULL"
	s[0,2] = "NULL"
	c[0,0] = c_red

	//file loading for light mode, SPECIFICALLY FOR LIGHT MODE. YEAH.
	if file_exists("file9.ini") {
		ini_open("file9.ini")
			l[o] = ini_read_real(string_lower(s[o,2]),"lmode",0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		ini_close()
	}

	fly[o] = 0
}

for (var i = camt + 1;i < tt + 7;i++) {
	s[i,0] = ""
	s[i,1] = "- -"
	s[i,2] = ""

	ch[i,0] = i + 1
	ch[i,1] = heart_main
	ch[i,2] = 0
<<<<<<< HEAD
	ch[i,3] = 0

	if f_exists($"{loc}customs.ini") {
		ini_open($"{loc}customs.ini")
			s[i,0] = load_str($"app_{i - 1}",,"apps")
			s[i,1] = load_str($"app_{i - 1}","- -","apps")
		ini_close()
	}

	ico[i] = $"{loc}{s[i,1]}/chSpr.png"
	print(ico[i])

	ch[i,1] = f_exists(ico[i]) ? spr_add(ico[i]) : heart_main
	ch[i,2] = f_exists(ico[i])
=======

	if file_exists(loc + "customs.ini") {
		ini_open(loc + "customs.ini")
			s[i,0] = ini_read_string("apps","app_" + string(i - 1),"")
			s[i,1] = ini_read_string("apps","app_" + string(i - 1),"- -")
		ini_close()
	}

	ico[i] = loc + s[i,1] + @"\chSpr.png"

	if !file_exists(ico[i]) {ch[i,1] = heart_main}
	else {ch[i,1] = sprite_add(ico[i],0,0,0,0,0)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}

t2 = 0
can2 = 0
rise = 0

<<<<<<< HEAD
hw = room_width / 2
hh = room_height / 2
=======
half_width = room_width / 2
half_height = room_height / 2
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

spr = -1
col = c_red

<<<<<<< HEAD
var _c = "config.ini"

if f_exists(_c) {
	ini_open(_c)
		tt = load_real("tt",tt,_c)
	ini_close()
}

if !tt or is_web() {
	global.curCh = 1
=======
if !tt {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	load_soul()
	room_goto(rm_intro)
	global.init = 0
}
else {
<<<<<<< HEAD
	csong = $"drone_{global.gamemode}"
	var cs = music_exists(csong)
	cpit = 1

	music_stop(-1)
	music_play(cs ? csong : "chokedup",,cs ? cpit : 0.4)
=======
	csong = "mus_drone_" + string(global.gamemode)
	cpit = 1

	audio_free()
	if music_exists(csong) {music_play(csong,,cpit)}
	else {music_play("mus_chokedup",,0.4)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

	global.curCh = 0
	global.color[0] = c_red
	global.pname = ""
	load_soul()
<<<<<<< HEAD
	window_set_caption(tr("SELECT SOUL"))
}

function ch_sound() {
	chsnd = heart_create_1

	var ech = 0
	var e_amt = 0.8
	var e_dest_sp = 0.2
	var e_dest = 1

	var exsnd = $"{loc}{s[global.curCh,1]}/chSnd"

	if f_exists(exsnd) {
		chsnd = audio_create_stream(exsnd)
		csnd = 1
	}
	else {
		if !ech {audio_play(chsnd)}
		else {audio_play_echo(chsnd,,,,,,e_amt,e_dest_sp,e_dest)}
	}
}

function game_go() {
	var game = $"{working_directory}customs/{s[global.curCh,1]}"

	for (var i = 0;i < arlen(ico);i++) {
		if ch[i,3] {spr_del(ico[i])}
	}
	if csnd {audio_destroy(chsnd)}

	audio_free()
	game_change(game,"-game data.win")

	load_soul()
	window_set_caption($"UNDERTALE {str_u(global.soul_name)}")
	room_goto(spr_exists(a_index($"intro_{str_l(global.soul_name)}")) ? rm_intro : rm_title)
=======
	window_set_caption(text("SELECT SOUL"))
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}