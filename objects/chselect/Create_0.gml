camt = 0
xchaps = 0

loc = string(working_directory) + @"customs\"

if file_exists(loc + "customs.ini") {
	ini_open(loc + "customs.ini")
		xchaps = ini_read_real("apps","apps",0)
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
chsnd = no_sound
rot = 0
trigger = 0
timer = 0

for (var o = 0;o < tt + 7;o++) {
	//Trait name, Chapter name, Color name (for file management)
	s[o,0] = "NULL"
	s[o,1] = "- -"
	s[o,2] = "NULL"
	
	//Color, Color (light mode), The light mode itself.
	c[o,0] = c_white
	c[o,1] = c_white
	l[o] = 0

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

	if file_exists(loc + "customs.ini") {
		ini_open(loc + "customs.ini")
			s[i,0] = ini_read_string("apps","app_" + string(i - 1),"")
			s[i,1] = ini_read_string("apps","app_" + string(i - 1),"- -")
		ini_close()
	}

	ico[i] = loc + s[i,1] + @"\chSpr.png"

	if !file_exists(ico[i]) {ch[i,1] = heart_main}
	else {ch[i,1] = sprite_add(ico[i],0,0,0,0,0)}
}

t2 = 0
can2 = 0
rise = 0

half_width = room_width / 2
half_height = room_height / 2

spr = -1
col = c_red

if !tt {
	load_soul()
	room_goto(rm_intro)
}
else {
	csong = "mus_drone_" + string(global.gamemode)
	cpit = 1

	audio_free()
	if music_exists(csong) {music_play(csong,,cpit)}
	else {music_play("mus_chokedup",,0.4)}

	global.curCh = 0
	global.color[0] = c_red
	global.pname = ""
	load_soul()
	window_set_caption(text("SELECT SOUL"))
}