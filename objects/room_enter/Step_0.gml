showcol()
mask_lay()

<<<<<<< HEAD
if nmus = "" {nmus = global.m_name[1]}

=======
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
if place_meeting(x,y,o_mainchara) {
	char_stop()

	global.fplay = 1

	if !fading() {
<<<<<<< HEAD
		var ef = fade()
		ef.nextArea = 1
		ef.alphaValue = alphaValue
		ef.m = m
		ef.X = X
		ef.Y = Y
		ef.F = F
		ef.p = p
		ef.alphaValue = alphaValue
		ef.color = color
		ef.forcemus = fmus

		if strcopy(nmus,1,4) != "mus_" {nmus = $"mus_{nmus}"}

		global.m_name[0] = ""
		global.m_name[2] = nmus
		audio_play(sndplay)
=======
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
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

		if m = rm_shop {
			global.curRoom = room_get_name(room)
			global.shop_id = shop_id
			global.m_name[0] = global.m_name[1]
		}
	}
}