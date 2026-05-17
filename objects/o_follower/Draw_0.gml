var xx,yy,o_x,o_y

xx = 0
yy = 0
o_x = 0
o_y = 0

n = global.f_n[pos]

var fData = {
	"Toriel": [dial_toriel,-4,-23,#D080FF],
	"Null": [dial_main,0,0,c_red]
}

var fd = fData[$ n] ?? "Toriel"

snd = fd[0]
xx = fd[1]
yy = fd[2]
_c = fd[3]

if _dep {depth = 1 - ((y * 10) + (sprite_height * 10)) - (yy * 10)}

draw_spr_c(n)
draw_a(,xx,yy)

if in_debug() {
	xx += sprite_xoffset
	yy += sprite_yoffset

	draw_hitbox(xx,yy)

	var o = [x,y,depth,(fl / 12)]
	var db = [ $"Name: {n}",$"Pos: {o}"]

	draw_font(1)

	for (var i = 0;i < arlen(db);i++) {
		var _co = (i = 0) ? _c : c_white
		draw_txt_outline(x + sprite_width + xx,(y + yy) + (8 * i),db[i],_co,c_black,1,1,0,0.5,,2)
	}
}