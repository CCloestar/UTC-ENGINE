#region SETUP
	global.inBattle = 1
	global.battled = 1
	i_create(0,0,depth + 1,board)
	i_create(40,446,globals.depth - 1,heart)
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
btxt = "* Battle Error Text! Something &&  went REALLY wrong!"

nam = ""
fight_xx = 100

var r1 = 1
var r2 = 3
var randomer = irandom_range(r1,r2)

killer = 0

music_stop(0)

switch global.bstory {
	default:
		for (var i = 0;i < 3;i++) {enId[i] = irandom_range(r1,r2)}
		music_play("mus_battle1",,1,,,0)
	break
	
	case -9:
		scene = -9
		curBt = -2
		killer = 1

		global.route = 2
		area_pitch()
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
}
	
function intro_txt(){
	btxt = ""

	var txt = ""
	var i = 0
	
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
}