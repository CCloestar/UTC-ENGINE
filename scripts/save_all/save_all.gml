function save_all(tosave = global.filename){
	var s = string_lower(global.soul_name)
	
	ini_open(global.soulfile)
		var f_file = ini_read_real(s,"f",0)
		
		if global.howfar > f_file {ini_write_real(s,"f",global.howfar)}
		ini_write_string(s,"name",global.pname)
	ini_close()

	ini_open(tosave)
		if tosave = global.filename {s = "savefile"}
	
		if global.changeName {save_file(global.pname,"playerName")}
		save_file(global.time,"time")
		save_file(global.fun,"fun")
		save_file(global.skin,"skin")
		save_file(global.lay,"lay")
		
		save_file(global.lv,"lv")
		save_file(global.xp,"xp")
		save_file(global.g,"g")
		save_file(global.kills,"kills")
		save_file(global.spares,"spares")
		save_file(global.route,"route")
		save_file(global.hard,"hard")
		
		if !ini_key_exists(s,"ch") {save_file(global.curCh,"curCh")}
		
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
		save_file(global.m_name,"m_name","no_sound")

		var p,n,w,wb,a,ab,ss

		n = [""]

		w = [""]
		wb = [0]

		a = [""]
		ab = [0]

		array_push(n,"Null")
		array_push(w,"None")
		array_push(a,"None")

		for (var i = 0;i < array_length(global.name);i++) {
			p = string_lower(global.name[i])

			if !array_contains(n,global.name[i]) {ini_write_string(s,"name_" + string(i),global.name[i])}
			else {ini_delete(s,"name_" + string(i))}

			if !array_contains(w,global.wep[i,dw]) {ini_write_string(p,"w_" + string(dw),global.wep[i,dw])}
			else {ini_delete(p,"w_" + string(dw))}
			
			if !array_contains(wb,global.wep_b[i,dw]) {ini_write_real(p,"wb_" + string(dw),global.wep_b[i,dw])}
			else {ini_delete(p,"wb_" + string(dw))}
			
			if !array_contains(a,global.arm[i,dw]) {ini_write_string(p,"a_" + string(dw),global.arm[i,dw])}
			else {ini_delete(p,"a_" + string(dw))}
			
			if !array_contains(ab,global.arm_b[i,dw]) {ini_write_real(p,"ab_" + string(dw),global.arm_b[i,dw])}
			else {ini_delete(p,"ab_" + string(dw))}
		}
		
		var fl,fl_amt,f_c,cc
		
		fl_amt = ini_read_real(s,"fl_amt",0)
		f_c = array_length(global.f_n) - 1

		if fl_amt {
			if f_c < fl_amt {
				for (var i = f_c;i < fl_amt + 5;i++) {
					if ini_key_exists(s,"fl_" + string(i)) {ini_key_delete(s,"fl_" + string(i))}
				}
			}
		}

		cc = array_length(global.char)

		for (var i = cc;i < cc + 5;i++) {
			if ini_key_exists(s,"name_" + string(i)) {ini_key_delete(s,"name_" + string(i))}
		}

		save_file(instance_number(o_follower),"fl_amt")
		save_file(global.f_n,"fl")
	ini_close()
}