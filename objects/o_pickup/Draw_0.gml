var has_dep,dep,s_i,s_end,s_fr,xx,yy,spr,m,it,cond,c_id,picked

cond[0] = 1
cond[1] = 1

has_dep = 1
dep = depth
s_i = 0
s_end = 1
s_fr = 0
xx = sprite_xoffset
yy = sprite_yoffset
spr = sprite_index
m = mask_index
it = "Toy Knife"
c_id = 0

picked = 0

switch i {
	default:
	break
}

switch trigger {
	case 0:
		if interacted() and cond[0] {
			char_stop()
			
			a = dial_create()
			b = choice_create(c_id,,a)
			
			switch i {
				default:
					a.m[0] = text(i + "_pick")
					a.play = 0
				break
			}
			
			trigger = 1
		}
	break
	
	case 1:
		picked = (global.choice = 0)
		
		if !dial_exists() {
			if picked {
				a = dial_create()
			
				if item_amt(dw_check()) < 8 {
					if s_end > 1 {a.m[0] = text(i + "_picked_" + string(global.story[s_i]))}
					else {a.m[0] = text(i + "_picked")}
					
					add_item(it)
					global.story[s_i]++
					image_index += (s_fr > 0)
				}
				else {a.m[0] = text("* (You're carrying too much.)")}

				trigger = 0
			}
			else {
				trigger = 0
				char_free()
			}
		}
	break
}

if global.story[s_i] >= s_end {destroy()}

if has_dep {mask_lay(,1)}
else {depth = dep}

sprite_index = spr

draw_area()
draw_hitbox()