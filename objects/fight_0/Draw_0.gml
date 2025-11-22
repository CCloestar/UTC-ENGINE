var b = battle_globals
var col = b.btcol

if b.curBt = 0 {
	if b.scene < 4 {col = #FFFF40}
	
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

draw_spr_lang("bt",0,,,,,,col)

var fico = "f_" + string_lower(global.soul_name)

if !sprite_exists(asset_get_index(fico)) {fico = "f_null"}

var fx = 9
var fy = 8

switch fico {
	case "f_cyan":
		fx = 10
		fy = 12
	break
}

draw_spr(asset_get_index(fico),0,x + fx,y + fy,,,,col,col != #FFFF40)