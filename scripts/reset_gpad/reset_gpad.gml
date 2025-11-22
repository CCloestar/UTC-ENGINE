function reset_gpad() {
	with (gpad) {
		dch = 0
		
		bt[0] = 2
		bt[1] = 1
		bt[2] = 4

		sens[0] = 0.15
		sens[1] = 0.01
	}
}