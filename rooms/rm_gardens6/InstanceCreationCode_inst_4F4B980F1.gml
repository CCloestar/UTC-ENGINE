ldir[0] = 6
ldir_d[0] = 32
ldir[2] += 0.5
ldir_d[2] += 0.5

if global.story[100] {
	ldir[3] += 2
	ldir_d[3] -= 0.5
	
	var rm = i_create(320,300,,room_enter)

	with (rm) {
		image_yscale = 4
		m = rm_gardens6s
		X = 40
		Y = 180
		F = 3
	}
}