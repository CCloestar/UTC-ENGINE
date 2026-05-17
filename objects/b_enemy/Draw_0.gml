var b = battle_globals
draw_self()

<<<<<<< HEAD
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
=======
if global.debug and display.d {
	var dx = (x + sprite_width) + 10
	var sc = 1
	var sp = 16

	draw_font(1,0)
	draw_txt_outline(dx,y,"X: " + string(x) + ", Y: " + string(y),c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + sp,"ID: " + string(_id) + ", NAME: " + name,c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + (sp * 2),"HP: " + string(hp) + " / "  + string(maxhp) + ", DEF: " + string(def),c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + (sp * 3),"GOLD: " + string(gold) + ", XP: " + string(xp),c_white,,,,,sc,sc)

	var spacol = c_white
	
	if spare {spacol = c_yellow}
	
	draw_txt_outline(dx,y + (sp * 4),"SPARE: " + string(spare),spacol,,,,,sc,sc)
	draw_txt_outline(dx,y + (sp * 5),"HURT: " + string(_hurt),c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + (sp * 6),"DEAD: " + string(dead),c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + (sp * 7),string(a) + ", Heard: " + string(heard),c_white,,,,,sc,sc)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}

if _hurt and !dead {
	sha[0]++

	if sha[0] >= shakeTimer {
		if !shaking {
			if dmg {
				part_visible(0)
<<<<<<< HEAD
				part_reset()
				x = xstart
				y = ystart

				sprite_index = spr[0,0]
				image_index = spr[0,1]

				hp -= dmg
				shaker = shakef

=======
				x = xstart
				y = ystart

				for (var i = 0;i < array_length(timer);i++) {
					timer[i] = 0
					trigger[i] = 0
				}

				sprite_index = hurtspr
				image_index = hurtfr

				hp -= dmg
				shaker = shakef
				
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				audio_play(hurtsnd)
			}

			dm = i_create(,y - 24,,b_dmg)
			dm.maxhp = maxhp
			dm._hp = hp + dmg
			dm.hp = hp
			dm.dmg = dmg
			dm.ww = sprite_width
			dm.wf = sprite_width / maxhp
<<<<<<< HEAD

=======
			
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			shaking = 1
		}
		else {
			if shaker = 0 {
				if b_dmg.y >= b_dmg.ystart {
					if shaketim {shaketim = 0}
					shaketim--
<<<<<<< HEAD

					if shaketim <= -shake_return {
						if hp {
							if dmg {
								sprite_index = spr[3,0]
								image_index = spr[3,1]
							}

							shaketim = 0
							sha = [0,0]
=======
			
					if shaketim <= -shake_return {
						if hp {
							if dmg {
								sprite_index = idlespr
								image_index = idlefr
							}
						
							shaketim = 0
							sha[0] = 0
							sha[1] = 0
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
							shaker = 0
							_hurt = 0
							shaking = 0
						}
						else {
							hp = 0
							dead = 1 + (2 * iRun)
						}
<<<<<<< HEAD
						if b.remain {b_scene(4)}
=======
						if b.remain {set_scene(4)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						destroy(b_dmg)
					}
				}
			}
			else {
				shaketim++

				if shaketim % 2 == 0 {
					if !sha[1] {sha[1] = x}
					x = sha[1] + shaker
<<<<<<< HEAD

=======
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					if shaker < 0 {shaker = -(shaker + 1)}
					else {shaker *= -1}
				}
			}
		}
	}
}

if !(((sha[0] >= shakeTimer) and dmg) or dead) {
	part_visible(1)
<<<<<<< HEAD
	scr_execute($"{name[1]}_idle")
=======
	en_anim()
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}

switch dead {
	case 1:
		b.b_gold += gold
		global.g[b.dw] += gold
		b.remain--
<<<<<<< HEAD

		draw_deadspr()

=======
		
		draw_deadspr()
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		global.xp += xp
		b.b_xp += xp
		global.kills[b.dw]++

		d = i_create(,,,b_dust_spawn)
		d.sprite_index = self.surf_spr
		d.sp = v_speed
		d.ex_sp = v_speed_ex
		d.wide = wide_dust
<<<<<<< HEAD

=======
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		dead += 0.1
	break

	case 2:
		var gg = floor(gold * ((maxhp - hp) / maxhp)) + ex_g

		b.b_gold += gg
		global.g[b.dw] += gg
		b.remain--

		global.spares[b.dw]++
<<<<<<< HEAD

		audio_stop(en_death)
		audio_play(en_death)

		draw_deadspr(1)

		var sw = spr_w(self.surf_spr)
		var sh = spr_h(self.surf_spr)

		for (var i = 0;i < 14;i++) {
			var rx = rnd(sw / 2) + (sw / 4) + (x - 8)
			var ry = rnd(sh / 2) + (sh / 4) + (y - 8)

=======
		
		audio_stop(en_death)
		audio_play(en_death)
		
		draw_deadspr(1)
		
		var sw = sprite_get_width(self.surf_spr)
		var sh = sprite_get_height(self.surf_spr)
		
		for (var i = 0;i < 14;i++) {
			var rx = random(sw / 2) + (sw / 4) + (x - 8)
			var ry = random(sh / 2) + (sh / 4) + (y - 8)
			
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			d = i_create(rx,ry,,p_dust)
			d.ws = (8 + (d.x - x)) / (sw / 2)
			d.hs = (8 + (d.y - y)) / (sh / 2)
		}

		image_alpha = 0.5
		dead += 0.1
	break
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	case 3:
		b.b_gold += gold
		global.g[b.dw] += gold
		b.remain--
<<<<<<< HEAD

=======
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		draw_deadspr()

		d = i_create(,,,b_runner)
		d.sprite_index = self.surf_spr

		dead += 0.1
	break
}

<<<<<<< HEAD
if hp < round(maxhp / 3) {
	attacked = 1
	spare = sparehurt

	scr_execute($"{name[1]}_lowhp")
=======
attacked_check()

function attacked_check() {
	switch _id {
		default:
			if hp < round(maxhp / 3) {
				attacked = 1
				spare = 1
			}
		break
	}
}

function draw_deadspr(dead = 0) {
	var frs
	frs[0,0] = deadspr
	frs[0,1] = deadfr
	frs[1,0] = sparespr
	frs[1,1] = sparefr
	
	sprite_index = frs[dead,0]
	image_speed = 0
	image_index = frs[dead,1]
	x = xstart
	y = ystart

	draw_surface(self.surf,x,y)

	surface_set_target(self.surf)
	draw_self()
	surface_reset_target()

	self.surf_spr = sprite_create_from_surface(self.surf,x,y,sprite_width,sprite_height,1,0,0,0)
	surface_free(self.surf)

	visible = dead
	part_death()
}

function en_anim() {
	switch _id {
		case 0:
		break
	}
}
	
function part_death(){
	if variable_instance_exists(id,"part") {
		for (var p = 0;p < array_length(self.part);p++) {
			switch self.part[p].sprite_index {
				default:
					destroy(self.part[p])
				break
			}
		}
	}
}

function part_visible(vis = 0){
	if variable_instance_exists(id,"part") {
		for (var p = 0;p < array_length(self.part);p++) {
			if i_exists(self.part[p]) {self.part[p].visible = vis}
		}
	}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}