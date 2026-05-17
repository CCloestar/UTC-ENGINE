#macro f_exists file_exists
#macro f_delete file_delete

function scr_exists(scr = "") {return script_exists(a_index(scr))}

function scr_execute(scr = "") {
	if scr_exists(scr) {return script_execute(a_index(scr))}
}

#macro save_real ini_write_real
#macro save_str ini_write_string
function load_real(key,def = 0,sec = "savefile") {return ini_read_real(sec,key,def)}
function load_str(key,def = "",sec = "savefile") {return ini_read_string(sec,key,def)}

function warp_check() {
	var rm = rm_select
	var _c = "config.ini"

	if f_exists(_c) {
		ini_open(_c)
			if ikey_exists(_c,"warp") {
				var wf = load_str("warp","rm_intro",_c)
				var w = a_index(wf)
				if w != -1 {rm = w}
			}
		ini_close()
	}

	if !i_exists(web_check) {
		if global.init = -1 {rm = rm_title}
		room_goto(rm)
	}
}

#macro isec_exists ini_section_exists
#macro ikey_exists ini_key_exists

function ikey_delete(sec,key) {
	if ikey_exists(sec,key) {return ini_key_delete(sec,key)}
}

function isec_delete(sec) {
	if isec_exists(sec) {return ini_section_delete(sec)}
}

function save_all(tosave = global.filename){
	var s = str_l(global.soul_name)
	
	ini_open(global.soulfile)
		var f_file = load_real("f",,s)
		
		if global.howfar > f_file {save_real(s,"f",global.howfar)}
		save_str(s,"name",global.pname)
		
		if !ikey_exists(s,"fun") {save_real(s,"fun",global.fun)}
	ini_close()

	ini_open(tosave)
		if tosave = global.filename {s = "savefile"}
	
		if global.changeName {save_file(global.pname,"playerName")}
		save_file(global.time,"time")
		save_file(global.skin,"skin")
		save_file(global.lay,"lay")
		
		save_file(global.lv,"lv")
		save_file(global.xp,"xp")
		save_file(global.g,"g")
		save_file(global.kills,"kills")
		save_file(global.spares,"spares")
		save_file(global.route,"route")
		save_file(global.hard,"hard")
		
		if !ikey_exists(s,"ch") {save_file(global.curCh,"curCh")}
		
		with (o_mainchara) {
			save_file(x,"x")
			save_file(y,"y")
			save_file(f,"f")
		}
		
		save_file(room_get_name(room),"room",)
		save_file(rm,"roomName","--")

		save_file(global.pitch,"pitch",1)
		
		save_file(global.item,"i",,1)
		save_file(global.box,"b",,1)

		save_file(global.story,"st")
		save_file(global.m_name,"m_name")

		var p,n,w,wb,a,ab,ss

		n = ["Null"]
		w = ["None"]
		wb = [0]
		a = ["None"]
		ab = [0]
		
		var dw = dw_check()

		for (var i = 0;i < arlen(global.name);i++) {
			p = $"{str_l(global.name[i])}_{i}"

			save_file(global.name[i],$"name_{i}",n,3,s)
			save_file(global.wep[i,dw],$"w_{dw}",w,3,p)
			save_file(global.wep_b[i,dw],$"wb_{dw}",wb,3,p)
			save_file(global.arm[i,dw],$"a_{dw}",a,3,p)
			save_file(global.arm_b[i,dw],$"ab_{dw}",ab,3,p)
		}
		
		var fl,fl_amt,f_c,cc

		fl_amt = load_real("fl_amt",,s)
		f_c = arlen(global.f_n) - 1

		if fl_amt {
			if f_c < fl_amt {
				for (var i = f_c;i < fl_amt + 5;i++) {
					if ikey_exists(s,$"fl_{i}") {ikey_delete(s,$"fl_{i}")}
				}
			}
		}

		cc = arlen(global.char)

		for (var i = cc;i < cc + 5;i++) {
			if ikey_exists(s,$"name_{i}") {ikey_delete(s,$"name_{i}")}
		}

		save_file(i_number(o_follower),"fl_amt")
		save_file(global.f_n,"fl")
	ini_close()
}
	
function save_file(saver,name = "",d_value = 0,type = 0,s = "savefile") {
	var ss,dd
	
	if !is_array(saver) {
		ss = is_str(saver)
		dd = d_value
				
		if dd = 0 and ss {dd = ""}
	}
	else {
		for (var i = 0;i < arlen(saver);i++) {
			ss[i] = is_str(saver[i])
			dd[i] = d_value

			if dd[i] = 0 and ss[i] {dd[i] = ""}
		}
	}
	
	switch type {
		default:
			if !is_array(saver) {
				if saver != dd {
					if !ss {save_real(s,name,saver)}
					else {save_str(s,name,saver)}
				}
				else {ikey_delete(s,name)}
			}
			else {
				for (var i = 0;i < arlen(saver);i++) {
					if saver[i] != dd[i] {
						if !ss[i] {save_real(s,$"{name}_{i}",saver[i])}
						else {save_str(s,$"{name}_{i}",saver[i])}
					}
					else {ikey_delete(s,$"{name}_{i}")}
				}
			}
		break
		
		case 1:
			if name != "i" {
				for (var i = 0;i < arlen(saver);i++) {
					for (var o = 0;o < arlen(saver[i]);o++) {
						if saver[i,o] != "" {save_str(s,$"{name}{o}_{i}",saver[i,o])}
						else {ikey_delete(s,$"{name}{o}_{i}")}
					}
				}
			}
			else {
				for (var i = 0;i < arlen(saver);i++) {
					var o = 3 * dw
					
					if saver[i,o] != "" {save_str(s,$"{name}{dw}_{i}",saver[i,o])}
					else {ikey_delete(s,$"{name}{dw}_{i}")}
				}
			}
		break

		case 2:
			for (var i = 0;i < arlen(saver);i++) {
				if !ar_contains(saver[i],dd[i]) {
					for (var o = 0;o < 2;o++) {save_str(s,$"{name}_{i}",saver[i,o])}
				}
				else {ikey_delete(s,$"{name}_{i}")}
			}
		break

		case 3:
			if !ar_contains(d_value,saver) {
				if is_str(saver) {save_str(s,name,saver)}
				else {save_real(s,name,saver)}
			}
			else {ikey_delete(s,name)}
		break
	}
}

