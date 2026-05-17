switch _id {
	default:
		if a.draw {
			image_alpha = 0
<<<<<<< HEAD

=======
			
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			if pos = -1 {
				if !ch {
					x -= 150 * (instance_number(dialsmall) - 1)
					ch = 1
				}
			}
		}
		else {
			if image_alpha < 1 {
				speed += 2
				image_alpha += 0.2
			}
			else {speed = 0}

			switch c {
				case "Toriel":
					draw_spr(t_base)
<<<<<<< HEAD
					draw_spr(t_eyes,e,x + 16,y + 6,,,,1)
					draw_spr(mo,mo_f,x + 20,y + 21,,,,1)
				break
			}

			draw_alp(image_alpha)
			draw_col(image_blend)
=======
					draw_spr(t_eyes,e,x + 16,y + 6,,,,,1)
					draw_spr(mo,mo_f,x + 20,y + 21,,,,,1)
				break
			}

			draw_set_alpha(image_alpha)
			draw_set_color(image_blend)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			draw_font(1)
			draw_txt(x + 64,y + 9,m,1,1)
		}
	break
}

<<<<<<< HEAD
draw_alp(1)
=======
draw_set_alpha(1)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
