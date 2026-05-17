function c_rm_ruins0_1(){
	if !global.story[1] {global.story[1]++}

	var _c = o_mainchara
	var _p = o_warnobj
	var _r = (global.story[1] = 1.1)
	
	mask_lay(toriel_mask,1)
	
	if !global.story[2] {
		switch trigger[0] {
			case 0:
				if !_r {
					timer[0] = 4
					trigger[0] = 1
				}
				else {
					_c.x += 8
					x -= 8
					y = 520	

					trigger[0] = 0.1
				}
			break
			
			case 0.1:
				sprite_index = toriel_2
				image_speed = 0.2
				y -= 3

				if y <= 380 {
					_p = i_create(145,340,,o_warnobj)
					_p.visible = 0

					i_move(,_p,20)
					trigger[0] = 0.2
				}
			break

			case 0.2:
				if y <= 341 {
					y = 341
					image_index = 0
					image_speed = 0

					destroy(_p)
					if _c.y > y {end_cuts(1)}
					trigger[0] = 1
				}
			break
			
			case 1:
				_p = 340 - (105 * timer[1])
				if abs (_p - _c.y) < 70 or _c.y <= _p {timer[1]++}

				if y > _p {
					y -= 3
					sprite_index = toriel_2
					image_speed = 0.2
					timer[0] = 0
				}
				else {
					timer[0]++
					
					if timer[0] < 4 {sprite_index = toriel_3}
					else {sprite_index = toriel_0}
					
					image_speed = 0
					image_index = 0
				}
				
				if y < 235 {
					y = 235
					sprite_index = toriel_2
					image_speed = 0.2
					
					var xpos = 245 - (200 * (_c.x < 150))
					_p = i_create(xpos,135,,o_warnobj)
					_p.visible = 0
					i_move(,_p,60)

					timers_reset()
					trigger[0] = 2
				}
			break
			
			case 2:
				if i_exists(_p) {
					if y <= 135 {destroy(_p)}
				}
				else {
					if abs (135 - _c.y) > 70 {
						timer[0]++
						
						if timer[0] < 4 {
							if x > 45 {sprite_index = toriel_1}
							else {sprite_index = toriel_3}
						}
						else {sprite_index = toriel_0}
						
						image_speed = 0
						image_index = 0
					}
					else {
						switch trigger[1] {
							case 0:
								y -= 2
								sprite_index = toriel_2
								image_speed = 0.2

								if y <= 105 {
									y = 105
									trigger[1] = 1
								}
							break

							case 1:
								if x > 145 {
									sprite_index = toriel_1
									x -= 3
								}
								else {
									sprite_index = toriel_3
									x += 3
								}

								if abs(x - 145) < 4 {
									x = 145
									sprite_index = toriel_2
									image_alpha = 1.4
									trigger[1] = 2
								}
							break

							case 2:
								y -= 3
								image_alpha -= 0.2
								destroy(a)
								char_free()

								if image_alpha <= 0 {
									end_cuts(2)
									destroy()
								}
							break
						}
					}
				}
			break
		}

		if fading() and image_alpha = 1 {end_cuts(2,0.1)}
	}
	else {destroy()}
}