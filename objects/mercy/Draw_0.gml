var b = battle_globals
<<<<<<< HEAD
var col = (b.scene < 3 and b.curBt = 3) ? c_yellow : b.btcol

if b.curBt = 3 {
=======
var col = b.btcol

if b.curBt = 3 {
	if b.scene < 3 {col = c_yellow}
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

<<<<<<< HEAD
draw_spr("bt",3,,,,,col)
draw_spr(b_icons,2,x + 9,y + 12,,,col,col != c_yellow)
=======
draw_spr_lang("bt",3,,,,,,col)
draw_spr(b_icons,2,x + 9,y + 12,,,,col,col != c_yellow)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
