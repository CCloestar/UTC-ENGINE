talk = 0
talkfr = 0
ttalk = 0

if play {char_free()}

<<<<<<< HEAD
var ob = i_exists(battle_globals) ? battle_globals : o_mainchara
if delete_post {remove_item(ob.curIt,,dw)}
if swap_post {global.item[ob.curIt,3 * dw] = (swap_post = 2) ? global.arm[0,dw] : global.wep[0,dw]}

switch swap_post {
	case 1:
=======
var ob = o_mainchara

if i_exists(battle_globals) {ob = battle_globals}

if delete_post {remove_item(ob.curIt,,dw)}

switch swap_post {
	case 1:
		global.item[ob.curIt,3 * dw] = global.wep[0,dw]
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		global.wep[0,dw] = to_swap
	break

	case 2:
<<<<<<< HEAD
=======
		global.item[ob.curIt,3 * dw] = global.arm[0,dw]
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		global.arm[0,dw] = to_swap
	break
}

<<<<<<< HEAD
if call_post {cell_dial()}
dialsm_destroy()
=======
if call_post {cell_dialogue()}

destroy(dialsmall)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
