function load_d_dw() {
	if event_type = ev_create {
		dw = dw_check()
		curdwcol = 0
		dwcoltim = 0
		dwcol[0] = c_white
		dwcol[1] = #AAFFE6
		dwcol[2] = #8CCEFF
		dwcol[3] = #7191FF
		dwcol[4] = #513EFF
		dwcol[5] = #7191FF
		dwcol[6] = #8CCEFF
		dwcol[7] = #AAFFE6
	}
	else {
		dwcoltim += !global.simpleVFX

		if dwcoltim >= 10 {
			if curdwcol >= 7 {curdwcol = 0}
			else {curdwcol++}
	
			dwcoltim = 0
		}
		
		curdwcol *= !global.simpleVFX
	}
}