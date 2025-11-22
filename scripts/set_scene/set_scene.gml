function set_scene(sc = 0) {
	var b = battle_globals
	b.scene = sc

	switch sc {
		case -1:
			heart_state(-1,9999,9999)
			destroy(dialogue)
			destroy(fight_1)
			destroy(f_ef)
			destroy(at_bar)
			board.preset = -2
			curBt = -1
			curIt = 0
			curAct = 0
		break
		
		case 4:
			heart_state(2,board.midx[0],board.midy[1])
			board.preset = 1
			curBt = 0
			curIt = 0
			curAct = 0
		break
	}
}