var curCh = str_l(global.name[0])
scr_execute($"f_at_{curCh}")

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

	rdmg = dmg + irnd_r(0,2)

	bx = at_bar.x + (at_bar.sprite_width / 2)
	at_w = spr_w(at_hit) * 2

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

	print(dmg)
	print(rdmg)
	print(acc)

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