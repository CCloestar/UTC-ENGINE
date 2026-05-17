function g_over(xx = x,yy = y){
	var alive = 1
	var d = dw_check()

	for (var i = 0;i < fl_max() + 1;i++) {alive = global.hp[i,d]}

	if !alive and !i_exists(gameover) {
		for (var i = 0;i < 3;i++) {global.hp[i,d] = 0}

		global.fplay = 1
		audio_free()

		go = i_create(xx,yy,depth - 10,gameover)
		go.persistent = 1
		room_goto(rm_gameover)
	}
}
	
function chpoint(type = 0) {
	var d = dw_check()
	
	if type {
		global.lv = lv
		global.xp = xp
		global.skin = skin
		global.kills[d] = k[d]
		global.spares[d] = s[d]
		global.route = r

		global.X = x
		global.Y = y
		global.F = f
		
		for (var i = 0;i < 2;i++) {global.g[i] = g[i]}
		
		for (var i = 0;i < 3;i++) {
			global.hp[i,d] = hp[i,d]
			
			global.arm[i,d] = arm[i,d]
			global.arm_b[i,d] = arm_b[i,d]
			
			global.wep[i,d] = wep[i,d]
			global.wep_b[i,d] = wep_b[i,d]
		}

		for (var i2 = 0;i2 < arlen(global.item);i2++) {global.item[i2,3 * d] = it[i2]}
		for (var i = 0;i < 3;i++) {global.m_name[i] = ""}

		global.pitch = p

		room_goto(rm)
		destroy()
	}
	else {
		lv = global.lv
		xp = global.xp
		skin = global.skin
		r = global.route
		
		x = 0
		y = 0
		f = 0
		rm = room
		
		for (var i = 0;i < 2;i++) {
			g[i] = global.g[i]
			k[i] = global.kills[i]
			s[i] = global.spares[i]
		}
		
		for (var i = 0;i < 3;i++) {
			for (var o = 0;o < 2;o++) {
				hp[i,o] = global.maxhp[i,o]
				
				arm[i,o] = global.arm[i,o]
				arm_b[i,o] = global.arm_b[i,o]
				
				wep[i,o] = global.wep[i,o]
				wep_b[i,o] = global.wep_b[i,o]
			}
		}

		for (var i2 = 0;i2 < arlen(global.item);i2++) {it[i2] = global.item[i2,3 * d]}

		p = global.pitch
	}
}