var pr,snd

_pr = [o_mainchara,o_cutscene,o_rock,o_follower]
pr = place_meeting(x,y,_pr)
snd = press

switch trigger {
	case 0:
		if pr and !audio_is_playing(snd) {
<<<<<<< HEAD
			audio_play(snd,,,0.4,,rnd_r(0.9,1))
=======
			audio_play(snd,,,0.4,,random_range(0.9,1))
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
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
<<<<<<< HEAD
draw_a()
=======
draw_area()
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
