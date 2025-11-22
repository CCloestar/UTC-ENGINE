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
}

function load_lang(l = "en") {
	var f_Name = string(working_directory) + @"\lang\lang_" + string_lower(l) + ".json"
	
	if !file_exists(f_Name) {f_Name = string(working_directory) + @"\lang\lang_en.json"}

	var b = buffer_load(f_Name)
	var js = buffer_read(b,buffer_string)

	buffer_delete(b)
	return json_decode(js)
}