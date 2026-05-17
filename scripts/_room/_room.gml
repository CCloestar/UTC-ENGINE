function rm_go(rm = room,nm = "",p = global.pitch){
	if !fading() {
		efade = fade()
		
		if rm = -1 {rm = rm_dogcheck}
		
		with (efade) {
			nextArea = 1
			alphaValue = 0.1
			X = global.X
			Y = global.Y
			F = global.F
		}
		
		if strcopy(nm,1,4) != "mus_" {nm = $"mus_{nm}"}
		
		efade.m = rm
		global.m_name[2] = nm
		efade.p = p
	}
}