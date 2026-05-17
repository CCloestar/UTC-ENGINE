<<<<<<< HEAD
al[0] += al[1]
draw_rec(-2,-2,642,482,,col,al[0])

if (global.m_name[1] != global.m_name[2] and global.m_name[1] != $"mus_{global.tooMuch}" and !global.inBattle) or forcemus {
	music_vol(,1 - al[0])
=======
image_alpha += alphaValue
musicFadeOut -= alphaValue

draw_set_alpha(image_alpha)
draw_set_color(color)
draw_rectangle(-2,-2,642,482,0)
draw_set_alpha(1)

if (global.m_name[1] != global.m_name[2] and global.m_name[1] != global.tooMuch and !global.inBattle) or forcemus {
	music_set_volume(,musicFadeOut)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	global.next_play = 1
}

global.pitch = p

<<<<<<< HEAD
if al[0] >= 1 {
	if global.next_play {
		music_vol(,0)
=======
if image_alpha >= 1 {
	if global.next_play {
		music_set_volume(,0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
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
<<<<<<< HEAD
				if spr_exists(surf_spr) {spr_del(surf_spr)}
=======
				if sprite_exists(surf_spr) {sprite_delete(surf_spr)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			}
		}
		
		music_stop(0)
	}
	
	room_goto(m)
}