talk = 0
talkfr = 0
ttalk = 0

if play {char_free()}

var ob = i_exists(battle_globals) ? battle_globals : o_mainchara
if delete_post {remove_item(ob.curIt,,dw)}
if swap_post {global.item[ob.curIt,3 * dw] = (swap_post = 2) ? global.arm[0,dw] : global.wep[0,dw]}

switch swap_post {
	case 1:
		global.wep[0,dw] = to_swap
	break

	case 2:
		global.arm[0,dw] = to_swap
	break
}

if call_post {cell_dial()}
dialsm_destroy()