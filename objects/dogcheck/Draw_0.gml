draw_rec(-5,-5,room_width + 5,room_height + 5,,c_black)

if timer[0] < 2 {
	timer[0]++
	timer[3] = 1
}
else {
	draw_self()

	if timer[3] {
		if !music_is_playing() {music_play("dance_of_dog",,rnd_r(0.95,1.05))}
		if music_pos(,-1) <= 1 {music_pitch(,rnd_r(0.95,1.05))}
	}

	timer[1]++

	if dogchoice = 8 {
		switch dogs {
			case pup_0:
				x += cos(timer[1] / 7)
			break
		}
	}
}

if z_hold() and global.debug {room_goto(rm_dogcheck)}