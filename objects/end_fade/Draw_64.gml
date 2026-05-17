al[0] += al[1]
draw_rec(-2,-2,642,482,,col,al[0])

if (global.m_name[1] != global.m_name[2] and global.m_name[1] != $"mus_{global.tooMuch}" and !global.inBattle) or forcemus {
	music_vol(,1 - al[0])
	global.next_play = 1
}

global.pitch = p

if al[0] >= 1 {
	if global.next_play {
		music_vol(,0)
		music_stop()
	}
	
	global.fplay = 1
	
	if !global.inBattle {
		global.X = X
		global.Y = Y
		global.F = F
	}
	else {
		var en = b_enemy
		
		if i_exists(en) {
			with (en) {
				if spr_exists(surf_spr) {spr_del(surf_spr)}
			}
		}
		
		music_stop(0)
	}
	
	room_goto(m)
}