function lmode_ef(){
	if file_exists(global.soulfile) {
		ini_open(global.soulfile)
			global.lmode = ini_read_real(string_lower(global.soul_name),"lmode",global.lmode)
		ini_close()
	}
}