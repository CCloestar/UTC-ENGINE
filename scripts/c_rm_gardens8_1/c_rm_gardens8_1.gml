function c_rm_gardens8_1(){
	var _c = o_mainchara
	
	mask_lay(no_spr,0)
	depth = g_treeNEO.depth - 10
	
	switch trigger[0] {
		case 0:
			if sprite_index != ant_0 {
				sprite_index = ant_0
				image_speed = 0
			}
		break
	}
}