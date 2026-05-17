inBoard = 0
event_inherited()

if image_index < 3 {image_speed = 0.3}
else {
	if !trigger[0] {
		image_index = 3
		image_speed = 0
		trigger[0] = 1
	}
}

if trigger[0] {
	timer[0]++

	if timer[0] = 20 {
		image_index = 4

		bl = instance_create_depth(x,y,depth - 1,b_ant_1_b)
		with (bl) {
			image_speed = 0.3
			direction = point_direction(x,y,heart.x,heart.y)
			speed = 5
			deletes = 1
			inBoard = 1
			destroyOut = 1
		}
	}

	if timer[0] >= 40 {
		if image_index < image_number {image_speed = 0.2}
		else {destroy()}
	}
}