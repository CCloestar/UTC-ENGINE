timer++

if timer = (x - xprevious) / 2 {
	timer = 0
	after_image()
}

draw_self()