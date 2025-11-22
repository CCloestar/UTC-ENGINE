function save_file(saver,name = "",d_value = 0,type = 0,s = "savefile") {
	var ss,dd
	
	if !is_array(saver) {
		ss = is_string(saver)
		dd = d_value
				
		if dd = 0 and ss {dd = ""}
	}
	else {
		for (var i = 0;i < array_length(saver);i++) {
			ss[i] = is_string(saver[i])
			dd[i] = d_value

			if dd[i] = 0 and ss[i] {dd[i] = ""}
		}
	}
	
	switch type {
		default:
			if !is_array(saver) {
				if saver != dd {
					if !ss {ini_write_real(s,name,saver)}
					else {ini_write_string(s,name,saver)}
				}
				else {ini_delete(s,name)}
			}
			else {
				for (var i = 0;i < array_length(saver);i++) {
					if saver[i] != dd[i] {
						if !ss[i] {ini_write_real(s,name + "_" + string(i),saver[i])}
						else {ini_write_string(s,name + "_" + string(i),saver[i])}
					}
					else {ini_delete(s,name + "_" + string(i))}
				}
			}
		break
		
		case 1:
			if name != "i" {
				for (var i = 0;i < array_length(saver);i++) {
					for (var o = 0;o < array_length(saver[i]);o++) {
						if saver[i,o] != "" {ini_write_string(s,name + string(o) + "_" + string(i),saver[i,o])}
						else {ini_delete(s,name + string(o) + "_" + string(i))}
					}
				}
			}
			else {
				for (var i = 0;i < array_length(saver);i++) {
					var o = 3 * dw
					
					if saver[i,o] != "" {ini_write_string(s,name + string(dw) + "_" + string(i),saver[i,o])}
					else {ini_delete(s,name + string(dw) + "_" + string(i))}
				}
			}
		break
		
		case 2:
			for (var i = 0;i < array_length(saver);i++) {
				if !array_contains(saver[i],dd[i]) {
					for (var o = 0;o < 2;o++) {ini_write_string(s,name + "_" + string(i),saver[i,o])}
				}
				else {ini_delete(s,name + "_" + string(i))}
			}
		break
	}
}