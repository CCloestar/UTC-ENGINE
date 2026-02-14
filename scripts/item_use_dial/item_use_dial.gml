function item_use_dial(dw = 0,onlyUse = 0){
	var cur_it,hp,at,df,it_type,itPr,taste,sfx,txt,use,wep,arm,_h

	cur_it = global.item[curIt,3 * dw]

	wep = global.wep[0,dw]
	arm = global.arm[0,dw]

	_h = (global.hard = 2)

	hp = 0
	at = 0
	df = 0
	it_type = 0
	itPr = 0
	taste = ""
	sfx = hp_plus
	txt[0] = ""
	txt[1] = ""
	txt[2] = ""
	use = 0
	
	switch cur_it {
		case "Toy Knife":
			sfx = buy
			itPr = 1
			it_type = 1
			at = 3
			txt[0] = "* You equipped Toy Knife."
			txt[1] = text("* Made of plastic.&&* A rarity nowadays.")
		break
	}
	
	globals.myHP = hp
	globals.itPronoun = itPr
	globals.myT = taste
	
	if onlyUse = 1 {
		if !_h {return hp}
		else {return taste}
	}
	if onlyUse = 2 {return at}
	if onlyUse = 3 {return df}
	if onlyUse = 4 {return text(txt[1])}
	
	u = dial_create()
	u.m[0] = "* If you're reading &&  this, I have messed up &&  somehow."
	u.freeze = 0
	
	var xx = 0
	var yy = 0
	
	if global.inBattle {
		use = 0
		u.preset = -1
		u.x = 52
		u.y = 278
	}
	else {use = cur_use}

	switch use {
		#region USE ITEM
			case 0:
				audio_play(sfx)

				switch it_type {
					case 0:
						if !_h {
							if global.hp[0,dw] + hp < global.maxhp[0,dw] {
								global.hp[0,dw] += hp
								txt[0] += "&&" + text("recov",hp)
							}
							else {
								global.hp[0,dw] = global.maxhp[0,dw]
								
								var dot = "."
								if l_check() {dot = "。"}
								
								var yerHp = text("* Your HP was maxed out",dot)

								txt[0] += "&&" + yerHp
							}
						}

						u.delete_post = 1
					break

					case 1:
						if wep != "" and wep != "None" {
							if !swap_prevent(dw_check()) {
								u.swap_post = 1
								u.to_swap = cur_it
							}
							else {
								u.delete_post = 1
								u.m[1] = text("hideIt" + string(itPr),text(wep))
								
								global.wep[0,dw] = cur_it
							}
						}
						else {
							u.delete_post = 1
							
							global.wep[0,dw] = cur_it
						}
						
						global.wep_b[0,dw] = at
					break
					
					case 2:
						if arm != "" and arm != "None" {
							if !swap_prevent(dw_check()) {
								u.swap_post = 2
								u.to_swap = cur_it
							}
							else {
								u.delete_post = 1
								u.m[1] = text("hideIt" + string(itPr),text(arm))
								
								global.arm[0,dw] = cur_it
							}
						}
						else {
							u.delete_post = 1
							
							global.arm[0,dw] = cur_it
						}
						
						global.arm_b[0,dw] = df
					break
				}
			break
		#endregion
		
		#region INFO ITEM
			case 1:
				var ef
				ef[0] = hp
				ef[1] = at
				ef[2] = df
				
				var it = "itDesc_" + string(it_type)

				if _h and it_type != 1 {it = "itDesc_3"}
				
				txt[1] = text(it,text(cur_it),ef[it_type],text(taste)) + "&&" + txt[1]
			break
		#endregion
		
		#region DROP ITEM
			case 2:
				var throw_message
				
				for (var i = 0; i < 18;i++) {
					throw_message[i] = text("throw_4",text(cur_it))
					
					for (var o = 0; o < 4;o++) {throw_message[o] = text("throw_" + string(o),text(cur_it))}
				}

				txt[2] = throw_message[random(round(18))]

				u.delete_post = 1
			break
		#endregion
	}
	
	u.m[0] = text(txt[use])
}