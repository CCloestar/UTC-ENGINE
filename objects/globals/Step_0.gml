if key_pressed(vk_space) and global.debug {game_restart()}

global.time++

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

if global.xp and global.route = 0 {global.route = 1}

if global.wep[0,0] = "Umbrella" {
	var add_b = 0

	if global.lv >= 4 {
		add_b += floor((global.lv - 2) / 2)

		if global.lv >= 12 {add_b += floor((global.lv - 2) / 3)}
		if global.lv = 18 {add_b--}
		if global.lv = 20 {add_b = 97}
	}

	global.wep_b[0,0] = 2 + add_b
}

if resetted {
	event_perform(ev_create,globals)
	if room = rm_title {room_goto(titleObject.chroom[global.curCh])}

	resetted = 0
}