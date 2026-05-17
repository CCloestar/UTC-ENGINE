var char,con,cond,talk,dir,s_dir,shop,sh_id,sh_p,sh_it,ex,xx,yy

char = o_mainchara
con = gpad._gpad > -1
<<<<<<< HEAD
cond = [1,1]
=======

cond[0] = 1
cond[1] = 1
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

talk = 0
dir = 0
s_dir = 0
shop = 0
sh_id = 0
sh_it = "Toy Knife"
ex = ""

switch txt {
	case "shopTest":
		shop = 1
		sh_p = 10
<<<<<<< HEAD
		cond[1] = (trigger[0] = 2)
=======
		cond[1] = (trigger = 2)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	break
}

if (dir or talk) and f = -1 {f = 0}

if f > -1 {
<<<<<<< HEAD
	var d_spr = $"{n}_{f}"
	var ex_spr = d_spr + ex

	if spr_exists(a_index(ex_spr)) {d_spr = ex_spr}
	var t_spr = $"{d_spr}_t"

	if spr_exists(a_index(t_spr)) {d_spr = t_spr}
	if spr_exists(a_index(d_spr)) {sprite_index = a_index(d_spr)}
=======
	var d_spr = n + "_" + string(f)
	var ex_spr = d_spr + ex
	
	if sprite_exists(asset_get_index(ex_spr)) {d_spr = ex_spr}
	
	var t_spr = d_spr + "_t"
	
	if sprite_exists(asset_get_index(t_spr)) {d_spr = t_spr}
	if sprite_exists(asset_get_index(d_spr)) {sprite_index = asset_get_index(d_spr)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}

xx = 0
yy = 0

switch n {
	default:
		xx = -sprite_xoffset
		yy = -sprite_yoffset
	break
}

<<<<<<< HEAD
switch trigger[0] {
=======
switch trigger {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	case 0:
		if talk and !dial_exists() {
			image_speed = 0
			image_index = 0
		}
<<<<<<< HEAD

		if interacted() and cond[0] {
			a = dial_create()
			a.m = ["* Error!"]

			switch txt {
				case "shopTest":
					a.m = [ $"* Leave {sh_p}G on froggit?&2         Yes         No"]
=======
	
		if interacted() and cond[0] {
			a = dial_create()
			a.m[0] = "* Error!"

			switch txt {
				case "shopTest":
					a.m[0] = "* Leave " + string(sh_p) + "G on froggit?&2         Yes         No"
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				break
			}

			char_stop()
<<<<<<< HEAD

			if dir {
				f = char.f - 2
				if f = -1 {f = 3}
				if f = -2 {f = 2}
			}

			if shop {c = choice_create("v",a.depth - 10,a)}
			trigger[0] = 1
		}
	break

=======
			
			if dir {
				if char.f = 0 {f = 2}
				if char.f = 1 {f = 3}
				if char.f = 2 {f = 0}
				if char.f = 3 {f = 1}
			}
			
			if shop {c = choice_create("v",a.depth - 10,a)}

			trigger = 1
		}
	break
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	default:
		if dial_exists() {
			if talk {image_index = dialogue.talkfr}
		}
		else {
<<<<<<< HEAD
			if shop and trigger[0] < 2 {
=======
			if shop and trigger < 2 {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				if !global.choice {
					switch txt {
						default:
							a = dial_create()
<<<<<<< HEAD

							if item_amt() < 8 {
=======
							
							if item_amt(dw_check()) < 8 {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
								if global.g[dw_check()] >= sh_p {
									global.g[dw_check()] -= sh_p

									audio_play(buy)
									add_item(sh_it)
								}
<<<<<<< HEAD
								else {a.m = [dw_check() ? tr("* You didn't have enough&&  dark gold.") : tr("* You didn't have enough&&  gold.")]}
							}
							else {a.m = [tr("* (You're carrying too much.)")]}

							trigger[0] = 2
						break
					}
				}
				else {trigger[0] = 2}
			}

			if cond[1] {
				if talk {image_index = 0}
				if dir and s_dir {f = 0}

				trigger[0] = 0
=======
								else {
									a.m[0] = text("* You didn't have enough&&  gold.")
									if dw_check() {a.m[0] = text("* You didn't have enough&&  dark gold.")}
								}
							}
							else {a.m[0] = text("* (You're carrying too much.)")}
							
							trigger = 2
						break
					}
				}
				else {trigger = 2}
			}
			
			if cond[1] {
				if talk {image_index = 0}
				if dir and s_dir {f = 0}
				
				trigger = 0
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				char_free()
			}
		}
	break
}

if sprite_index != d_interact {
	mask_lay(,dep)
<<<<<<< HEAD
	draw_a(,xx,yy)
=======
	draw_area(,xx,yy)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	draw_hitbox()
}
else {
	if i_exists(display) and global.showcol and display.d {draw_self()}
<<<<<<< HEAD
}
=======
}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
