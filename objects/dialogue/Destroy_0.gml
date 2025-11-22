talk = 0
talkfr = 0
ttalk = 0

if play {char_free()}

var ob = o_mainchara

if i_exists(battle_globals) {ob = battle_globals}

if delete_post {remove_item(ob.curIt,,dw)}

switch swap_post {
	case 1:
		global.item[ob.curIt,3 * dw] = global.wep[0,dw]
		global.wep[0,dw] = to_swap
	break
	
	case 2:
		global.item[ob.curIt,3 * dw] = global.arm[0,dw]
		global.arm[0,dw] = to_swap
	break
}

if call_post {cell_dialogue()}