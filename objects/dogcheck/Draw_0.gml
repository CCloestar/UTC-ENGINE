draw_set_color(c_black)
draw_rectangle(-2,-2,room_width + 2,room_height + 2,0)

if timer[0] < 2 {
	timer[0]++
	timer[3] = 1
}
else {
	draw_self()

	if timer[3] {
		if !music_is_playing() {music_play("mus_dance_of_dog",,random_range(0.95,1.05))}
		if music_get_pos() <= 1 {music_set_pitch(,random_range(0.95,1.05))}
	}

	timer[1]++

	if dogchoice = 8 {
		switch dogs {
			case frog_0:
				x += cos(timer[1] / 7)
			break
		}
	}
}

if z_hold() and global.debug {room_goto(rm_dogcheck)}