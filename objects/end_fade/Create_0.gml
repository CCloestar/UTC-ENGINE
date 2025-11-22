alphaValue = 0.08
image_alpha = 0
color = c_black
musicFadeOut = 1
depth = -9000
sndplay = no_sound
nmus = global.m_name[2]
forcemus = 0
p = global.pitch
audio_play(sndplay)

if !global.inBattle and i_exists(o_mainchara) {char_stop()}