if global.debug {
	if vk_pressed(vk_space) {game_restart()}
	
	if vk_hold(vk_shift) {
		if !drawroom {
			if vk_pressed(ord("2")) {
				music_stop()
				load_all()
				var m0 = "mus_dance_of_dog"

				if file_exists(global.filename) {
					ini_open(global.filename)
						m0 = ini_read_string("savefile","m_name_1","mus_dance_of_dog")
					ini_close()
				}

				music_play(m0,,1)
				room_goto(room)
			}
	
			if vk_pressed(ord("3")) {
				music_stop()
				reset_all(0)
				room_goto(room)
			}
		}
		
		if ord_pressed("0") {global.noclip = !global.noclip}

		if ord_pressed("1") and (!fading() or !i_exists(white_fade)) {
			prevroom = room
			room_goto(rm_dummy)

			if global.inBattle {
				global.start_dial = 0 + !drawroom
				global.inBoard = 0 - !drawroom
				global.button = 0 - !drawroom
			}
			else {
				if i_exists(o_mainchara) {o_mainchara.c = 0 + (2 * !drawroom)}
			}

			drawroomtxt = ""
			keyboard_lastchar = ""

			if !drawroom {
				drawroom = 1
				
				if room != rm_dummy {prevroom = room}
				room_goto(rm_dummy)
			}
			else {
				drawroom = 0
				room_goto(prevroom)
			}
		}
	
		if ord_pressed("4") {
			drawmus = !drawmus
			if drawmus = 0 {char_free()}
			musvol = 1
			muspit = 1
			musloop = 1
		}
			
		if ord_pressed("R") {room_goto(room)}
	}
	
	if ord_hold("L") {global.lv += u_pressed() - d_pressed()}
	if ord_hold("G") {global.g[dw_check()] += 10 * (u_pressed() - d_pressed())}
}

global.time++

if (global.debug or global.inBeta) and !i_exists(display) {i_create(0,0,depth - 10,display)}

if global.lv = 20 {
	global.maxhp[0,0] = 99
	global.at[0,0] = 30
	global.df[0,0] = 30
}
else {
	global.maxhp[0,0] = 16 + (4 * global.lv)
	global.at[0,0] = 8 + (global.lv * 2)
	global.df[0,0] = 9 + ceil(global.lv / 4)
}

if global.xp and global.spares[dw_check()] {global.route = 1}

lmode_ef()

if resetted {event_perform(ev_create,globals)}
