var b = battle_globals

draw_set_color(c_black)
draw_rectangle(-10,-10,650,490,0)

switch b.bg {
	case 0:
		draw_set_color(#22B14C)
		if b.dw {draw_set_color(#420042)}
		
		draw_rectangle(16,10,114,125,1)
		draw_rectangle(16,127,114,243,1)
		
		draw_rectangle(116,10,217,125,1)
		draw_rectangle(116,127,217,243,1)
		
		draw_rectangle(219,10,316,125,1)
		draw_rectangle(219,127,316,243,1)
		
		draw_rectangle(318,10,419,125,1)
		draw_rectangle(318,127,419,243,1)
		
		draw_rectangle(421,10,522,125,1)
		draw_rectangle(421,127,522,243,1)
		
		draw_rectangle(524,10,622,125,1)
		draw_rectangle(524,127,622,243,1)
	break
}