<<<<<<< HEAD
#region VARIABLES
	var c = "config.ini"
	var dv = 0
	var dw = dw_check()
	var ww = room_width
	var hh = room_height

	ini_open(c)
		dv = load_real("device",,c)
	ini_close()

	var ch = global.inBattle ? heart : o_mainchara
	if !i_exists(heart) and !i_exists(o_mainchara) {ch = self}

	var _x = ch.x
	var _y = ch.y
	var _f = i_exists(o_mainchara) ? ch.f : 0

	var mvol = []
	for (var i = 0;i < arlen(global.m_name);i++) {mvol[i] = music_vol(global.music[i],-1)}
	
	var fcol = make_rgb(c_white,,[0,-((255 / (fps / 4)) - 34),-((255 / (fps / 2)) - 17)])
	var _c = global.color[0]
	
	if r_m {
		m = debug_event("DumpMemory")
		r_m = 0
	}
	
	var r = 0
#endregion

var shi = key_hold(vk_shift)

if global.debug {
	if ord_pressed("D") {d = !d}

	if shi and !trigger[0] {
		for (var i = 0;i < 10;i++) {
			if ord_pressed(str(i)) {
				timers_reset()
				trigger[0] = i
				delay = 2
			}
		}

		if ord_pressed("0") {global.noclip = !global.noclip}
		if ord_pressed("R") {room_goto(room)}
		if ord_hold("L") {global.lv += u_pressed() - d_pressed()}
		if ord_hold("G") {global.g[dw] += 10 * (u_pressed() - d_pressed())}
		if ord_hold("H") {global.hp[0,dw] += 10 * (u_pressed() - d_pressed())}
	}
}

draw_font()

if global.inBeta {
	draw_set_halign(fa_center)
	draw_txt_outline(320,8,"[THIS IS A PROTOTYPE! Things may chance during development!]",_c,,,,,1)
	draw_set_halign(fa_left)
}

if d and !trigger[0] {
	var dbg = [
		[
			$"FPS: {fps} | CPU Steps: {fps_real}",
			$"Memory: {m.totalUsed / 1048576}MB / {m.peakUsage / 1048576}MB",
			"",
			"",
			$"LANGUAGE: {global.lang}",
			$"NOCLIP: {global.noclip}",
			$"CHAPTER: {global.curCh} ({global.world})",
			$"DEVICE: {dv}"
		],
		[
			room_get_name(room),
			$"X: {_x}",
			$"Y: {_y}",
			$"F: {_f}",
			$"Cam. X: {view_x(view_camera[0])}",
			$"Cam. Y: {view_y(view_camera[0])}"
		],
		[],
		[
			global.m_name,
			$"{str(mvol)} [{global.pitch}]",
		]
	]

	for (var i = 0;i < 4;i++) {
		_x = 4 + (632 * (i % 2 == 1))
		_y = 4 + (463 * (i > 1))

		draw_set_halign((i % 2 == 1) ? fa_right : fa_left)

		for (var o = 0;o < arlen(dbg[i]);o++) {
			var sp = (i < 2) ? 16 : -16

			draw_txt_outline(_x,_y + (sp * o),dbg[i,o],(i = 0) * (o < 2) ? fcol : c_white,,,,,1)
		}
	}

	draw_set_halign(fa_left)
	
	var bts = [
		["LEFT","DOWN","UP","RIGHT"],
		["Z","X","C",""]
	]
	
	var btc = [
		[l_hold(),d_hold(),u_hold(),r_hold()],
		[z_hold(),x_hold(),c_hold(),0]
	]
	
	for (var i = 0;i < 4;i++) {
		draw_txt_outline(4 + ((40 * i) - (20 * (i = 3))),36,bts[0,i],btc[0,i] ? _c : c_gray,,,,,1)
		draw_txt_outline(4 + (16 * i),52,bts[1,i],btc[1,i] ? _c : c_gray,,,,,1)
	}
}

var ins = [
	"[BACKSPACE] - Clear 1 Letter",
	"[DELETE] - Clear Name",
	"(Press [UP/DOWN] to change pages.)"
]

