var b = battle_globals
var col = b.btcol

if b.curBt = 1 {
	if b.scene < 3 {col = c_yellow}
	
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

draw_spr_lang("bt",4,,,,,,col)
draw_spr(b_icons,4,x + 5,y + 5,,,,col,col != c_yellow)