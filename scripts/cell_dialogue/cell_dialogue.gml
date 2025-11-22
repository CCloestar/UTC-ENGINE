function cell_dialogue(){
	md = dial_create()
	
	with (md) {
		m[0] = text("* Dialing...")

		if !dw {
			switch o_mainchara.curCall {
				default:
					m[1] = "* This message shows up if&&  I messed up BIG time.&&* Please report this."
					m[2] = "* In preference, report it&&  with specific details&&  on how it happened."
				break
			}

			var lastm = array_length(m)

			c[lastm] = ""
			m[lastm] = text("* Click...")
		}
		else {m[1] = text("* It's nothing but garbage noise.")}
	}
}