switch trigger[0] {
	default:
		trigger[0] = 0	
	break
	
	#region ROOM WARP
		case 1:
			if !is_str(timer[3]) {
				timer[3] = ""
				keyboard_string = ""
				global.X = _x
				global.Y = _y
				global.F = _f
			}
			
			draw_rec(-2,-2,642,482,,c_black,0.5)
			char_stop()

			var _r,h

			for (var i = 0;i < 22;i++) {
				var o = i + (22 * timer[1])
				h = (room = o)

				if room_exists(o) {
					_r[i] = room_get_name(o) + (h ? " (You're here!)" : "")
					draw_txt_outline(8,8 + (20 * i),_r[i],h ? _c : ((str_contains(_r[i],timer[3]) * strlen(timer[3])) ? c_white : c_gray),,,,,1)

					var rr = [6,6 + (20 * i),6 + str_w(_r[i]) + 2,6 + (20 * i) + 14]
					_r[i] = room_get_name(o)

					if m_rec(rr[0],rr[1],rr[2],rr[3]) {
						_c = m_hold(mb_left) ? c_white : global.color[0]

						draw_rec(rr[0],rr[1],rr[2],rr[3],1,_c,0.4)
						if m_pressed(mb_left) {
							audio_free()
							room_goto(asset_get_index(_r[i]))
							r = 1
						}
					}
				}
			}
			
			var cur_p = timer[1]
			
			timer[2] = ceil(arlen(_r) / 22) + 1
			timer[1] -= u_pressed() - d_pressed()
			timer[1] = clamp(timer[1],0,timer[2])

			var pg = $"({timer[1] + 1} of {timer[2] + 1})"

			draw_txt_outline(8,(8 + (20 * 23)) - 4,pg,c_white,,,,,1)
			draw_spr(d_layer1,0,str_w(pg) + 14,(8 + (20 * 23)) - 12,1,,u_hold() ? c_white : c_gray)
			draw_spr(d_layer2,0,str_w(pg) + 44,(8 + (20 * 23)) - 12,1,,d_hold() ? c_white : c_gray)
			
			h = room_exists(a_index(timer[3]))
			
			draw_set_halign(fa_center)
				_x = 440
			
				draw_font(1)
				draw_txt_outline(_x,186,"---[Quick Search/Warp]---",c_white,,,,,1,,2)
				draw_txt_outline(_x,208,timer[3],h ? _c : c_white)
				
				draw_txt_outline(_x,240,"! INVALID ROOM NAME !",c_red,,timer[5],timer[5],,1)
				timer[5] -= 0.2

				for (var i = 0;i < arlen(ins);i++) {draw_txt_outline(_x,260 + (20 * i),ins[i],c_gray,,,,,1)}
			draw_set_halign(fa_left)

			if !delay {
				if any_hold() {
					timer[3] = keyboard_string
					if key_pressed(vk_delete) {timer[3] = ""}

					if key_pressed(vk_enter) {
						if h {
							audio_free()
							room_goto(a_index(timer[3]))
							r = 1
						}
						else {timer[5] = 6}

						timer[3] = ""
						keyboard_string = ""
					}
				}
			}
		break
	#endregion

	#region LOAD/SOFT RESET FILE
		case 2:
			music_stop()
			load_all()

			music_play(global.m_name[1])
			room_goto(room)
			trigger[0] = 0
		break
		
		case 3:
			music_stop()
			reset_all(0)
			room_goto(room)
			trigger[0] = 0
		break
	#endregion

	#region PLAY MUSIC
		case 4:
			if !is_str(timer[0]) {
				timer[0] = ""
				for (var i = 1;i <= 3;i++) {timer[i] = 1}
				music_stop(-1)
				keyboard_string = ""
			}

			draw_rec(-2,-2,642,482,,c_black,0.5)
			char_stop()
			
			h = f_exists($"{working_directory}{timer[0]}.ogg") or f_exists($"{working_directory}mus_{timer[0]}.ogg")

			draw_set_halign(fa_center)
				_x = 320
				
				ins = [
					"[UP / DOWN] - Change Volume",
					"[LEFT / RIGHT] - Change Pitch",
					"[L] - Toggle Loop",
					"[BACKSPACE] - Clear 1 Letter",
					"",
					"(Hold [SHIFT] to change the variables.)",
					"(You can write with and without \"mus_\" at the start.)"
				]
				
				var v = [
					"Volume",
					"Pitch",
					"Loop"
				]
				
				var vtxt = ""
				
				for (var i = 0;i < arlen(v);i++) {
					vtxt += v[i] + $": {timer[i + 1]}"
					if i < arlen(v) - 1 {vtxt += " | "}
				}

				var t = arlen(v) + 1

				draw_font(1)
				draw_txt_outline(_x,186,"---[Sound Test]---",c_white,,,,,1,,2)
				draw_txt_outline(_x,208,timer[0],h ? _c : c_silver)
				draw_txt_outline(_x,240,vtxt,c_white,,,,,1)

				draw_txt_outline(_x,260,"! INVALID MUSIC NAME !",c_red,,timer[t],timer[t],,1)
				timer[t] -= 0.2

				for (var i = 0;i < arlen(ins);i++) {draw_txt_outline(_x,280 + (20 * i),ins[i],c_gray,,,,,1)}
			draw_set_halign(fa_left)

			if !delay {
				if any_hold() {
					timer[0] = keyboard_string
					if key_pressed(vk_delete) {timer[0] = ""}
					
					if key_hold(vk_shift) {
						timer[1] -= (key_pressed(vk_down) - key_pressed(vk_up)) * 0.1
						timer[2] -= (key_pressed(vk_left) - key_pressed(vk_right)) * 0.1
						if ord_pressed("L") {timer[3] = !timer[3]}
					}

					if key_pressed(vk_enter) {
						if h {
							music_stop(-1)
							music_play(timer[0],timer[1],timer[2],timer[3])
							r = 1
						}
						else {
							timer[t] = 6
							timer[0] = ""
							keyboard_string = ""
						}
					}
				}
			}
		break
	#endregion

	#region STORY CHECKER
		case 5:
			draw_rec(-2,-2,642,482,,c_black,0.5)
			char_stop()

			var st = global.story

			for (var i = 0;i < 32;i++) {
				var o = i + (32 * timer[0])
				if o < arlen(st) {draw_txt_outline(8,8 + (14 * i),$"STORY {o}: {st[o]}",st[o] > -1 ? (st[o] > 0 ? c_white : c_gray) : _c,,,,,1)}
			}

			ins = [
				"(Press [UP/DOWN] to change pages.)",
				"SOUL COLORED variables are under DEJA-VU effect."
			]

			draw_set_halign(fa_right)
			for (var i = 0;i < arlen(ins);i++) {draw_txt_outline(636,467 - (20 * i),ins[i],c_gray,,,,,1)}
			draw_set_halign(fa_left)

			timer[1] = round(arlen(st) / 32) - 1
			timer[0] -= u_pressed() - d_pressed()
			timer[0] = clamp(timer[0],0,timer[1])

			var pg = $"({timer[0] + 1} of {timer[1] + 1})"

			draw_txt_outline(8,(8 + (20 * 23)) - 4,pg,c_white,,,,,1)
			draw_spr(d_layer1,0,str_w(pg) + 14,(8 + (20 * 23)) - 12,1,,key_hold(vk_shift) * u_hold() ? c_white : c_gray)
			draw_spr(d_layer2,0,str_w(pg) + 44,(8 + (20 * 23)) - 12,1,,key_hold(vk_shift) * d_hold() ? c_white : c_gray)
		break
	#endregion
}

