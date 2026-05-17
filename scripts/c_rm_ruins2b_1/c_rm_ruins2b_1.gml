function c_rm_ruins2b_1(){
	var _c = o_mainchara
	var _l = (global.story[4] = 1.1)
	
	mask_lay(toriel_mask,1)
	
	if global.story[5] = 0.1 {end_cuts(5)}

	if global.story[4] != 2 {
		if !global.story[4] {
			sprite_index = tori_think
			image_speed = 0

			if dial_exists() and dialogue.speak = 0 {image_index = a.talkfr}
			if fading() {image_index = 2}
		}
		else {
			switch trigger[0] {
				case 0:
					o_spikes.trigger = 1
					destroy(r2b_tori)
					destroy(bint)
				
					sprite_index = tori_tada
					image_speed = 0
					x = 340
					y = 114

					a = dial_create()
					for (var i = 0;i < 4;i++) {
						a.c[i] = "Toriel"
						a.m[i] = tr($"tori_14_{i}")
					}
					a.e = [49,2,4,1]
					a.mo = [t_m_up3,t_m_up2,t_m_up4,t_m_main]
					
					if _l {
						for (var i = 0;i < 8;i++) {
							a.c[i] = "Toriel"
							a.m[i] = tr($"tori_14B_{i - 1}")
							
							if !i {a.m[0] = tr("tori_14_0")}
							if i = 7 {a.m[7] = tr("tori_14_3")}
						}
						
						a.e[2] = 5
						a.e[3] = 5
						a.e[4] = 3
						a.e[5] = 2
						a.e[6] = 55
						a.mo[2] = t_m_down1
						a.mo[3] = t_m_down1
						a.mo[4] = t_m_up3
						a.mo[6] = t_m_up2
					}

					cam_pos()
					
					trigger[0] = 1
				break
				
				case 1:
					if dial_exists() and global.story[4] != 1.2 {
						a.pit = 1
						if !a.cur_m {a.pit = 1.1}
						if a.cur_m and a.cur_m < 3 and image_index = 0 {image_index = 1}
						if a.cur_m = 2 and a.length >= 55 {
							a.e[2] = 2
							a.mo[2] = t_m_up2
						}
						
						if a.cur_m > 2 {
							y = 110
							x = 348
							sprite_index = toriel_0_t
							image_index = a.talkfr
						}
						
						if _l {
							a.auto = 0

							switch a.cur_m {
								case 1:
									if a.length >= strlen(a.m[1]) - 3 {
										image_index = 2
										a.auto = 1
										a.sp = 2
										a.mo[1] = t_m_up1
									}
								break
								
								case 2:
									a.sp = 2
									a.pit = 0.99
								break

								case 3:
									a.pit = 1
									a.sp = 1
									sprite_index = tori_worry_2
									image_index = 0
								break
							}
						}
					}
					else {
						end_cuts(4,1.2)
						
						sprite_index = toriel_3
						image_speed = 0.2
						x += 3

						if x >= room_width {
							end_cuts(4,2)
							destroy()
						}
					}
				break
			}
		}
	}
	else {
		o_spikes.trigger = 1
		destroy(r2b_tori)
		destroy(bint)
		destroy()
	}
}