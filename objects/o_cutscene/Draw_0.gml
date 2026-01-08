draw_area()
if sil {draw_sprite_s(scol)}

if global.showcol and display.d {
	var o
	o[0] = x
	o[1] = y
	o[2] = depth

	var db
	db[0] = "C.Name: " + scr
	db[1] = "Pos: " + string(o)
	db[2] = "Timer: " + string(timer)
	db[3] = "Trigger: " + string(trigger)
	db[4] = "(" + draw_time(time,1) + ")"
	
	draw_font(1)
	for (var i = 0;i < array_length(db);i++) {draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset) + (8 * i),db[i],c_white,c_black,1,1,0,0.5,0.5,,,,2)}
}
