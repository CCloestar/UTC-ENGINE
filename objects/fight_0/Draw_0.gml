var b = battle_globals
<<<<<<< HEAD
var col = (b.scene < 4 and b.curBt = 0) ? #FFFF40 : b.btcol

if b.curBt = 0 {
=======
var col = b.btcol

if b.curBt = 0 {
	if b.scene < 4 {col = #FFFF40}
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

<<<<<<< HEAD
draw_spr("bt",0,,,,,col)

var fico = $"f_{str_l(global.soul_name)}"
fico = !spr_exists(a_index(fico)) ? "f_null" : fico

var fx = {
	"f_null" : [9,8]
}

var ff = [fx[$ fico],fx[$ "f_null"]]

var f = [(ff[0] = undefined) ? ff[1][0] : ff[0][0],(ff[0] = undefined) ? ff[1][1] : ff[0][1]]
draw_spr(a_index(fico),0,x + f[0],y + f[1],,,col,col != #FFFF40)
=======
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
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
