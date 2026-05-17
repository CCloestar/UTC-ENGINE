function b_scene(sc = 0) {
	var b = battle_globals
	var _b = board
	b.scene = sc

	switch sc {
		case -1:
			soul_state(-1,9999,9999)
			dial_destroy()
			destroy(fight_1)
			destroy(f_ef)
			destroy(at_bar)
			_b.preset = -2
			curBt = -1
			curIt = 0
			curAct = 0
		break
		
		case 4:
			soul_state(2,board.midx[0],board.midy[1])
			_b.preset = 1
			curBt = 0
			curIt = 0
			curAct = 0
		break
	}
}