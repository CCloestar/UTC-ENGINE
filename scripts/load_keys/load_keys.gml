function load_keys(){
	if file_exists("keys.ini") {
		ini_open("keys.ini")
			for (var m = 0;m < 7;m++) {
				global.bt[m,0] = keyboard_get_map(ini_read_real("keys.ini","bt_" + string(m) + "-0",global.bt[m,0]))
				global.bt[m,1] = keyboard_get_map(ini_read_real("keys.ini","bt_" + string(m) + "-1",global.bt[m,1]))
			}
		ini_close()
	}
	else {reset_keys()}
}