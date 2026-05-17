function item_check(){
	var n = 3 * dw_check()
	
	for (var i = 0;i < 8;i++) {
		if global.item[i,n] = "" {
			for (var o = i;o < 8;o++) {global.item[o,n] = global.item[o + 1,n]}
		}
		
		global.item[i,n + 1] = global.item[i,n]
		global.item[i,n + 2] = global.item[i,n]

		switch global.item[i,n] {
			case "Toy Knife":
				global.item[i,n + 2] = "Knife"
			break
		}
	}
}