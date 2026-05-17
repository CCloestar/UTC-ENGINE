mask_lay(,0)

r = rnd_r(0.95,1.05)

image_speed = 0
image_index = irnd_r(0,image_number)

gravity = 0.03
vspeed = 1
hspeed = rnd_r(1, -1) * (1 + rnd(1))

audio_play(leaf,,,,,r)

tim = 20 + irnd(10)

alarm[0] = tim