function load_soul(){
	var _c = "config.ini"
	
	if room != rm_select {
		if f_exists(_c) {
			ini_open(_c)
				global.curCh = load_real("chap",global.curCh,_c)
			ini_close()
		}
	}

	var colx,coly

	colx = 0
	coly = 0

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

	switch global.curCh {
		case 1:
			//ADD YOUR SOUL STUFF HERE
		break
	}
	
	if f_exists(_c) {
		ini_open(_c)
			global.canRun = load_real("canRun",global.canRun,_c)
			global.hasLmode = load_real("hasLmode",global.hasLmode,_c)
			global.changeName = load_real("changeName",global.changeName,_c)
		ini_close()
	}

	switch global.gamemode {
		default:
			global.filename = $"file{global.curCh}.ini"
			global.soulfile = "file9.ini"
		break
	}
	
	sprite_set_offset(collision,colx,coly)
	lmode_ef()

	if i_exists(border) {
		var _b = border
		_c = global.soulfile

		if f_exists(_c) {
			ini_open(_c)
				_b.cur_b = load_real("b",_b.cur_b,str_l(global.soul_name))
			ini_close()
		}
	}
}

function lmode_ef(){
	if f_exists(global.soulfile) {
		ini_open(global.soulfile)
			global.lmode = load_real("lmode",global.lmode,str_l(global.soul_name))
		ini_close()
	}

	switch global.curCh {
		case 1:
			//ADD LIGHT MODE CONTENT CHECK HERE
		break
	}
}