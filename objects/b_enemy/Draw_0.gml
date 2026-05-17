var b = battle_globals
draw_self()

if in_debug() {
	var dx = (x + sprite_width) + 10

	var dbg = [
		$"X: {x},Y: {y}",
		$"ID: {_id}, NAME: {name}",
		$"HP: {hp} / {maxhp}, DEF: {def}",
		$"GOLD: {gold}, XP: {xp}",
		$"SPARE: {spare}",
		$"HURT: {_hurt}",
		$"DEAD: {dead}",
		$"{a}, Heard: {heard}"
	]

	draw_font(1)
	for (var i = 0;i < arlen(dbg);i++) {draw_txt_outline(dx,y + (16 * i),dbg[i],(i = 4) ? (spare ? c_yellow : c_white) : c_white,,,,,1)}
}

if _hurt and !dead {
	sha[0]++

	if sha[0] >= shakeTimer {
		if !shaking {
			if dmg {
				part_visible(0)
				part_reset()
				x = xstart
				y = ystart

				sprite_index = spr[0,0]
				image_index = spr[0,1]

				hp -= dmg
				shaker = shakef

				audio_play(hurtsnd)
			}

			dm = i_create(,y - 24,,b_dmg)
			dm.maxhp = maxhp
			dm._hp = hp + dmg
			dm.hp = hp
			dm.dmg = dmg
			dm.ww = sprite_width
			dm.wf = sprite_width / maxhp

			shaking = 1
		}
		else {
			if shaker = 0 {
				if b_dmg.y >= b_dmg.ystart {
					if shaketim {shaketim = 0}
					shaketim--

					if shaketim <= -shake_return {
						if hp {
							if dmg {
								sprite_index = spr[3,0]
								image_index = spr[3,1]
							}

							shaketim = 0
							sha = [0,0]
							shaker = 0
							_hurt = 0
							shaking = 0
						}
						else {
							hp = 0
							dead = 1 + (2 * iRun)
						}
						if b.remain {b_scene(4)}
						destroy(b_dmg)
					}
				}
			}
			else {
				shaketim++

				if shaketim % 2 == 0 {
					if !sha[1] {sha[1] = x}
					x = sha[1] + shaker

					if shaker < 0 {shaker = -(shaker + 1)}
					else {shaker *= -1}
				}
			}
		}
	}
}

if !(((sha[0] >= shakeTimer) and dmg) or dead) {
	part_visible(1)
	scr_execute($"{name[1]}_idle")
}

switch dead {
	case 1:
		b.b_gold += gold
		global.g[b.dw] += gold
		b.remain--

		draw_deadspr()

		global.xp += xp
		b.b_xp += xp
		global.kills[b.dw]++

		d = i_create(,,,b_dust_spawn)
		d.sprite_index = self.surf_spr
		d.sp = v_speed
		d.ex_sp = v_speed_ex
		d.wide = wide_dust

		dead += 0.1
	break

	case 2:
		var gg = floor(gold * ((maxhp - hp) / maxhp)) + ex_g

		b.b_gold += gg
		global.g[b.dw] += gg
		b.remain--

		global.spares[b.dw]++

		audio_stop(en_death)
		audio_play(en_death)

		draw_deadspr(1)

		var sw = spr_w(self.surf_spr)
		var sh = spr_h(self.surf_spr)

		for (var i = 0;i < 14;i++) {
			var rx = rnd(sw / 2) + (sw / 4) + (x - 8)
			var ry = rnd(sh / 2) + (sh / 4) + (y - 8)

			d = i_create(rx,ry,,p_dust)
			d.ws = (8 + (d.x - x)) / (sw / 2)
			d.hs = (8 + (d.y - y)) / (sh / 2)
		}

		image_alpha = 0.5
		dead += 0.1
	break

	case 3:
		b.b_gold += gold
		global.g[b.dw] += gold
		b.remain--

		draw_deadspr()

		d = i_create(,,,b_runner)
		d.sprite_index = self.surf_spr

		dead += 0.1
	break
}

if hp < round(maxhp / 3) {
	attacked = 1
	spare = sparehurt

	scr_execute($"{name[1]}_lowhp")
}