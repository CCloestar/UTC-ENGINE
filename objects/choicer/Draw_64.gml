var dw = dw_check()

switch _id {
	default:
		var jx,jy
		jx = 4 * l_check()

		if _id = "v" {
			draw_b(408,184,609,291,,,,,dw)

			draw_font(1)
			draw_set_color(c_white)
			draw_txt(436 + jx,208 - jx,tr($"buyTxt_{dw}",global.g[dw]))
			draw_txt(436 + jx,248 - jx,tr("buyTxt_S",item_amt()))
		}

		if !d.draw {
			with (d) {
				finish = 0
				play = 0
			}

			x = 178 + (192 * curCh)

			draw_spr(heart_menu,0,x - (jx * 2),(d.y + 72) - jx,2,,global.color[0])

			if l_pressed() or r_pressed() {
				curCh = !curCh
				audio_play(click)
			}

			if z_pressed() {
				global.choice = curCh

				d.next_m = 1
				destroy()
			}
		}
	break
}