var mus = ""
var ww = room_width
var hh = room_height

draw_set_color(#C08226)
draw_rectangle(-2,-2,ww,hh,0)

if sprite_exists(sprite_index) {draw_spr(,p)}

draw_set_color(f_col)
draw_set_alpha(f_alp)
draw_rectangle(x - 1,y - 1,x + sprite_width + 1,y + sprite_height + 1,0)
draw_set_alpha(1)

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

draw_set_color(c_black)
draw_set_alpha(s_alp)
draw_rectangle(-2,-2,ww,hh,0)
draw_set_alpha(1)

if music_is_playing() {
	m = music_get_pos()
	music_set_volume(,1 - s_alp)

	if !skip {

	}
}

draw_set_color(c_black)
draw_rectangle(-2,-2,ww,30,0)
draw_rectangle(-2,-2,60,hh,0)
draw_rectangle(-2,138,ww,hh,0)
draw_rectangle(260,-2,ww,hh,0)

if global.debug {
	var nt = cur_t
	
	if nt > array_length(t) - 1 {nt = array_length(t) - 1}
	
	if l_pressed() {
		if cur_t {
			m = t[nt - 1]
			music_set_pos(,t[nt - 1])
		}
		else {
			m = 0
			music_set_pos(,0)
		}
	}

	if r_pressed() {music_set_pos(,t[nt])}
	
	draw_set_color(c_white)
	draw_font(4)
	draw_txt(61,18,"SCENE " + string(cur_t) + " TIME " + string(m) + " NEXT " + string(t[nt]) + " TIMER " + string(timer),1,1)
}