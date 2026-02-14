sh_time = 2
sh_f = 2
cont = 0

c = view_current
x = camera_get_view_x(c)
y = camera_get_view_y(c)

camera_set_view_target(c,noone)
if global.simpleVFX {destroy()}

alarm[0] = 1