layercode()

global.inBattle = 0
global.bstory = 0

c = 0
f = 0
w = 0

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

load_d_dw()
chara_spr()

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

vol = !global.battled

if global.next_play {
	music_play(global.m_name[2],vol)
	global.m_name[2] = "no_sound"
}

if global.battled {music_resume()}
music_set_volume(,vol)

if global.fplay {fade(1)}

check_follow()

image_speed = 0
image_index = 0