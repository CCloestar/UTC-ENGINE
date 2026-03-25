image_alpha -= alphaValue

draw_set_alpha(image_alpha)
draw_set_color(image_blend)
draw_rectangle(-2,-2,642,482,0)
draw_set_alpha(1)

if image_alpha <= 0 {destroy()}