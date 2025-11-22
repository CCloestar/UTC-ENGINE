self.surf = -1
self.surf_spr = -1

_id = global.enIds
pos = global.enPos

dead = 0
d_part = 0

_hurt = 0
shakeTimer = 0
shaketim = 0
shaking = 0
shaker = 0
sha[0] = 0
sha[1] = 0
dmg = 0

spare = 0
iRun = 0

scene = 0

name = "Enemy"
gold = 1
ex_g = 0
def = 10
xp = 0
maxhp = 1
hp = 1
showhp = 1
desc = "* " + name + " - ATK 1 DEF 1}* SUPER COOL AND AWESOME ENEMY}* it ~rWILL ~whurt you."
heard = -1
a[0,0] = "CoolAct"
a[0,1] = 0
a[0,2] = c_white
at[0] = "coolattackfortest_at_0"
attacked = 0

load_enemy()

hp = maxhp

var l = array_length(a)

for (var i = l;i < l + fl_max();i++) {
	var p = (i - l) + 1
	
	a[i,0] = text(global.name[p] + "Act")
	a[i,1] = 0
	a[i,2] = global.color[p]
}

for (var o = 0;o < 9;o++) {
	timer[o] = 0	
	trigger[o] = 0
}

function load_enemy(){
	var b = battle_globals
	
	#region DEFAULT SETUPS
		hurtspr = sprite_index
		hurtfr = 0
		sparespr = sprite_index
		sparefr = 0
		deadspr = sprite_index
		deadfr = 0
		idlespr = sprite_index
		idlefr = 1
		hurtsnd = en_hurt_0
		shake_return = 15
		v_speed = 2
		v_speed_ex = 0
		can_at = 1
		shakef = 8
		wide_dust = 1
		var defaultsprs = 1
		var defaultactcolors = 1
	#endregion
	
	switch _id {
		case 0:
		break
	}

	if defaultsprs {
		image_index = 1
		hurtspr = sprite_index
		sparespr = sprite_index
		deadspr = sprite_index
		idlespr = sprite_index
	}

	if defaultactcolors {
		for (var i = 0;i < array_length(a);i++) {a[i,2] = c_white}
	}

	image_xscale = 2
	image_yscale = 2
	xstart = x
	ystart = y
	for (var i = 0;i < array_length(a);i++) {a[i,1] = 0}
}