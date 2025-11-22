var b = battle_globals
var bo = board
var alone = (b.remain = 1)
var h = heart
var en = b.en[mypos]

if en.dead {destroy()}

if n = "" {
	for (var i = 0;i < array_length(timer);i++) {
		timer[i] = 0
		_sin[i] = 0
		trigger[i] = 0
	}
	
	if b.scene = 6 {
		switch en._id {
			default:
				var rand = irandom_range(0,array_length(en.at) - 1)
			
				n = en.at[rand]
			break
		}
	}
}
else {
	if global.showcol and display.d {
		draw_font()
		draw_set_color(c_red)
		draw_txt(bo.r[1] + 8,bo.u[1] + 32,"AT_NAME: " + n,1,1)
	}
	
	switch n {
		default:
		break
	}
}

function attack_timer(time = 1,limit = 10000) {
	timer[time]++
	
	if timer[time] >= limit {set_scene(7)}
}