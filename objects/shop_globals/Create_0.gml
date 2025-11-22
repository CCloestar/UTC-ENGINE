scene = 0

for (var i = 0;i < 5;i++) {
	trigger[i] = 0
	timer[i] = 0
}

curBt = 0
curIt = 0
curP = 0
delay = 0

b_y = 0
ex = "main"

load_d_dw()
fade(1)

if file_exists("config.ini") {
	ini_open("config.ini")
		global.shop_id = ini_read_real("config.ini","sh_id",global.shop_id)
	ini_close()
}

var p = 0.93

music_play("mus_shop",,p)
i_create(0,0,depth + 1,shop_keeper)