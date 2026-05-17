timers_create(9)

b_y = 0
_l = 0
ex = "main"
tense = 0

dw = dw_check()
d_b = 0
fade(1)

var _c = "config.ini"

ini_open(_c)
	global.shop_id = load_real("sh_id",global.shop_id,_c)
ini_close()

var p = 0.93

music_play("shop",,p)
k = i_create(0,0,depth + 1,shop_keeper)
a = dialogue

function shop_dial(_id = 0,s,d = "") {
	if !trigger[2] {
		switch _id {
			default:
				a = dial_create(40,268 + (8 * dw * l_check()))
				a.preset = -1
				a.finish = 0
				a.y_sep = 36 + (2 * l_check())
				a.snd = s[_id,0]
				a.m = [d]
			break
		}

		trigger[2] = 1
	}
}

it = [
	[
		[9,"CoolItem","Toy Knife",2,2,-1],
		[90,"CoolItem2","Toy Knife",2,2,1],
		[900,"CoolItem3","Toy Knife",2,2,10],
		[9000,"CoolItem4","Toy Knife",2,2,-1]
	]
]

function sh_heart(_x = 0,_y = 0) {
	var hspr = dw ? heart_main : heart_menu
	var hs = round(16 / spr_w(hspr))

	draw_spr(hspr,0,_x,_y - (4 * l_check()),hs,,global.color[0])
}