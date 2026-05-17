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
draw_rec(x + 10,y + 42,x + 11,y + 43)
draw_rec(x + 12,y + 40,x + 13,y + 41)
draw_rec(x + 42,y + 41,x + 43,y + 42)