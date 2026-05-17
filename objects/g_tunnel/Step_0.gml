mask_lay(,1)

var c = o_mainchara
var cam = o_camera
var fl = o_follower

switch trigger {
	case 0:
		if interacted() {
			char_stop()
			c.visible = 0
			c.f = 0

			if i_exists(fl) {
				fl.visible = 0
				fl_interpolate()
			}

			c.x = x + 20
			cam_pos()
			audio_play(run_away,,,,,0.9)
			trigger = 1
		}
	break

	case 1:
		var bx = (x > xx)
		var by = (y > yy)

		c.x += 5 - (10 * bx)
		c.y += 5 - (10 * by)
		if abs(c.x - xx) <= 5 {c.x = xx}
		if abs(c.y - yy) <= 5 {c.y = yy}

		if c.x = xx and c.y = yy {
			audio_stop(run_away)
			audio_play(poing,,,0.5)

			c.x += 12 * i_exists(fl)
			c.visible = 1
			c.image_index = 1
			c.r = 1

			trigger = 2
			cam_pos()
		}
	break

	case 2:
		cam_pos()
		timer++

		c.image_speed = 0.1
		c.y -= 2 - (timer * 0.3)
		c.y += 2

		if i_exists(fl) {
			with (fl) {
				visible = 1
				fl.c = 1
				x = o_mainchara.x - 20
				y = o_mainchara.y - 6
				f = 0
				r = 1
				image_speed = 0.1

				if n = "Toriel" {
					f = -1
					sprite_index = toriel_trip
					image_speed = 0
					image_index = 0
				}
			}

			fl_interpolate()
		}

		if c.y >= yy + 36 {
			c.y = yy + 36
			cam_pos()

			with (c) {
				image_speed = 0
				image_index = 0
				r = 0
			}

			fl_interpolate()
			fl_face()

			char_free()
			timer = 0
			trigger = 0
		}
	break
}

if trigger {cam_pos()}