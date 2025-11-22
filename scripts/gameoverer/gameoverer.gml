function gameoverer(xx = x,yy = y){
	var alive = 1
	var dw = dw_check()

	for (var i = 0;i < fl_max() + 1;i++) {alive = global.hp[i,dw]}
	
	if global.debug and ord_hold("H") {
		if l_pressed() {global.hp[0,dw] -= 10}
		if r_pressed() {global.hp[0,dw] += 10}
	}

	if !alive and !i_exists(gameover) {
		for (var i = 0;i < 3;i++) {global.hp[i,dw] = 0}
		
		global.fplay = 1
		audio_free()

		go = i_create(xx,yy,depth - 10,gameover)
		go.persistent = 1

		room_goto(rm_gameover)
	}
}