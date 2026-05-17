var b = battle_globals
var col = (b.scene < 3 and b.curBt = 1) ? c_yellow : b.btcol

if b.curBt = 1 {
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

draw_spr("bt",1,,,,,col)
draw_spr(b_icons,0,x + 12,y + 13,,,col,col != c_yellow)