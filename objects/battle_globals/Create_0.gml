<<<<<<< HEAD
var _c = "config.ini"

=======
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
#region SETUP
	global.inBattle = 1
	global.battled = 1
	i_create(0,0,depth + 1,board)
	i_create(40,446,globals.depth - 1,heart)
<<<<<<< HEAD

	butt = [
		i_create(32,432,depth + 1,fight_0),
		i_create(185,432,depth + 1,act),
		i_create(345,432,depth + 1,item),
		i_create(500,432,depth + 1,mercy)
	]
	i_create(0,0,depth + 2,bg_battle)

	fader = i_create(0,0,heart.depth + 1,start_fade)
	fader.al[1] = 0.2
#endregion

bfade = 0
dw = dw_check()
f = dialogue
=======
	butt[0] = i_create(32,432,depth + 1,fight_0)
	butt[1] = i_create(185,432,depth + 1,act)
	butt[2] = i_create(345,432,depth + 1,item)
	butt[3] = i_create(500,432,depth + 1,mercy)
	i_create(0,0,depth + 2,bg_battle)

	fader = i_create(0,0,heart.depth + 1,start_fade)
	fader.alphaValue = 0.2
#endregion

bfade = 0
load_d_dw()
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

for (var i = 0;i < 4;i++) {
	enId[i] = 0
	myBt[i] = 0
	can_select[i] = 1
	btID[i] = i

	ftimer[i] = 0
	fframe[i] = 0
	trigger[i] = 0
	timer[i] = 0
}

canRun = 1
inv = 30
lv_up = 0
tense = 0

btcol = #FF7F27
acol = c_white
curBt = 0
d = 0
curAct = 0
scene = 0
bg = 0

draw = 0
<<<<<<< HEAD
btxt = "* Battle Error Text! Something&&  went REALLY wrong!"

nam = ""
fight_xx = 100
=======
btxt = "* Battle Error Text! Something &&  went REALLY wrong!"

nam = ""
fight_xx = 100

var r1 = 1
var r2 = 3
var randomer = irandom_range(r1,r2)

>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
killer = 0

music_stop(0)

<<<<<<< HEAD
if f_exists(_c) {
	ini_open(_c)
		global.en_r = load_real("er",global.en_r,_c)
	ini_close()
}

switch global.bstory {
	default:
		var e = {
			"-1": [[0]]
		}

		var ee = e[$ $"{global.area}_[{global.curCh}]"] ?? e[$ "-1"]
		print(ee)

		enId = ee[irnd(arlen(ee) - 1)]
		print(arlen(enId))
		print(global.en_r)

		if global.en_r and arlen(enId) > global.en_r {arresize(enId,global.en_r)}
		print(enId)
		music_play("battle1",,1,,,0)
	break

=======
switch global.bstory {
	default:
		for (var i = 0;i < 3;i++) {enId[i] = irandom_range(r1,r2)}
		music_play("mus_battle1",,1,,,0)
	break
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	case -9:
		scene = -9
		curBt = -2
		killer = 1

		global.route = 2
		area_pitch()
<<<<<<< HEAD
		music_play("toomuch",,1)
	break
}

if f_exists(_c) {
	ini_open(_c)
		for (var i = 0;i < arlen(enId);i++) {enId[i] = load_real($"e{i}",enId[i],_c)}
	ini_close()
}

enAmt = arlen(enId)
=======
		music_play("mus_toomuch",,1)
	break

	case 1:
		global.enAmt = 1
		enId[0] = 0
		canRun = 0
		bg = -1
		music_play("mus_prebattle_cyan",,1,,,0)
	break
	
	case 2:
		global.enAmt = choose(2,3)
		enId[0] = 0
		enId[1] = irandom_range(1,3)
		enId[2] = irandom_range(1,3)
		music_play("mus_battle1_cyan",,1,,,0)
	break
}

if file_exists("config.ini") {
	ini_open("config.ini")
		global.enAmt = ini_read_real("config.ini","ea",global.enAmt)
		for (var e = 0;e < 3;e++) {enId[e] = ini_read_real("config.ini","e" + string(e),enId[e])}
	ini_close()
}

>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
enemy_pos()

b_turn = 0
b_gold = 0
b_xp = 0

p = 0
curIt = 0
can_use = 1
can_drop = 1

boardId = 0

global.enIds = -1
global.enPos = -1
<<<<<<< HEAD

if !killer {
	for (var o = 0; o < enAmt;o++) {
		global.enIds = enId[o]
		global.enPos = o
		en[o] = i_create(xpos[o],0,,b_enemy)
		att[o] = i_create(8,8,depth - 4,b_at_parent)
	}

	remain = enAmt
	intro_txt()
}

function enemy_pos(){
	var ea = enAmt

	var _x = {
		"0_[1]": [(210 - (95 * (ea > 1))) - (97 * (ea = 3)),317 - (99 * (ea = 3)),420]
	}

	xpos = _x[$ $"{global.bstory}_[{global.curCh}]"] ?? _x[$ "0_[1]"]
=======
battleStyle = 0

if !killer {
	for (var o = 0; o < global.enAmt;o++) {
		global.enIds = enId[o]
		global.enPos = o
		en[o] = i_create(xpos[o],0,,b_enemy)
		bb[o] = dialogue
		att[o] = i_create(8,8,depth - 4,b_at_parent)
	}
	
	remain = global.enAmt

	intro_txt()
}
	
function enemy_pos(){
	xpos[0] = 210
	xpos[1] = 317
	xpos[2] = 420
	
	switch global.curCh {
		default:
			switch global.bstory {
				case 0:
				break
			}
		break
	}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}
	
function intro_txt(){
	btxt = ""

	var txt = ""
	var i = 0
<<<<<<< HEAD

	repeat (enAmt) {
		btxt += $"{en[i].name[0]}&&"

		var _id = en[i].name[1] != $"en{en[i]._id}" ? en[i].name[1] : $"{en[i]._id}"

		if !i {txt = $"{_id}"}
		else {txt += $"_{_id}"}

		i++
	}

	txt += $"_[{global.curCh}]"
	print(txt)

	var _t = {
		"0_[1]": "* Epic Battle test!"
	}

	btxt = (_t[$ txt] = undefined) ? $"* Battle error text!&&* {txt} is UNDEFINED!&&* Something went REALLY wrong!" : _t[$ txt]
}

function area_pitch(){
	var _p = {
		"1_[1]": 0.25	
	}

	var gp = _p[$ $"{global.area}_[{global.curCh}]"]
	global.pitch = (gp = undefined) ? 1 : gp
=======
	
	repeat (global.enAmt) {
		btxt += en[i].name + "&&"
		
		if !i {txt = string(enId[i])}
		else {txt += "_" + string(enId[i])}

		i++
	}
	
	show_debug_message(txt)
	
	switch txt {
		default:
		break
	}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}