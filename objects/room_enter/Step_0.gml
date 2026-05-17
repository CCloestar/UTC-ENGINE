showcol()
mask_lay()

if nmus = "" {nmus = global.m_name[1]}

if place_meeting(x,y,o_mainchara) {
	char_stop()

	global.fplay = 1

	if !fading() {
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

		if m = rm_shop {
			global.curRoom = room_get_name(room)
			global.shop_id = shop_id
			global.m_name[0] = global.m_name[1]
		}
	}
}