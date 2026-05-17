function c_rm_hole1_1(){
	if !global.story[0] {global.story[0]++}

	var _c = o_mainchara
	var _p = o_warnobj
	var _r = (global.story[0] = 1.1)

	mask_lay(toriel_mask,1)

	if !global.story[1] {
		switch trigger[0] {
			case 0:
				if !_r {
					trigger[0] = 1
					timer[0] = 6
				}
				else {
					if !timer[0] {
						x -= 15
						y = 420
						sprite_index = toriel_2

						_c.x += 10
						timer[0] = 1
					}
					else {
						if !dial_exists() {
							y -= 3
							image_speed = 0.2
						
							if y <= 300 {
								y = 300
							
								_p = i_create(145,260,,o_warnobj)
								_p.visible = 0							
								i_move(,_p,20)

								timers_reset()
								trigger[0] = 1
							}
						}
						else {
							image_speed = 0
							image_index = 0
						}
					}
				}
			break

			case 1:
				if i_exists(_p) {
					if x = 145 and y = 260 {
						if _c.y > y {end_cuts()}
						destroy(_p)
					}
				}
				else {
					_p = 260 - (120 * timer[1])
					if abs(_p - _c.y) < 70 or _c.y <= _p {timer[1]++}

					if y > _p {
						if !dial_exists() {
							y -= 3
							image_speed = 0.2
						}
						else {
							image_speed = 0
							image_index = 0
						}

						sprite_index = toriel_2
						timer[0] = 0
					}
					else {
						timer[0]++
					
						if timer[0] < 4 {sprite_index = toriel_3}
						else {sprite_index = toriel_0}
						
						if y >= _c.y {sprite_index = toriel_2}

						image_speed = 0
						image_index = 0
					}

					if y <= 115 {
						image_alpha -= 0.2

						if image_alpha <= 0 {
							end_cuts(1)
							destroy()
						}
					}
				}
			break
		}

		if image_alpha = 1 and interacted() and !i_exists(_p) {
			a = dial_create()
			for (var i = 0;i < 2;i++) {
				a.c[i] = "Toriel"
				a.m[i] = tr($"tori_5_{i}")
			}
			
			sprite_index = toriel_2
			image_speed = 0
			image_index = 0
		}
	}
	else {destroy()}
	
	if fading() {global.story[1] = 0.1 * (_c.y < y)}
}