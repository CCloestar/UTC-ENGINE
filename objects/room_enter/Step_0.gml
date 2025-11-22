showcol()
mask_lay()

if place_meeting(x,y,o_mainchara) {
	char_stop()

	global.fplay = 1

	if !fading() {
		endFade = fade()
		endFade.nextArea = 1
		endFade.alphaValue = 0.1
		endFade.m = m
		endFade.X = X
		endFade.Y = Y
		endFade.F = F
		endFade.p = p
		endFade.alphaValue = alphaValue
		endFade.color = color
		endFade.forcemus = fmus
		global.m_name[0] = "no_sound"
		global.m_name[2] = nmus

		if !sound {
			audio_play(sndplay)
			sound = 1
		}

		if m = rm_shop {
			global.curRoom = room_get_name(room)
			global.shop_id = shop_id
			global.m_name[0] = global.m_name[1]
		}
	}
}