if trigger[0] and !delay {
	if shi and ord_pressed(str(trigger[0])) {r = 1}
}

if r {
	timers_reset()
	trigger[0] = 0
	char_free()
}

delay--
=======
var fpscol,_l,_d,_u,_r,_z,_x,_c,st

st = 4

fpscol = c_white
_l = c_gray
_d = c_gray
_u = c_gray
_r = c_gray
_z = c_gray
_x = c_gray
_c = c_gray

if ord_pressed("D") {d = !d}
if c_hold() and ord_pressed("S") {s = !s}

if fps <= 15 {fpscol = c_red}

if l_hold() {_l = global.color[0]}
if d_hold() {_d = global.color[0]}
if u_hold() {_u = global.color[0]}
if r_hold() {_r = global.color[0]}
if z_hold() {_z = global.color[0]}
if x_hold() {_x = global.color[0]}
if c_hold() {_c = global.color[0]}

if global.debug {
	if d {
		draw_font(l_check())
	
		draw_txt_outline(4,0 + st,"FPS: " + string(fps),fpscol,,,,,1,1,,,0)
		draw_txt_outline(4,16 + st,"CPU steps: " + string(fps_real),fpscol,,,,,1,1,,,0)

		draw_txt_outline(4,32 + st,"LEFT",_l,,,,,1,1,,,0)
		draw_txt_outline(44,32 + st,"DOWN",_d,,,,,1,1,,,0)
		draw_txt_outline(84,32 + st,"UP",_u,,,,,1,1,,,0)
		draw_txt_outline(108,32 + st,"RIGHT",_r,,,,,1,1,,,0)

		draw_txt_outline(4,48 + st,"Z",_z,,,,,1,1,,,0)
		draw_txt_outline(20,48 + st,"X",_x,,,,,1,1,,,0)
		draw_txt_outline(36,48 + st,"C",_c,,,,,1,1,,,0)

		draw_set_color(c_white)
		draw_txt_outline(4,64 + st,"LANGUAGE: " + string(global.lang),c_white,c_black,,,,1,1,,,0)
		draw_txt_outline(4,80 + st,"NOCLIP: " + string(global.noclip),c_white,c_black,,,,1,1,,,0)
		draw_txt_outline(4,96 + st,"CHAPTER: " + string(global.curCh) + " (" + string(global.world) + ")",c_white,c_black,,,,1,1,,,0)
		draw_set_halign(fa_right)
	
		var roomname = room_get_name(room)
		var curx = 0
		var cury = 0
		var curf = 0
		var cx = camera_get_view_x(view_camera[0])
		var cy = camera_get_view_y(view_camera[0])
	
		if global.inBattle {
			if i_exists(heart) {
				curx = heart.x
				cury = heart.y
			}
		}
		else {
			if i_exists(o_mainchara) {
				curx = o_mainchara.x
				cury = o_mainchara.y
				curf = o_mainchara.f
			}
		}
	
		draw_txt_outline(636,0 + st,roomname,c_white,c_black,,,,1,1,,,0)
		draw_txt_outline(636,16 + st,"X: " + string(curx),c_white,c_black,,,,1,1,,,0)
		draw_txt_outline(636,32 + st,"Y: " + string(cury),c_white,c_black,,,,1,1,,,0)
		draw_txt_outline(636,48 + st,"F: " + string(curf),c_white,c_black,!global.inBattle,!global.inBattle,,1,1,,,0)
		draw_txt_outline(636,64 + st,"Cam. X: " + string(cx),c_white,c_black,,,,1,1,,,0)
		draw_txt_outline(636,80 + st,"Cam. Y: " + string(cy),c_white,c_black,,,,1,1,,,0)
		draw_txt_outline(636,467,global.m_name,c_white,c_black,,,,1,1,,,0)

		draw_set_halign(fa_left)
	}
		
	if s {
		draw_set_alpha(0.4)
		draw_set_color(c_black)
		draw_rectangle(0,0,640,480,0)
		
		var max_p = 1
		var lim = array_length(global.story) - 95
		
		draw_set_alpha(1)
		draw_font(!l_check())
		
		for (var i = 0;i < lim;i++) {
			var o = i + (lim * cur_p)
			
			if o < array_length(global.story) {draw_txt_outline(4,4 + (14 * i),"STORY " + string(o) + ": " + string(global.story[o]),c_white,,,,,1,1,,,0)}
			if lim > 32 * (max_p - 1) {max_p++}
		}
		
		if c_hold() {
			if l_pressed() {cur_p -= (cur_p > 0)}
			if r_pressed() {cur_p += (cur_p < max_p)}
		}

		draw_txt_outline(4,467,"STORY VARIABLE CHECKER (" + string(cur_p + 1) + " of " + string(max_p + 1) + ")",global.color[0],,,,,1,1,,,0)
	}
}

if global.inBeta {
	var betaTxt = "THIS IS A PROTOTYPE! Things may change during development!"

	draw_font(l_check())
	draw_set_halign(fa_center)
	draw_txt_outline(320,4 + st,betaTxt,global.color[0],,,,,1,1,,,0)
	draw_set_halign(fa_left)
}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
