function draw_hitbox() {
	if global.showcol and i_exists(display) and display.d {
		draw_set_color(c_red)
		draw_rectangle(bbox_left + 1,bbox_top + 1,bbox_right - 1,bbox_bottom - 1,1)
	}
}