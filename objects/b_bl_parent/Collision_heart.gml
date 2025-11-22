switch at_style {
	case 3:
	case 0:
		do_damage()
	break
	
	case 1:
		if heart.moving {do_damage()}
	break
	
	case 2:
		if !heart.moving {do_damage()}
	break
}

if deletes {destroy()}

function do_damage(c = 0){
	var h,b,arm,a,dw,def
	h = heart
	b = battle_globals

	if !global.inBattle {b = o_mainchara}

	dw = b.dw
	
	def = global.df[c,dw] + global.arm_b[c,dw]

	if (global.hard < 2) {
		if !h.inv {
			var dmg = 2

			switch at_style {
				default:
					var mindmg = 0
					var maxdmg = 0
					var overdmg = 0
				
					with (h) {s_trigger[2] = 0}

					switch object_get_name(object_index) {
						default:
						break
					}

					if global.hp[c,dw] > 20 {dmg++}
					if global.hp[c,dw] >= 30 {dmg++}
					if global.hp[c,dw] >= 40 {dmg++}
					if global.hp[c,dw] >= 50 {dmg++}
					if global.hp[c,dw] >= 60 {dmg++}
					if global.hp[c,dw] >= 70 {dmg++}
					if global.hp[c,dw] >= 80 {dmg++}
					if global.hp[c,dw] >= 90 {dmg++}

					dmg = round(dmg - (def / 5))
					if dmg < mindmg {dmg = mindmg}
					if maxdmg and dmg > maxdmg {dmg = maxdmg}
					if overdmg {dmg = overdmg}
					if !dmg {dmg = 1}
					
					global.hp[c,dw] -= dmg

					audio_play(hurt)
					h.inv = b.inv
					h.hits++
					if b.inv > 5 {shake()}
				break

				case 3:
					if dmg < mindmg {dmg = mindmg}
					if maxdmg and dmg > maxdmg {dmg = maxdmg}
					if overdmg {dmg = overdmg}
					if !dmg {dmg = 1}
					
					global.hp[c,dw] += round(1 + dmg)

					audio_play(hp_plus)
				break
			}
		}
	}
	else {
		for (var i = 0;i < fl_max() + 1;i++) {global.hp[i,dw] = 0}
	}
}