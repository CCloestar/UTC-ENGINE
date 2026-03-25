function draw_hitbox(xpos = 0,ypos = 0) {
	if i_exists(display) {
		if global.showcol and display.d {
			draw_set_color(c_red)
			draw_rectangle(xpos + bbox_left + 1,ypos + bbox_top + 1,xpos + bbox_right - 1,ypos + bbox_bottom - 1,1)
		}
	}
}