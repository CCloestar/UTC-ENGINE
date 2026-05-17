function item_check(){
	var n = 3 * dw_check()

	for (var i = 0;i < 8;i++) {
		if global.item[i,n] = "" {
			for (var o = i;o < 8;o++) {global.item[o,n] = global.item[o + 1,n]}
		}

		global.item[i,n + 1] = global.item[i,n]
		global.item[i,n + 2] = global.item[i,n]
		
		var it = [global.item[i,n],global.item[i,n + 1],global.item[i,n + 2]]

		switch global.item[i,n] {
			case "Toy Knife":
				global.item[i,n + 2] = "Knife"
			break
		}
	}
}

function item_list() {
	can = [1,1,1]

	switch global.item[curIt,3 * dw_check()] {
		case "CantUseMeNorThrowMe": //for testing
			can = [0,1,0]
		break
	}
}

function item_pr(it = "") {
	var i = {
		"Toy Knife": irnd_r(200,400)
		//ADD MORE ITEM PRICES HERE
	}

	return (i[$ it] ?? 0)
}

function item_use_dial(dw = 0,onlyUse = 0){
	var cur_it,hp,at,df,it_type,itPr,myPr,taste,sfx,txt,use,_h

	cur_it = global.item[curIt,3 * dw]

	_h = (global.hard = 2)

	hp = 0
	at = 0
	df = 0
	it_type = 0
	itPr = ["o","a"]
	myPr = 0
	taste = ""
	sfx = hp_plus
	txt = ["","",""]
	use = 0
	
	var _f = [""]
	
	switch cur_it {
		case "Toy Knife":
			sfx = equip
			itPr = 1
			it_type = 1
			at = 10
			txt[0] = "* You have equipped the Toy Knife."
			txt[1] = "* (Made out of plastic.)&&* (A rarity nowadays.)"
		break
	}

	if onlyUse = 1 {return !_h ? hp : taste}
	if onlyUse = 2 {return at}
	if onlyUse = 3 {return df}
	if onlyUse = 4 {return tr(txt[1])}
	
	u = dial_create()
	u.m = ["* If you're reading&&  this, I have messed up&&  somehow."]
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
				var _e = ar_contains(_f,cur_it)

				audio_play(swallow,,,_e)
				var snd = {_s: sfx}
				var sp = method(snd,function() {return audio_play(_s)})
				call_later(_e ? 10 : 1,time_source_units_frames,sp)

				switch it_type {
					case 0:
						var hh = global.hp[0,dw]
						global.hp[0,dw] += hp * !_h
						txt[0] += "&&"

						var res = $"recov1_{str_l(global.soul_name)}"

						if hh != global.hp[0,dw] {txt[0] += (hh + hp < global.maxhp[0,dw]) ? tr("recov0",hp) : ((tr(res) != res) ? tr(res) : tr("recov1"))}
						global.hp[0,dw] = clamp(global.hp[0,dw],0,global.maxhp[0,dw])
						u.delete_post = 1
					break
					
					case 2:
					case 1:
						var sw = it_type
						var s = (sw = 2) ? global.arm[0,dw] : global.wep[0,dw]

						if !(s = "" or s = "None") {
							if !swap_prevent(dw_check()) {
								u.swap_post = it_type
								u.to_swap = cur_it
							}
							else {
								u.delete_post = 1
								u.m[1] = tr($"hideIt{itPr}",tr(s))
								if sw = 1 {global.wep[0,dw] = cur_it}
								else {global.arm[0,dw] = cur_it}
							}
						}
						else {
							u.delete_post = 1
							if sw = 1 {global.wep[0,dw] = cur_it}
							else {global.arm[0,dw] = cur_it}
						}

						if sw = 1 {global.wep_b[0,dw] = at}
						else {global.arm_b[0,dw] = df}
					break
				}
			break
		#endregion
		
		#region INFO ITEM
			case 1:
				var ef = [hp,at,df]
				var it = $"itDesc_{it_type}"

				if _h and it_type != 1 {it = "itDesc_3"}
				
				txt[1] = $"{tr(it,tr(cur_it),ef[it_type],tr(taste))}&&{txt[1]}"
			break
		#endregion

		#region DROP ITEM
			case 2:
				var throw_message
				
				for (var i = 0; i < 18;i++) {
					throw_message[i] = tr("throw_4",tr(cur_it))
					for (var o = 0; o < 4;o++) {throw_message[o] = tr($"throw_{o}",tr(cur_it))}
				}

				txt[2] = throw_message[rnd(round(18))]

				u.delete_post = 1
			break
		#endregion
	}
	
	u.m[0] = tr(txt[use])
}

function swap_prevent(dw = 0){
	var swap,cc
	swap = 0
	cc = 0

	var wep = [""]
	var arm = [""]
	
	if ar_contains(wep,global.wep[cc,dw]) {swap = 1}
	if ar_contains(arm,global.arm[cc,dw]) {swap = 1}

	return swap
}

function item_amt(dw = -1) {
	var amt = 0
	if dw = -1 {dw = dw_check()}
	
	for (var i = 0;i < 8;i++) {
		if global.item[i,3 * dw] != "" {amt = i + 1}
	}
	return amt
}

function add_item(name = "Toy Knife",it = item_amt()) {
	if item_amt() < 8 {global.item[it,3 * dw_check()] = name}
}

function remove_item(it = ((item_amt() - 1) * (item_amt() > 0)),name = "",dw = 0){
	if name = "" {global.item[it,3 * dw] = ""}
	else {
		if global.item[it,3 * dw] = name {global.item[it,3 * dw] = ""}
	}
}