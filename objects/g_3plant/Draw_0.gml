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

draw_col(l[round(f)])
draw_rec(x + 5,y + 5,x + 6,y + 6)
draw_rec(x + 13,y + 7,x + 14,y + 8)
draw_rec(x + 5,y + 12,x + 6,y + 13)