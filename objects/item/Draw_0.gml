var b = battle_globals
var col = (b.scene < 3 and b.curBt = 2) ? c_yellow : b.btcol

if b.curBt = 2 {
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

draw_spr("bt",2,,,,,col)
draw_spr(b_icons,1,x + 9,y + 10,,,col,col != c_yellow)