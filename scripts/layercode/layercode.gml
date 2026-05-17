function layercode(){	
	for (var i = 0;i < 9;i++) {
		var dep
		dep[0] = "uptiles_" + string(i)
		dep[1] = "upinstances_" + string(i)
		dep[2] = "upassets_" + string(i)
		
		for (var o = 0;o < 3;o++) {
			if layer_exists(dep[o]) {
				if global.lay != i + 1 {layer_depth(dep[o],-9999 - i)}
				else {layer_depth(dep[o],0 - i)}
			}
		}
	}
	
	var udeps
	udeps[0] = "uppertiles"
	udeps[1] = "upperinstances"
	udeps[2] = "upperassets"

	for (var i = 0;i < 3;i++) {
		if layer_exists(udeps[i]) {layer_depth(udeps[i],-10020)}
	}
}