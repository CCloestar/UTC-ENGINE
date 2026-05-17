function timers_create(amt = 5) {
	for (var i = 0;i < amt;i++) {
		trigger[i] = 0
		timer[i] = 0
	}
}

function timers_reset() {
	for (var i = 0;i < arlen(timer);i++) {
		trigger[i] = 0
		timer[i] = 0
	}
}

function end_cuts(c = 0,val = 1){
	if global.story[c] != val {
		global.story[c] = val
		if global.howfar < c {global.howfar = val}
	}
}

function finish_plot(c = 0){
	switch c {
		case 0:
			audio_free()
			end_cuts(7)
			room_goto(rm_gardens0)
			global.area = 1
		break
	}
}

function interacted(_x = x,_y = y) {return place_meeting(_x,_y,hitbox)}