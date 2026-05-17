var b = battle_globals
var col = (b.scene < 4 and b.curBt = 0) ? #FFFF40 : b.btcol

if b.curBt = 0 {
	if !b.scene {
		heart.x = x + 8
		heart.y = y + 14
	}
}

draw_spr("bt",0,,,,,col)

var fico = $"f_{str_l(global.soul_name)}"
fico = !spr_exists(a_index(fico)) ? "f_null" : fico

var fx = {
	"f_null" : [9,8]
}

var ff = [fx[$ fico],fx[$ "f_null"]]

var f = [(ff[0] = undefined) ? ff[1][0] : ff[0][0],(ff[0] = undefined) ? ff[1][1] : ff[0][1]]
draw_spr(a_index(fico),0,x + f[0],y + f[1],,,col,col != #FFFF40)