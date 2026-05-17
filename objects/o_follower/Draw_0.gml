var xx,yy,o_x,o_y

xx = 0
yy = 0
o_x = 0
o_y = 0

n = global.f_n[pos]

<<<<<<< HEAD
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
=======
switch n {
	case "Null":
	break
}

if _dep {depth = 1 - ((y * 10) + (sprite_height * 10)) - (yy * 10)}

chara_spr(n)
draw_area(,xx,yy)

if global.debug and display.d {
	draw_hitbox(xx + sprite_xoffset,yy + sprite_yoffset)

	var o
	o[0] = x
	o[1] = y
	o[2] = depth
	o[3] = (fl / 12)

	var db
	db[0] = "Name: " + string(n)
	db[1] = "Pos: " + string(o)

	draw_font(1)
	
	for (var i = 0;i < array_length(db);i++) {
		var _co = c_white
		if i = 0 {_co = _c}
		
		draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset) + (8 * i),db[i],_co,c_black,1,1,0,0.5,0.5,,,,2)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	}
}