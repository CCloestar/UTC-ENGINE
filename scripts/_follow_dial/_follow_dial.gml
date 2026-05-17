function fl_dial(){
	df = dial_create(,,depth - 50)
	
	with (df) {
		m[0] = tr($"notopic{irnd(3)}")

	}
}

function cell_dial(){
	md = dial_create()

	with (md) {
		m[0] = tr("* Dialing...")

		if !dw {
			switch o_mainchara.curCall {
				default:
					m[1] = "* This message shows up if&&  I messed up BIG time.&&* Please report this."
					m[2] = "* In preference, report it&&  with specific details&&  on how it happened."
				break
		
				case 0:
					for (var i = 1;i < 4;i++) {c[i] = "Toriel"}
					m[1] = "* Hello there! This is&&  Ms. Toriel speaking..."
					m[2] = "* Hm, this is a test call?&&  Understood."
					m[3] = "* Well, thank you for your&&  ~Lpatience!"
				break
			}

			var lastm = arlen(m)

			c[lastm] = ""
			m[lastm] = tr("* Click...")
		}
		else {m[1] = tr("* It's nothing but garbage noise.")}
	}
}