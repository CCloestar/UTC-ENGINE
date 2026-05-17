var _dep,s_i,s_end,s_fr,xx,yy,spr,m,it,cond,c_id,picked

cond = [1,1]

_dep = 1
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

var _i = {
	"tk": [toyknife,"Toy Knife",1,""]
}

var i_ = [_i[$ i],_i[$ "tk"]]

spr = (i_[0] = undefined) ? i_[1][0] : i_[0][0]
it = (i_[0] = undefined) ? i_[1][1] : i_[0][1]
cond[0] = (i_[0] = undefined) ? i_[1][2] : i_[0][2]
_dep = (i_[0] = undefined) ? i_[1][3] : i_[0][3]

switch trigger {
	case 0:
		if interacted() and cond[0] {
			char_stop()

			a = dial_create()
			b = choice_create(c_id,,a)

			switch i {
				default:
					a.m = [tr($"{i}_pick")]
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

				if item_amt() < 8 {
					if s_end > 1 {a.m = [tr($"{i}_picked_{global.story[s_i]}")]}
					else {a.m = [tr($"{i}_picked")]}

					add_item(it)
					global.story[s_i]++
					image_index += (s_fr > 0)
				}
				else {a.m = [tr("* (You're carrying too much.)")]}

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
else {
	if _dep = "" {mask_lay(,1)}
	else {depth = _dep}

	sprite_index = spr

	draw_a()
	draw_hitbox()
}