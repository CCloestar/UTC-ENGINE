function heart_state(state = 0,hx = heart.x,hy = heart.y) {
	with (heart) {
		x = hx
		y = hy
		scene = state
	
		switch state {
			case -1:
				visible = 0
				soul_change(mode)
			break
		
			case 1:
			case 0:
				visible = 1
			break
		
			case 2:
				scene = 1
				visible = 1
			break
		}
	}
}