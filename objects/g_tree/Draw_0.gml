mask_lay(,1)
draw_self()

ftimer++

fframe += (ftimer % 6 == 0)

if fframe > 4 {fframe = 1}

draw_sprite_ext(gtree,fframe,x,y,image_xscale,image_yscale,image_angle,image_blend,(image_alpha * fruity) * lightalpha)