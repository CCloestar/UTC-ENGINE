var mus = ""
var ww = room_width
var hh = room_height

draw_rec(-2,-2,ww,hh,,#C08226)

if spr_exists(sprite_index) {draw_spr(,p)}
draw_rec(x - 1,y - 1,x + sprite_width + 1,y + sprite_height + 1,,f_col,f_alp)

if z_pressed() {skip = 1}

var t
t[0] = 0

if skip {
	s_alp += 0.05
	
	if s_alp >= 1.25 {
		music_stop()
		room_goto(rm_title)
	}
	
	destroy(a)
}

draw_rec(-2,-2,ww,hh,,c_black,s_alp)

if music_is_playing() {
	m = music_pos(,-1)
	music_vol(,1 - s_alp)

	if !skip {
		//DRAW YOUR STORY MOMENTS HERE, YOU'RE FREE!
	}
}

draw_col(c_black)
draw_rec(-2,-2,ww,30)
draw_rec(-2,-2,60,hh)
draw_rec(-2,138,ww,hh)
draw_rec(260,-2,ww,hh)

if in_debug() {
	var nt = cur_t
	if nt > arlen(t) - 1 {nt = arlen(t) - 1}

	if l_pressed() {
		if cur_t {
			m = t[nt - 1]
			music_pos(,t[nt - 1])
		}
		else {
			m = 0
			music_pos(,0)
		}
	}
	if r_pressed() {music_pos(,t[nt])}

	draw_col(c_white)
	draw_font(4)
	draw_txt(61,18,$"SCENE {cur_t} TIME {m} NEXT {t[nt]} TIMER {timer}",1)
}