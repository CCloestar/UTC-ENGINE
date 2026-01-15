function reset_gpad() {
	with (gpad) {
		dch = 0
		
		bt[0] = gp_face1
		bt[1] = gp_face2
		bt[2] = gp_face4

		sens[0] = 0.15
		sens[1] = 0.01
	}
}
