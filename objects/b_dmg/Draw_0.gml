if _hp > hp {_hp -= dmg / 15}
else {_hp = hp}

var dmgtxt = string(dmg)
var dmgcol = c_red

if dmg {
	draw_box(x - 1,ystart + 7,(x + round(maxhp * wf)) + 1,ystart + 21,c_black,c_dkgray,1)
	
	if _hp {
		draw_set_color(c_lime)
		draw_rectangle(x,ystart + 8,round(x + (_hp * wf)),ystart + 20,0)
	}
}
else {
	dmgcol = c_silver
	dmgtxt = text("MISS")
}

draw_set_color(dmgcol)
draw_font(5)
draw_set_halign(fa_center)
draw_txt(x + (ww / 2),y - 28,dmgtxt,4,4)
draw_set_halign(fa_left)

if y > ystart {
	y = ystart
	vspeed = 0
	gravity = 0
}