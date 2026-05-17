function f_at_null() {
	var b,en,wep

	b = battle_globals
	en = b.en[b.curIt]

	var at_w = spr_w(at_hit) * 2

	if b.scene > 2 {
		image_alpha -= 0.2
		destroy(at_bar)
	}

	if image_alpha <= 0 {
		for (var i = 0;i < arlen(b.ftimer);i++) {
			b.ftimer[i] = 0
			b.fframe[i] = 0
		}

		destroy()
		destroy(f_ef)
	}

	if b.ftimer[1] > 0 {b.ftimer[1] -= 0.2}

	with (board) {
		if global.debug and c_pressed() {b.fight_xx = l[1] + irnd_r(180,460,2)}

		var fi = i_exists(fight_1) ? fight_1.image_alpha : 0

		draw_col(#22B14C)
		draw_rec(l[1] + 61,u[1] + 3,r[1] - 61,u[1] + 5,,,fi)
		draw_rec(l[1] + 61,d[1] - 5,r[1] - 61,d[1] - 3,,,fi)

		draw_col(c_white)
		draw_rec(l[1] + 61,u[1] + 3,r[1] - 61,u[1] + 5,,,b.ftimer[1] * fi)
		draw_rec(l[1] + 61,d[1] - 5,r[1] - 61,d[1] - 3,,,b.ftimer[1] * fi)

		draw_col(c_black)
		draw_rec(l[1] + 63,u[1] + 3,l[1] + 68,d[1] - 3,,,fi)
		draw_rec(r[1] - 68,u[1] + 3,r[1] - 63,d[1] - 3,,,fi)

		draw_rec(b.fight_xx - 8,u[1] + 6,b.fight_xx + at_w + 8,d[1] - 6,,#093724,fi)
		draw_spr(at_hit,0,b.fight_xx,u[1] + 3,2,0,c_white,fi)
	}

	b.ftimer[0]++

	if b.ftimer[0] % 10 == 0 {
		left = i_create(b.fight_xx - 8,board.u[1] + 6,,f_ef)
		left.speed = -2

		right = i_create(b.fight_xx + at_w + 8,board.u[1] + 6,,f_ef)
		right.speed = 2
	}

	switch global.wep[0,b.dw] {
		default:
			if !i_exists(at_bar) {
				if !i_exists(b_dmg) and b.scene < 4 {
					en.dmg = 0

					at = i_create(-10,256,,at_bar)
					at.image_speed = 0
				}
			}
			else {
				if at.image_speed <= 0 {
					at.x += 10

					if z_pressed() {
						if at.x >= board.l[1] + 61 + (at.sprite_width / 2) and at.x < (board.r[1] - 61) - (at.sprite_width / 2) {
							at.image_speed = 0.4

							attack_calc()
						}
						else {
							audio_play(slash_2,,,0.3)
							b.ftimer[1] = 1
						}
					}
				}

				if b.fframe[0] {
					b.ftimer[3] += 0.1

					var fx = b.fight_xx

					gpu_set_blendmode(bm_add)

					draw_spr(at_hit,0,b.fight_xx,board.u[1] + 3,2,0,c_white,image_alpha)

					if b.ftimer[2] {
						draw_spr(at_hit,0,b.fight_xx,board.u[1] + 3,2,0,c_white,image_alpha)
						b.ftimer[2] = 0
					}
					else {b.ftimer[2]++}

					var pw = (b.ftimer[3] * 12)

					draw_rec(at.x - pw,at.y - pw,(at.x + at.sprite_width) + pw,(at.y + at.sprite_height) + pw,,#FFE500,1 - b.ftimer[3])							
					gpu_set_blendmode(bm_normal)
				}

				if at.x >= room_width {
					en.dmg = 0
					en.shakeTimer = 0
					en._hurt = 1
					destroy(at_bar)
				}
			}
		break
	}

	draw_alp(1)
}