function load_all(file = global.filename) {
	del_fl_arrays()
	load_soul()
	
	var s
	
	if f_exists(file) {
		ini_open(file)
			s = "savefile"

			if !global.changeName {global.pname = load_str("playerName",global.pname)}
			else {global.pname = load_str("playerName")}
			
			global.skin = load_real("skin")
			global.time = load_real("time")
			
			global.lv = load_real("lv",1)
			global.xp = load_real("xp")
			
			global.X = load_real("x")
			global.Y = load_real("y")
			global.F = load_real("f")

			global.curRoom = load_str("room","rm_dogcheck")
			global.hard = load_real("hard")

			for (var i = 0;i < 2;i++) {
				global.g[i] = load_real($"g_{i}")
				global.kills[i] = load_real($"kills_{i}")
				global.spares[i] = load_real($"spares_{i}")
			}
			
			for (var i = 0;i < arlen(global.story);i++) {global.story[i] = load_real($"st_{i}",global.story[i])}
			global.m_name[1] = load_str("m_name_1","dance_of_dog")
			
			print(global.tooMuch)
			print(global.m_name[1])

			global.route = load_real("route")
			global.pitch = (global.m_name[1] = $"mus_{global.tooMuch}") ? 1 : load_real("pitch",1)

			for (var i = 0;i < arlen(global.name);i++) {
				global.name[i] = load_str($"name_{i}",global.name[i],s)
				
				s = $"{str_l(global.name[i])}_{i}"

				for (var o = 0;o < 2;o++) {
					global.wep[i,o] = load_str($"w_{dw_check()}",global.wep[i,o],s)
					global.wep_b[i,o] = load_real($"wb_{dw_check()}",global.wep_b[i,o],s)
	
					global.arm[i,o] = load_str($"a_{dw_check()}",global.arm[i,o],s)
					global.arm_b[i,o] = load_real($"ab_{dw_check()}",global.arm_b[i,o],s)
				}
			}

			s = "savefile"

			var f = load_real("fl_amt",,s)

			for (var i = 0;i < f;i++) {
				global.f_n[i] = load_str($"fl_{i}")
				global.char[i + 1] = noone
			}

			for (var i = 0;i < arlen(global.item);i++) {
				for (var o = 0;o < 2;o++) {
					global.item[i,3 * o] = load_str($"i{o}_{i}")
					global.box[i,o] = load_str($"b{o}_{i}")
				}
			}
		ini_close()
	}

	s = global.soulfile

	if f_exists(s) {
		var sname = str_l(global.soul_name)
		
		ini_open(s)
			global.howfar = load_real("f",,sname)
			global.fun = load_real("fun",,sname)

			for (var i = 0; i < arlen(global.story);i++) {global.story[i] = load_real($"dvu_{i}",global.story[i])}
		ini_close()
	}
}

function reset_all(del = 1){
	globals.resetted = 1
	
	var c_ar = arlen(global.char)

	var far_file = 0
	var sname = str_l(global.soul_name)

	ini_open(global.soulfile)
		far_file = load_real("f",,sname)
	ini_close()
	
	if del {
		for (var d = 0;d < far_file;d++) {
			repeat irnd_r(1,global.howfar) {global.story[irnd(global.howfar)] = -1}

			ini_open(global.soulfile)
				if global.story[d] < 0 {save_real(sname,$"dvu_{d}",global.story[d])}
				else {ikey_delete(sname,$"dvu_{d}")}
			ini_close()
		}

		if f_exists(global.filename) {
			ini_open(global.filename)
				for (var i = 1;i < c_ar + 1;i++) {ikey_delete("savefile",$"char_{i}")}
			ini_close()

			f_delete(global.filename)
		}
	}
	
	if del = 2 {
		f_delete(global.filename)		
		var _s = str_l(global.soul_name)

		ini_open(global.soulfile)
			isec_delete(_s)
			save_real(_s,"f",far_file)
			save_file(border.cur_b,"b",,,_s)
		ini_close()
	}

	del_fl_arrays()
	load_soul()
}

function js_load(j) {
	var js = ""
	
	if !is_web() {
		var b = buffer_load(j)
		js = buffer_read(b,buffer_string)

		buffer_delete(b)
	}
	else {
		if !f_exists(j) {return undefined}
		
		var f = file_text_open_read(j)

		while (!file_text_eof(f)) {
			js += file_text_read_string(f)
			file_text_readln(f)
		}
		file_text_close(f)
	}

	return json_parse(js)
}