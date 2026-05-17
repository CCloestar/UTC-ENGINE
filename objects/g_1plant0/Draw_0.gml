mask_lay(,1)
if !dark {draw_self()}

t++

f += (t % 6 == 0) / (2 + global.simpleVFX)
if f > 3 {f = 0}

var l = [
	#FFE600,
	#E56E00,
	#8A0003,
	#E56E00
]

draw_rec(x + 13,y + 7,x + 14,y + 8,,l[round(f)])