timer++
if timer >= 15 {trigger++}

if !trigger {
	if timer <= 5 or (timer >= 9 and timer <= 13) {draw_spr(en_d_sweat,0,(x - 6) - (4 * sca),(y - 6) - (7 * sca),sca,sca)}
	
	draw_self()
}

switch trigger {
	case 0:
		draw_self()
	break
	
	default:
		for (var i = 0;i < 81;i++) {
			var alp = 0.4
			draw_spr(,,x + (pos * i),y,,,,,alp - (trigger / 8) + (i / 200))
		}
	break
	
	case 20:
		audio_play(en_death)
		destroy()
	break
}