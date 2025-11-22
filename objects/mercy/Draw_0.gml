var b = battle_globals
var col = b.btcol

if b.curBt = 3 {
	if b.scene < 3 {col = c_yellow}
	
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

draw_spr_lang("bt",3,,,,,,col)
draw_spr(b_icons,2,x + 9,y + 12,,,,col,col != c_yellow)