<<<<<<< HEAD
al[0] -= al[1]
draw_rec(-2,-2,642,482,,col,al[0])
if al[0] <= 0 {destroy()}
=======
image_alpha -= alphaValue

draw_set_alpha(image_alpha)
draw_set_color(image_blend)
draw_rectangle(-2,-2,642,482,0)
draw_set_alpha(1)

if image_alpha <= 0 {destroy()}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
