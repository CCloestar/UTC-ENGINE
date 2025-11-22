function box_check(){
	for (var i = 0;i < 10;i++) {
		if global.box[i,dw_check()] = "" {
			for (var o = i;o < 10;o++) {global.box[o,dw_check()] = global.box[o + 1,dw_check()]} 		
		}
	}
}