function draw_hitbox(xpos = 0,ypos = 0) {
	if i_exists(display) {
		var c = i_col(global.color[0])

		if global.showcol and display.d {return draw_rec(xpos + bbox_left + 1,ypos + bbox_top + 1,xpos + bbox_right - 1,ypos + bbox_bottom - 1,1,c,1)}
	}
}

function showcol() {
	visible = global.showcol
	
	if i_exists(display) {visible = global.showcol * display.d}
}