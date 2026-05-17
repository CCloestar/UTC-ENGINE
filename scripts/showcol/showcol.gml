function showcol() {
	visible = global.showcol
	
	if i_exists(display) {visible = global.showcol * display.d}
}