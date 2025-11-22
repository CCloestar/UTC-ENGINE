var char,con,cond,talk,dir,s_dir,shop,sh_id,sh_p,sh_it,ex,xx,yy

char = o_mainchara
con = gpad._gpad > -1

cond[0] = 1
cond[1] = 1

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
		cond[1] = (trigger = 2)
	break
}

if (dir or talk) and f = -1 {f = 0}

if f > -1 {
	var d_spr = n + "_" + string(f)
	var ex_spr = d_spr + ex
	
	if sprite_exists(asset_get_index(ex_spr)) {d_spr = ex_spr}
	
	var t_spr = d_spr + "_t"
	
	if sprite_exists(asset_get_index(t_spr)) {d_spr = t_spr}
	if sprite_exists(asset_get_index(d_spr)) {sprite_index = asset_get_index(d_spr)}
}

xx = 0
yy = 0

switch n {
	default:
		xx = -sprite_xoffset
		yy = -sprite_yoffset
	break
}

switch trigger {
	case 0:
		if talk and !dial_exists() {
			image_speed = 0
			image_index = 0
		}
	
		if interacted() and cond[0] {
			a = dial_create()
			a.m[0] = "* Error!"

			switch txt {
				case "shopTest":
					a.m[0] = "* Leave " + string(sh_p) + "G on froggit?&2         Yes         No"
				break
			}

			char_stop()
			
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
	
	default:
		if dial_exists() {
			if talk {image_index = dialogue.talkfr}
		}
		else {
			if shop and trigger < 2 {
				if !global.choice {
					switch txt {
						default:
							a = dial_create()
							
							if item_amt(dw_check()) < 8 {
								if global.g[dw_check()] >= sh_p {
									global.g[dw_check()] -= sh_p

									audio_play(buy)
									add_item(sh_it)
								}
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
				char_free()
			}
		}
	break
}

if sprite_index != d_interact {
	mask_lay(,1)
	draw_area(,xx,yy)
	draw_hitbox()
}
else {
	if i_exists(display) and global.showcol and display.d {draw_self()}
}