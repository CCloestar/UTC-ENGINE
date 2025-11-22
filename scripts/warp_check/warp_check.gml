function warp_check(){
	var rm = rm_select

	if file_exists("config.ini") {
		ini_open("config.ini")
			if ini_key_exists("config.ini","warp") {
				var warpfile = ini_read_string("config.ini","warp","rm_intro")
				var warp = asset_get_index(warpfile)
			
				if warp != -1 {rm = warp}
			}
		ini_close()
	}
	room_goto(rm)
}