image_xscale = 2
image_yscale = 2
x = round(x)
y = round(y)

d = 1

_xx = 0
_yy = 0
x_sep = 16
y_sep = 36
space_sep = "D"
japsep = 1

snd = dial_main
vol = 1
pit = 1
fnt = 0

sp = 1
cur_sp = 0

m[0] = "* error."
cur_m = 0
next_m = 0
length = 0
last_m = -1

preset = 0
reset = 0
spec = 0

for (var i = 0;i < 64;i++) {
	c[i] = ""
	m_ef[i] = 0
	e[i] = 1
	mo[i] = t_m_main
	mo_f[i] = 0
}

jump_st = 6
rand_st = 1

d_col = c_white
skip = 1
play = 1
freeze = 1
finish = 1
auto = 0

delete_post = 0
swap_post = 0
call_post = 0
to_swap = ""

bubble = 0
bx = x
by = y

him = 0

for (var ii = 0;ii < 10;ii++) {
	timer[ii] = 0
	
	p_trigger[ii] = 0
	p_timer[ii] = 0
	amp[ii] = 0
}

speak = -1

tenbop = 0

draw = 1

talk = 0
talkfr = 0
ttalk = 0

load_d_dw()
him_siner = 0
halp = 1

for (var i = 0; i < 640;i++) {jumpy[i] = 0}

if freeze {char_stop()}