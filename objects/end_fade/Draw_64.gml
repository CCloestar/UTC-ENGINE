image_alpha += alphaValue
musicFadeOut -= alphaValue

draw_set_alpha(image_alpha)
draw_set_color(c_black)
draw_rectangle(-2,-2,642,482,0)
draw_set_alpha(1)

if (global.m_name[1] != global.m_name[2] and global.m_name[1] != global.tooMuch and !global.inBattle) or forcemus {
	music_set_volume(,musicFadeOut)
	global.next_play = 1
}

global.pitch = p

if image_alpha >= 1 {
	if global.next_play {music_stop()}
	
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
				if sprite_exists(surf_spr) {sprite_delete(surf_spr)}
			}
		}
		
		music_stop(0)
	}
	
	room_goto(m)
}