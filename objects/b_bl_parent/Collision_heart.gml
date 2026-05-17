switch at_style {
	case 3:
	case 0:
		do_damage()
	break

	case 2:
	case 1:
		if heart.moving = (at_style != 2) {do_damage()}
	break
}

if deletes {destroy()}

function do_damage(c = 0){
	var h,b,arm,a,dw,def
	h = heart
	b = global.inBattle ? battle_globals : o_mainchara
	dw = b.dw

	def = global.df[c,dw] + global.arm_b[c,dw]

	if (global.hard < 2) {
		if !h.inv {
			var dmg = 2

			var dmgData = {
				"0": [0,0,0,0]
			}

			var dat = [0,0,0,0]
			var dmd = dmgData[$ bull] ?? "0"
			if is_array(dmd) {dat = [dmd[0],dmd[1],dmd[2],dmd[3]]}
			else {dat[0] = dmd}
			
			print(dmd)
			print(is_array(dmd))

			dmg += dat[0]
			var mindmg = dat[1]
			var maxdmg = dat[2]
			var overdmg = dat[3]

			dmg = round(dmg - (def / 5))
			if dmg < mindmg {dmg = mindmg}
			if maxdmg and dmg > maxdmg {dmg = maxdmg}
			if overdmg {dmg = overdmg}
			if !dmg {dmg = 1}

			switch at_style {
				default:
					with (h) {s_trigger[2] = 0}

					scr_execute($"{bull}_postDmg")

					dmg += max(0,min(8,floor((global.hp[c,dw] - 20) / 10)))
					global.hp[c,dw] -= dmg
					audio_play(hurt)

					h.inv = b.inv
					h.hits++
					if b.inv > 5 {shake()}
				break

				case 3:
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