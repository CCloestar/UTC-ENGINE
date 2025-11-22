var xx,yy,o_x,o_y

xx = 0
yy = 0
o_x = 0
o_y = 0

n = global.f_n[pos]

switch n {
	case "Null":
	break
}

if depth > globals.depth {depth = 1 - ((y * 10) + (sprite_height * 10)) - (yy * 10)}

chara_spr(n)
draw_area(,xx,yy)