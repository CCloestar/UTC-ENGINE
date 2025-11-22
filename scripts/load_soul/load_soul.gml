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

	switch global.gamemode {
		default:
			global.filename = "file" + string(global.curCh) + ".ini"
			global.soulfile = "file9.ini"
		break
	}

	sprite_set_offset(collision,colx,coly)
}