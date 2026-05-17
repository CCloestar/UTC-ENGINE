var b = battle_globals
var col = (b.scene < 3 and b.curBt = 3) ? c_yellow : b.btcol

if b.curBt = 3 {
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

draw_spr("bt",3,,,,,col)
draw_spr(b_icons,2,x + 9,y + 12,,,col,col != c_yellow)