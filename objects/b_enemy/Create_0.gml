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
sha = [0,0]
dmg = 0

spare = 0
iRun = 0

scene = 0

name = ["Enemy",""]
gold = 1
ex_g = 0
def = 10
xp = 0
maxhp = 1
hp = 1
showhp = 1
desc = $"* {name[0]} - ATK 1 DEF 1&&* SUPER COOL AND AWESOME ENEMY&&* it ~RWILL ~Whurt you."
heard = -1
a = [["CoolAct",0,c_white]]
at = ["coolattackfortest_at_0"]
attacked = 0

self.part = []
self.bb = dialogue

load_enemy()

hp = maxhp

var l = arlen(a)

for (var i = l;i < l + fl_max();i++) {
	var p = (i - l) + 1
	
	a[i,0] = tr($"{global.name[p]}Act")
	a[i,1] = 0
	a[i,2] = global.color[p]
}

timers_create(9)