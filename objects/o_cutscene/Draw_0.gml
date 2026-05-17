<<<<<<< HEAD
draw_a()
if sil {draw_spr_s(scol)}
draw_hitbox()

if global.showcol and display.d {
	var o = [x,y,depth]

	var db = [
		$"C.Name: {scr[curscr]}",
		$"Pos: {o}",
		$"Timer: {timer}",
		$"Trigger: {trigger}",
		$"({draw_time(time,1)})"
	]

	draw_font(1)
	for (var i = 0;i < arlen(db);i++) {draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset) + (8 * i),db[i],c_white,c_black,1,1,0,0.5,,2)}
=======
draw_area()
if sil {draw_sprite_s(scol)}
draw_hitbox()

if global.showcol and display.d {
	var o
	o[0] = x
	o[1] = y
	o[2] = depth

	var db
	db[0] = "C.Name: " + scr[(room = rm_battle)]
	db[1] = "Pos: " + string(o)
	db[2] = "Timer: " + string(timer)
	db[3] = "Trigger: " + string(trigger)
	db[4] = "(" + draw_time(time,1) + ")"

	draw_font(1)
	for (var i = 0;i < array_length(db);i++) {draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset) + (8 * i),db[i],c_white,c_black,1,1,0,0.5,0.5,,,,2)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}