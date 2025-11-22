function load_checkpoint(type = 0) {
	if type {
		global.lv = lv
		global.xp = xp
		global.skin = skin
		global.kills[dw_check()] = k[dw_check()]
		global.spares[dw_check()] = s[dw_check()]
		global.route = r

		global.X = x
		global.Y = y
		global.F = f
		
		for (var i = 0;i < 2;i++) {global.g[i] = g[i]}
		
		for (var i = 0;i < 3;i++) {
			global.hp[i,dw_check()] = hp[i,dw_check()]
			
			global.arm[i,dw_check()] = arm[i,dw_check()]
			global.arm_b[i,dw_check()] = arm_b[i,dw_check()]
			
			global.wep[i,dw_check()] = wep[i,dw_check()]
			global.wep_b[i,dw_check()] = wep_b[i,dw_check()]
		}

		for (var i2 = 0;i2 < array_length(global.item);i2++) {global.item[i2,3 * dw_check()] = it[i2]}

		for (var i = 0;i < 3;i++) {global.m_name[i] = "no_sound"}

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

		for (var i2 = 0;i2 < array_length(global.item);i2++) {it[i2] = global.item[i2,3 * dw_check()]}

		p = global.pitch
	}
}