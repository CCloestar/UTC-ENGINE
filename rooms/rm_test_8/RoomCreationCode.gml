var randomeyes = irandom_range(0,27)
var randommouth = choose(d_m_down,d_m_main,d_m_neutral,d_m_static,d_m_up1,d_m_up2)

a = instance_create_depth(0,0,0,dialogue)
a.char = 1
a.last_m = 0
a.force_rectangle = 1
a.c[0] = choose(1,1.1,1.2)
a.m[0] = text("tori0-0")
a.e[0] = randomeyes
a.mo[0] = randommouth
a.can_play = 0