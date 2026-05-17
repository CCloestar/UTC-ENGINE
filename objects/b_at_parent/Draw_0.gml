var b = battle_globals
var en = b.en[mypos]

if en.dead {destroy()}

if n = "" {
	for (var i = 0;i < arlen(timer);i++) {
		timer[i] = 0
		_sin[i] = 0
		trigger[i] = 0
	}

	if b.scene = 6 {
		switch en._id {
			default:
				var rand = irnd_r(0,arlen(en.at) - 1)

				n = en.at[rand]
			break
		}
	}
}
else {
	if global.showcol and display.d {
		draw_font()
		draw_col(c_red)
		draw_txt(board.r[1] + 8,board.u[1] + 32,$"AT_NAME: {n}",1)
	}

	scr_execute(n)
}

function attack_timer(time = 1,limit = 10000) {
	timer[time]++
	if timer[time] >= limit {b_scene(7)}
}