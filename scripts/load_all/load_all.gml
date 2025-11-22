function load_all(file = global.filename) {
	del_fl_arrays()
	load_soul()
	
	var s
	
	if file_exists(file) {
		ini_open(file)
			s = "savefile"

			if !global.changeName {global.pname = load_string("playerName",global.pname)}
			else {global.pname = load_string("playerName")}
			
			global.skin = load_real("skin")
			global.time = load_real("time")
			
			global.lv = load_real("lv",1)
			global.xp = load_real("xp")
			
			global.X = load_real("x")
			global.Y = load_real("y")
			global.F = load_real("f")

			global.curRoom = load_string("room","rm_dogcheck")
			global.hard = load_real("hard")

			for (var i = 0;i < 2;i++) {
				global.g[i] = load_real("g_" + string(i))
				global.kills[i] = load_real("kills_" + string(i))
				global.spares[i] = load_real("spares_" + string(i))
			}
			
			for (var i = 0; i < array_length(global.story);i++) {global.story[i] = load_real("st_" + string(i),global.story[i])}
			
			global.route = load_real("route")
			global.pitch = load_real("pitch")
			
			for (var i = 0;i < array_length(global.name);i++) {
				global.name[i] = load_string("name_" + string(i),global.name[i],s)
				
				s = string_lower(global.name[i])
				
				for (var o = 0;o < 2;o++) {
					global.wep[i,o] = load_string("w_" + string(dw_check()),global.wep[i,o],s)
					global.wep_b[i,o] = load_real("wb_" + string(dw_check()),global.wep_b[i,o],s)
	
					global.arm[i,o] = load_string("a_" + string(dw_check()),global.arm[i,o],s)
					global.arm_b[i,o] = load_real("ab_" + string(dw_check()),global.arm_b[i,o],s)
				}
			}

			s = "savefile"

			var f = ini_read_real(s,"fl_amt",0)

			for (var i = 0;i < f;i++) {
				global.f_n[i] = load_string("fl_" + string(i))
				global.char[i + 1] = noone
			}

			for (var i = 0;i < array_length(global.item);i++) {
				for (var o = 0;o < 2;o++) {
					global.item[i,3 * o] = load_string("i" + string(o) + "_" + string(i))
					global.box[i,o] = load_string("b" + string(o) + "_" + string(i))
				}
			}
		ini_close()
	}

	s = global.soulfile

	if file_exists(s) {
		var sname = string_lower(global.soul_name)
		
		ini_open(s)
			global.howfar = ini_read_real(sname,"f",0)
			
			for (var i = 0; i < array_length(global.story);i++) {global.story[i] = load_real("dvu_" + string(i),global.story[i])}
		ini_close()
	}
}

function load_real(key,def = 0,sec = "savefile") {return ini_read_real(sec,key,def)}
function load_string(key,def = "",sec = "savefile") {return ini_read_string(sec,key,def)}