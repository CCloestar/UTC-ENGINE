draw_self()

if room = rm_gardens9b and global.fun >= 32 and global.fun < 60 {
	var xx = x + 36
	var yy = y + 24
	var c = o_mainchara

	draw_spr(g_bush_0_eye,,xx,yy)

	var xo = round(room_width / (c.x + c.sprite_width))
	var yo = round(room_height / (c.y + (c.sprite_height / 2)))

	xo = clamp(xo,1,6) - 2
	yo = clamp(yo,1,6) - 3

	draw_rec((xx + 3) - xo,(yy + 3) - yo,(xx + 4) - xo,(yy + 4) - yo,,c_black)
}