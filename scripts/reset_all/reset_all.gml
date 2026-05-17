function reset_all(del = 1){
	globals.resetted = 1
	
	var c_ar = array_length(global.char)

	var far_file = 0
	var sname = string_lower(global.soul_name)
	
	ini_open(global.soulfile)
		far_file = ini_read_real(sname,"f",0)
	ini_close()
	
	if del {
		for (var d = 0;d < far_file;d++) {
			repeat irandom_range(1,global.howfar) {global.story[irandom(global.howfar)] = -1}

			ini_open(global.soulfile)
				if global.story[d] < 0 {ini_write_real(sname,"dvu_" + string(d),global.story[d])}
				else {ini_delete(sname,"dvu_" + string(d))}
			ini_close()
		}

		if file_exists(global.filename) {
			ini_open(global.filename)
				for (var i = 1;i < c_ar + 1;i++) {ini_delete("savefile","char_" + string(i))}
			ini_close()
			
			file_delete(global.filename)
		}
	}
	
	if del = 2 {
		file_delete(global.filename)
		
		var _s = string_lower(global.soul_name)
		
		ini_open(global.soulfile)
			if ini_section_exists(_s) {ini_section_delete(_s)}
		ini_close()
	}

	del_fl_arrays()

	load_soul()
}