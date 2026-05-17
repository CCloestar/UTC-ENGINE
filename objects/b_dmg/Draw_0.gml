if _hp > hp {_hp -= dmg / 15}
else {_hp = hp}

if dmg {
	draw_b(x - 1,ystart + 7,(x + round(maxhp * wf)) + 1,ystart + 21,c_black,c_dkgray,1)
	draw_rec(x,ystart + 8,round(x + (_hp * wf)),ystart + 20,,c_lime,(_hp > 0))
}

draw_col(dmg ? c_red : c_silver)
draw_font(5)
draw_set_halign(fa_center)
draw_txt(x + (ww / 2),y - 9,dmg ? str(dmg) : tr("MISS"))
draw_set_halign(fa_left)

if y > ystart {
	y = ystart
	vspeed = 0
	gravity = 0
}