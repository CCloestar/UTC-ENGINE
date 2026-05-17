<<<<<<< HEAD
al = [0,0.08]
col = c_black
depth = -9000
sndplay = -1
=======
alphaValue = 0.08
image_alpha = 0
color = c_black
musicFadeOut = 1
depth = -9000
sndplay = no_sound
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
nmus = global.m_name[2]
forcemus = 0
p = global.pitch
audio_play(sndplay)

<<<<<<< HEAD
if !global.inBattle {char_stop()}
=======
if !global.inBattle and i_exists(o_mainchara) {char_stop()}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
