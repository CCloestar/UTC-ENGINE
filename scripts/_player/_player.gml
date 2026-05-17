function char_pos(_x = x,_y = y){
	var c = o_mainchara

	c.x = _x
	c.y = _y
}
	
function char_stop(halt = 1,fl = i_number(o_follower)){
	with (o_mainchara) {
		c = 1
		r = 0
		
		if halt and f > -1 {
			w = 0
			image_speed = 0
			image_index = 0
		}
		
		inMenu = 0
	}
	
	var _f = o_follower

	if fl and i_exists(_f) {
		with (_f) {
			c = 1
			r = 2
			
			image_speed = 0
			image_index = 0
		}
	}
}

function char_free(){
	var _c = o_mainchara

	if i_exists(_c) {
		with (_c) {
			inMenu = 0
			c = 0
			t = 0
			d = 0
		}
	}
	
	if i_exists(o_follower) {o_follower.c = 0}
}