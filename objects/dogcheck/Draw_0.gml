<<<<<<< HEAD
draw_rec(-5,-5,room_width + 5,room_height + 5,,c_black)
=======
draw_set_color(c_black)
draw_rectangle(-2,-2,room_width + 2,room_height + 2,0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

if timer[0] < 2 {
	timer[0]++
	timer[3] = 1
}
else {
	draw_self()

	if timer[3] {
<<<<<<< HEAD
		if !music_is_playing() {music_play("dance_of_dog",,rnd_r(0.95,1.05))}
		if music_pos(,-1) <= 1 {music_pitch(,rnd_r(0.95,1.05))}
=======
		if !music_is_playing() {music_play("mus_dance_of_dog",,random_range(0.95,1.05))}
		if music_get_pos() <= 1 {music_set_pitch(,random_range(0.95,1.05))}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	}

	timer[1]++

	if dogchoice = 8 {
		switch dogs {
<<<<<<< HEAD
			case pup_0:
=======
			case frog_0:
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				x += cos(timer[1] / 7)
			break
		}
	}
}

if z_hold() and global.debug {room_goto(rm_dogcheck)}