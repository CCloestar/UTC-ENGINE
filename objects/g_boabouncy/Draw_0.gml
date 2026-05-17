draw_sprite(gb_0,0,x + 1,y + 11)

var c = [
	c_black,
	#4B000D,
	#8A0003,
	#FFE600,
]

draw_rec(x + 7,(y + 4) + timer[3],(x + 9) + 23,((y + 6) + timer[3]) + 8,,c[floor(timer[0] / 33)])
draw_sprite(gb_1,floor(timer[0] / 100),x - 1,(y - 1) + timer[3])