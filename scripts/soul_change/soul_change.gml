function soul_change(s = 0){
	with (heart) {
		mode = s
		angle = 0

		for (var i = 0;i < 5;i++) {
			s_timer[i] = 0
			s_trigger[i] = 0
		}

		destroy(greenShield)
	}
}