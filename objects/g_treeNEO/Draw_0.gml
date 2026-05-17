yoffset = 5
mask_lay(,1)
if !dark {draw_self()}
draw_hitbox()

t++

f += (t % 6 == 0) / (2 + global.simpleVFX)
if f > 3 {f = 0}

var l = [
	#FFE600,
	#E56E00,
	#8A0003,
	#E56E00
]

if _fr {draw_spr(,1,,,,,l[round(f)])}