var b = battle_globals
<<<<<<< HEAD
=======
var bo = board
var alone = (b.remain = 1)
var h = heart
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
var en = b.en[mypos]

if en.dead {destroy()}

if n = "" {
<<<<<<< HEAD
	for (var i = 0;i < arlen(timer);i++) {
=======
	for (var i = 0;i < array_length(timer);i++) {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		timer[i] = 0
		_sin[i] = 0
		trigger[i] = 0
	}
<<<<<<< HEAD

	if b.scene = 6 {
		switch en._id {
			default:
				var rand = irnd_r(0,arlen(en.at) - 1)

=======
	
	if b.scene = 6 {
		switch en._id {
			default:
				var rand = irandom_range(0,array_length(en.at) - 1)
			
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				n = en.at[rand]
			break
		}
	}
}
else {
	if global.showcol and display.d {
		draw_font()
<<<<<<< HEAD
		draw_col(c_red)
		draw_txt(board.r[1] + 8,board.u[1] + 32,$"AT_NAME: {n}",1)
	}

	scr_execute(n)
=======
		draw_set_color(c_red)
		draw_txt(bo.r[1] + 8,bo.u[1] + 32,"AT_NAME: " + n,1,1)
	}
	
	switch n {
		default:
		break
	}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}

function attack_timer(time = 1,limit = 10000) {
	timer[time]++
<<<<<<< HEAD
	if timer[time] >= limit {b_scene(7)}
=======
	
	if timer[time] >= limit {set_scene(7)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}