al[0] += al[1]
draw_rec(-2,-2,642,482,,col,al[0])

if al[0] >= 1 {
	switch style {
		case 0:
			room_goto(map)
		break
		
		case 1:
			destroy()
		break
		
		case 2:
			audio_free()
			
			if (global.hard < 2) {
				if i_exists(checkpointer) {
					with (checkpointer) {chpoint(1)}
				}
				else {room_goto(rm_dogcheck)}
			}
			else {game_restart()}
		break

		case 3:
			var _tr = (titleObject.can_select != -1)
		
			music_stop()
			reset_all(_tr * 2)
			room_goto(map)
		break

		case 5:
			room_goto(map)
		break
		
		case 6:
			global.curCh = chload
			load_soul()
			room_goto(map)
		break
	}
}