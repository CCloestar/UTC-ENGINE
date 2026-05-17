sh_time = 2
sh_f = 2
cont = 0

c = view_current
<<<<<<< HEAD
x = view_x(c)
y = view_y(c)
=======
x = camera_get_view_x(c)
y = camera_get_view_y(c)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

camera_set_view_target(c,noone)
if global.simpleVFX {destroy()}

alarm[0] = 1