function chara_spr(n = global.name[0]){
	var fspr
	
	for (var i = 0;i < 4;i++) {
		for (var o = 0;o < 3;o++) {
			var sprite,dsprite,ssprite,ch
			
			ch = string_lower(n) + "_" + string(i)
			
			sprite[0] = ch
			sprite[1] = ch + "_r"
			sprite[2] = ch + "_t"

			if !sprite_exists(asset_get_index(sprite[0])) {sprite[0] = "null_" + string(i)}

			if o {
				if !sprite_exists(asset_get_index(sprite[o])) {sprite[o] = sprite[0]}
			}

			dsprite[o] = "d_" + sprite[o]
			ssprite[o] = sprite[o] + "_" + string(global.skin)

			sprite[o] = asset_get_index(sprite[o])

			if global.world and sprite_exists(asset_get_index(dsprite[o])) {sprite[o] = asset_get_index(dsprite[o])}
			if global.skin and sprite_exists(asset_get_index(ssprite[o])) {sprite[o] = asset_get_index(ssprite[o])}
		
			fspr[i,o] = sprite[o]
		}
	}

	if f > -1 {sprite_index = fspr[f,r]}
}