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
}