function load_langs(){
	var list = string(working_directory) + @"\lang\langList.ini"
	var l
	
	l[0] = "en"

	if file_exists(list) {
		ini_open(list)
			var f = 1
		
			for (var i = 0;i < f;i++) {
				if ini_key_exists("list",string(i)) {
					l[i] = ini_read_string("list",string(i),"")

					f++
				}
			}
		ini_close()
	}
	else {show_debug_message(list + " Doesn't exist!")}
	
	if global.lang > array_length(l) - 1 {global.lang = 0}
	if global.lang < 0 {global.lang = array_length(l) - 1}
	
	if variable_global_exists("l_map") {ds_map_destroy(global.l_map)}
	global.l_map = ds_map_create()
	global.l_map = load_lang(l[global.lang])
	
	if !variable_global_exists("l_spr") {
		global.l_spr = ds_map_create()
		global.l_snd = ds_map_create()
		
		for (var i = 0;i < array_length(l);i++) {
			load_lang_spr(l[i])
			load_lang_sfx(l[i])
		}
	}
}

function load_lang(l = "en") {
	var f_Name = string(working_directory) + @"\lang\lang_" + string_lower(l) + ".json"
	
	if !file_exists(f_Name) {f_Name = string(working_directory) + @"\lang\lang_en.json"}

	var b = buffer_load(f_Name)
	var js = buffer_read(b,buffer_string)

	buffer_delete(b)
	return json_decode(js)
}
	
function load_lang_spr(l = "en") {
	var list = string(working_directory) + @"\lang\langList.ini"
	var _l = string_lower(l)

	if file_exists(list) {
		ini_open(list)
			var f = 1
			
			for (var i = 0;i < f;i++) {
				if ini_key_exists("sprites",string(i) + "_n") {
					var _n = ini_read_string("sprites",string(i) + "_n","")
					var _f = ini_read_real("sprites",string(i) + "_f",0)
					var _b = ini_read_real("sprites",string(i) + "_b",0)
					var _s = ini_read_real("sprites",string(i) + "_s",0)
					var xx = ini_read_real("sprites",string(i) + "_x",0)
					var yy = ini_read_real("sprites",string(i) + "_y",0)
					
					var loc = string(working_directory) + @"\lang\sprites\"
					var nam = _n + "_" + _l
					var spr = loc + nam + ".png"

					if !file_exists(spr) {
						spr = loc + _n + "_en.png"
						nam = _n + "_en"
					}
					if !file_exists(spr) {
						spr = loc + _n + ".png"
						nam = _n
					}

					if file_exists(spr) {
						if !ds_map_exists(global.l_spr,nam) {
							var _sp = sprite_add(spr,_f,_b,_s,xx,yy)
							
							ds_map_add(global.l_spr,nam,_sp)
							show_debug_message("ADDED LANG SPRITE: " + nam + "," + string(_f) + "," + string(_b) + "," + string(_s) + "," + string(xx) + "," + string(yy))
						}
						else {show_debug_message("LANG SPRITE ---(" + _n + "_" + _l + ")--- DOESN'T EXIST, LOADING ---(" + nam + ")--- INSTEAD.")}
					}

					f++
				}
			}
		ini_close()
	}
	else {show_debug_message(list + " Doesn't exist!")} 
}

function load_lang_sfx(l = "en") {
	var list = string(working_directory) + @"\lang\langList.ini"
	var _l = string_lower(l)

	if file_exists(list) {
		ini_open(list)
			var f = 1
			
			for (var i = 0;i < f;i++) {
				if ini_key_exists("sfx",string(i)) {
					var _n = ini_read_string("sfx",string(i),"")
					var loc = string(working_directory) + @"\lang\audio\"

					var nam = _n + "_" + _l
					var snd = loc + nam + ".ogg"

					if !file_exists(snd) {
						snd = loc + _n + "_en.ogg"
						nam = _n + "_en"
					}
					if !file_exists(snd) {
						snd = loc + _n + ".ogg"
						nam = _n
					}

					if file_exists(snd) {
						if !ds_map_exists(global.l_snd,nam) {
							var sfx = audio_create_stream(snd)
							
							ds_map_add(global.l_snd,nam,sfx)
							show_debug_message("ADDED LANG SOUND: " + nam)
						}
						else {show_debug_message("LANG SOUND ---(" + _n + "_" + _l + ")--- DOESN'T EXIST, LOADING ---(" + nam + ")--- INSTEAD.")}
					}

					f++
				}
			}
		ini_close()
	}
	else {show_debug_message(list + " Doesn't exist!")} 
}