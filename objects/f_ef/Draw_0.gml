timer++

if timer >= 10 {image_alpha -= 0.025}
if image_alpha * fight_1.image_alpha <= 0 {destroy()}
draw_rec(x,y,x + 2,y + 117,,#093724,image_alpha * fight_1.image_alpha)