<<<<<<< HEAD
var dw = dw_check()
=======
load_d_dw()
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

switch _id {
	default:
		var jx,jy
		jx = 4 * l_check()

		if _id = "v" {
<<<<<<< HEAD
			draw_b(408,184,609,291,,,,,dw)

			draw_font(1)
			draw_set_color(c_white)
			draw_txt(436 + jx,208 - jx,tr($"buyTxt_{dw}",global.g[dw]))
			draw_txt(436 + jx,248 - jx,tr("buyTxt_S",item_amt()))
		}

=======
			draw_box(408,184,609,291,,,,,dw)

			draw_font(1)
			draw_set_color(c_white)
			draw_txt(436 + jx,208 - jx,text("buyTxt_" + string(dw),global.g[dw]))
			draw_txt(436 + jx,248 - jx,text("buyTxt_S",item_amt(dw)))
		}
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		if !d.draw {
			with (d) {
				finish = 0
				play = 0
			}

			x = 178 + (192 * curCh)

<<<<<<< HEAD
			draw_spr(heart_menu,0,x - (jx * 2),(d.y + 72) - jx,2,,global.color[0])
=======
			draw_spr(heart_menu,0,x - (jx * 2),(d.y + 72) - jx,2,2,,global.color[0])
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

			if l_pressed() or r_pressed() {
				curCh = !curCh
				audio_play(click)
			}

			if z_pressed() {
				global.choice = curCh
<<<<<<< HEAD

=======
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				d.next_m = 1
				destroy()
			}
		}
	break
}