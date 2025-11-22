var b,en,wep

b = battle_globals
en = b.en[b.curIt]

var curCh = string_lower(global.name[0])

switch curCh {
	default:
		var at_w = sprite_get_width(at_hit) * 2

		if b.scene > 2 {
			image_alpha -= 0.2
			destroy(at_bar)
		}

		if image_alpha <= 0 {
			for (var i = 0;i < array_length(b.ftimer);i++) {
				b.ftimer[i] = 0
				b.fframe[i] = 0
			}

			destroy()
			destroy(f_ef)
		}

		if b.ftimer[1] > 0 {b.ftimer[1] -= 0.2}
		
		with (board) {
			if global.debug and c_pressed() {b.fight_xx = l[1] + irandom_twice(180,460)}
			
			var fi = 0
			
			if i_exists(fight_1) {fi = fight_1.image_alpha}

			draw_set_alpha(fi)
			draw_set_color(#22B14C)
			draw_rectangle(l[1] + 61,u[1] + 3,r[1] - 61,u[1] + 5,0)
			draw_rectangle(l[1] + 61,d[1] - 5,r[1] - 61,d[1] - 3,0)
			
			draw_set_alpha(b.ftimer[1] * fi)
			draw_set_color(c_white)
			draw_rectangle(l[1] + 61,u[1] + 3,r[1] - 61,u[1] + 5,0)
			draw_rectangle(l[1] + 61,d[1] - 5,r[1] - 61,d[1] - 3,0)
				
			draw_set_alpha(fi)
			draw_set_color(c_black)
			draw_rectangle(l[1] + 63,u[1] + 3,l[1] + 68,d[1] - 3,0)
			draw_rectangle(r[1] - 68,u[1] + 3,r[1] - 63,d[1] - 3,0)

			draw_set_color(#093724)
			draw_rectangle(b.fight_xx - 8,u[1] + 6,b.fight_xx + at_w + 8,d[1] - 6,0)

			draw_spr(at_hit,0,b.fight_xx,u[1] + 3,2,2,0,c_white,fi)
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
									
						draw_spr(at_hit,0,b.fight_xx,board.u[1] + 3,2,2,0,c_white,image_alpha)

						if b.ftimer[2] {
							draw_spr(at_hit,0,b.fight_xx,board.u[1] + 3,2,2,0,c_white,image_alpha)
							b.ftimer[2] = 0
						}
						else {b.ftimer[2]++}
						
						var pw = (b.ftimer[3] * 12)

						draw_set_alpha(1 - b.ftimer[3])
						draw_set_color(#FFE500)
						draw_rectangle(at.x - pw,at.y - pw,(at.x + at.sprite_width) + pw,(at.y + at.sprite_height) + pw,0)
						draw_set_alpha(1)
							
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
			
		draw_set_alpha(1)
	break
}

function attack_calc() {
	var b,bo,en,d,pw,dmg,acc,rdmg,bx,at_w,hitbx,px1,px2,ppx,r,bonus,sp,wep_b,atk
	
	b = battle_globals
	bo = board
	en = b.en[b.curIt]
	d = en.def

	atk = global.at[0,b.dw]
	wep_b = global.wep_b[0,b.dw]

	pw = wep_b + atk

	dmg = pw - d
	acc = 0
	
	rdmg = dmg + irandom_range(0,2)

	bx = at_bar.x + (at_bar.sprite_width / 2)
	at_w = sprite_get_width(at_hit) * 2
	
	hitbx = 2
	
	px1 = b.fight_xx - hitbx
	px2 = b.fight_xx + (at_w + hitbx)
	ppx = px1 + 20

	r = 2

	if bx >= px1 and bx <= px2 {
		if bx >= px1 + (12 + hitbx) and bx <= px2 - (12 + hitbx) {rdmg = round(rdmg * (r + 0.5))}
		else {rdmg = round(rdmg * (r + 0.2))}
		
		audio_play(slash_0,,,0.7,,1.1)
		audio_play(slash_1)
		audio_play(save_plus,,,0.4,,0.75)
		acc = 1
		
		b.fframe[0] = 1
	}
	else  {
		if bx < px1 {
			bonus = abs(bx - px1)
			if bonus = 0 {bonus = 1}
			acc = (px1 - bonus) / px1
		}
		
		if bx > px2 {
			bonus = abs(bx - px2)
			if bonus = 0 {bonus = 1}
			acc = (px2 - bonus) / px2
		}

		rdmg *= acc
		rdmg = round(rdmg * r)
		audio_play(slash_0)
	}

	show_debug_message(dmg)
	show_debug_message(rdmg)
	show_debug_message(acc)
	
	if rdmg <= 0 {rdmg = 1}

	sp = 0.5 - (acc / 4)
	if sp <= 0 {sp = 0.1}

	sl = i_create(en.x + (en.sprite_width / 2) - 5,en.y + 5,en.depth - 1,at_slash)
	sl.image_blend = #FF6969
	sl.image_xscale = acc * 2 - 0.5
	sl.image_yscale = acc * 2 - 0.5
	sl.image_speed = sp
	sl.dmg = rdmg
	en.shakeTimer = (1 / sp) * (image_number + 3)

	if bx >= px1 and bx <= px2 {
		sl.image_blend = #69FFFF
		sl.ef = 1
	}
}