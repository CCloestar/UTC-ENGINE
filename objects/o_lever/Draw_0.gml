var xx,yy,snd,cond

xx = sprite_xoffset
yy = sprite_yoffset * 2
snd = battle_begin_0

cond[0] = !audio_is_playing(snd)
cond[1] = 1

if _id = 2 {cond[0] = 1}

switch trigger {
	case 0:
		if interacted() and cond[0] {
			audio_play(snd,,,0.4)
			image_index = 1
			trigger = 1
		}
	break

	case 1:
		var off = 0

		switch _id {
			case 0:
				if interacted() and !audio_is_playing(snd) {off = 1}
			break

			case 2:
				timer++

				if timer >= t_end {off = 1}
			break
		}

		if off and cond[1] {
			audio_play(snd,,,0.4,,0.85)

			trigger = 0
			timer = 0
			image_index = 0
		}
	break
}

mask_lay()
draw_area()
draw_hitbox()