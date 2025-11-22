var pr,snd

_pr = [o_mainchara,o_cutscene,o_rock,o_follower]
pr = place_meeting(x,y,_pr)
snd = press

switch trigger {
	case 0:
		if pr and !audio_is_playing(snd) {
			audio_play(snd,,,0.4,,random_range(0.9,1))
			trigger = 1
		}
	break

	case 1:
		switch _id {
			case 0:
				if !pr {trigger = 0}
			break
		}
	break
}

image_index = trigger

mask_lay()
draw_area()