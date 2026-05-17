function load_soul(){
	if room != rm_select {
		if file_exists("config.ini") {
			ini_open("config.ini")
				global.curCh = ini_read_real("config.ini","chap",global.curCh)
			ini_close()
		}
	}
	
	var colx,coly
	
	colx = 0
	coly = 0

	switch global.curCh {
		default:
			global.soul_name = "NULL"
			global.name[0] = "Null"
			global.color[0] = c_red
			global.wep[0,0] = "None"
			global.wep_b[0,0] = 0
			global.arm[0,0] = "None"
			global.arm_b[0,0] = 0
			global.hasLmode = 0
			global.changeName = 1
			global.canRun = 0
		break
	}
	
	var _c = "config.ini"

	if file_exists(_c) {
		ini_open(_c)
			global.canRun = ini_read_real(_c,"canRun",global.canRun)
			global.hasLmode = ini_read_real(_c,"hasLmode",global.hasLmode)
			global.changeName = ini_read_real(_c,"changeName",global.changeName)
		ini_close()
	}

	switch global.gamemode {
		default:
			global.filename = "file" + string(global.curCh) + ".ini"
			global.soulfile = "file9.ini"
		break
	}

	sprite_set_offset(collision,colx,coly)
	
	if i_exists(border) {
		var _b = border
		_c = global.soulfile

		if file_exists(_c) {
			ini_open(_c)
				_b.cur_b = ini_read_real(string_lower(global.soul_name),"b",_b.cur_b)
			ini_close()
		}
	}
}