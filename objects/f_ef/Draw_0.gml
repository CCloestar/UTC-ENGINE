timer++

if timer >= 10 {image_alpha -= 0.025}
if image_alpha * fight_1.image_alpha <= 0 {destroy()}

draw_set_alpha(image_alpha * fight_1.image_alpha)
draw_set_color(#093724)
draw_rectangle(x,y,x + 2,y + 117,0)
draw_set_alpha(1)