var c,f,sp,xx,yy

c = o_mainchara
f = c.f
sp = 3 + c.rsp

xx = x + sprite_width
yy = y + sprite_height

var _x = 1
var _y = 0

if side = 1 {
	_x = 0
	_y = 1
}

if side = 2 {_y = 1}

solids = [
	wall,
	wall_pushables,
	o_ramp_ld,
	o_ramp_lu,
	o_ramp_rd,
	o_ramp_ru,
	o_save,
	o_sign,
	o_pickup,
	o_box,
	o_npc,
	s_parent,
	o_spikes
]

var x1 = x
var y1 = y + 7
var x2 = x + sprite_width
var y2 = y + sprite_height

if collision_rectangle(x1,y1,x2,y2,c,0,1) {
	var x_,y_

	x_ = 0
	y_ = 0
	
	var _sp = sp + 1

	if !place_meeting(x + sign(1),y + sign(1),solids) {
		if _x {
			if f = 1 and l_hold() {
				if !place_meeting(x - _sp,y,solids) {x -= sp}
				else {
					while (!place_meeting(x - x_ - 1,y,solids)) {
						x_++
						x -= x_
						x_ = 0
					}
				}
			}
	
			if f = 3 and r_hold() {
				if !place_meeting(x + _sp,y,solids) {x += sp}
				else {
					while (!place_meeting(x + x_ + 2,y,solids)) {
						x_++
						x += x_
						x_ = 0
					}
				}
			}
		}
	
		if _y {
			if f = 2 and u_hold() {
				if !place_meeting(x,y - _sp,solids) {y -= sp}
				else {
					while (!place_meeting(x,y - y_ - 1,solids)) {
						y_++
						y -= y_
						y_ = 0
					}
				}
			}
	
			if f = 0 and d_hold() {
				if !place_meeting(x,y + _sp,solids) {y += sp}
				else {
					while (!place_meeting(x,y + y_ + 2,solids)) {
						y_++
						y += y_
						y_ = 0
					}
				}
			}
		}
	}

	if abs(x - xprevious) > 0 or abs(y - yprevious) > 0 {c.w = 1}
}

mask_lay(,1)
draw_area()
draw_hitbox()