function rm_go(rm = room,nm = no_sound,p = global.pitch){
	if !fading() {
		efade = fade()
		
		if rm = -1 {rm = rm_dogcheck}
		
		efade.m = rm
		efade.nextArea = 1
		efade.alphaValue = 0.1
		global.m_name[2] = nm

		efade.X = global.X
		efade.Y = global.Y
		efade.F = global.F
		efade.p = p
	}
}