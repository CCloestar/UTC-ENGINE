layercode()

global.inBattle = 0
global.bstory = 0

c = 0
f = 0
w = 0
_dep = 1
_vol = 0
_v = 0

r = 0
rt = 0
rsp = 0

inMenu = 0
curMenu = 0
cur_use = -1

for (var i = 0;i < 3;i++) {can[i] = 1}

curIt = 0
curCall = 0
delay = 0
dance = 0

<<<<<<< HEAD
dw = dw_check()
draw_spr_c()
=======
load_d_dw()
chara_spr()
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

step = 0
r_step = 0
rKills = 20

for (var i = 0;i < 5;i++) {
	enc[i] = 0
	enc_timer[i] = 0
}

gim[0] = 0

h_x = 0
h_y = 0

h_xx = 0
h_yy = 0

if !i_exists(o_camera) {i_create(x + 10,y + 20,,o_camera)}

if !(global.debug and !global.fplay) {
	x = global.X
	y = global.Y
	f = global.F
}

if global.next_play {
	music_play(global.m_name[2])
<<<<<<< HEAD
	global.m_name[2] = ""
=======
	global.m_name[2] = "no_sound"
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	global.next_play = 0
}

if global.battled {
<<<<<<< HEAD
	music_vol(,0)
=======
	music_set_volume(,0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	music_resume()
	_vol = 1
}

if global.fplay {fade(1)}

check_follow()

image_speed = 0
image_index = 0