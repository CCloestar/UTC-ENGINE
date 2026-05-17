#macro lay_exists layer_exists
#macro lay_depth layer_depth

#macro lay_id layer_get_id
#macro lay_name layer_get_name

#macro lay_x layer_x
#macro lay_y layer_y

function layercode(){
	var lays = layer_get_all()
	var u = 1
	
	for (var i = 0;i < arlen(lays);i++) {
		var l = lays[i]
		var _ln = lay_name(l)
		
		if _ln != "" {
			if strcopy(_ln,1,3) = "up_" {
				var p = ""

				for (var o = strlen(_ln);o > 0;o--) {
					var pp = strchr(_ln,o)

					if strpos(pp,"0123456789") > 0 {p = pp + p}
					else {break}
				}

				p = real(p)
				
				if global.lay != p + 1 {lay_depth(_ln,-9999 - p)}
				else {lay_depth(_ln,-p)}
			}
			
			if strcopy(_ln,1,4) = "top_" {lay_depth(_ln,-12800)}
		}
	}
}

function mask_lay(spr = sprite_index,dep = 0) {
	if event_type = ev_create {
		lay = all
		yoffset = 0
	}
	else {
		var lays = layer_get_all()

		var l = layer
		var _ln = ""
		if lay_exists(l) {_ln = lay_name(l)}
		var _l = 1
		
		if _ln != "" {
			var no_l = ["up_","top_","bg_"]
				
			for (var o = 0;o < arlen(no_l);o++) {
				if strcopy(_ln,1,strlen(no_l[o])) = no_l[o] {_l = 0}
			}
		}

		if _l {
			if lay = global.lay or lay = all {
				mask_index = spr
				if dep {depth = (1 - ((y * 10) + (sprite_height * 10)) + yoffset * 10)}
			}
			else {
				mask_index = no_spr
				if dep and lay > -1 {depth = (1000 - ((y * 10) + (sprite_height * 10)) + yoffset * 10)}
			}
		}
	}
}

function parallax(lay = "parallax",xx = 0,yy = 0,i = 1){
	if lay_exists(lay) {
		lay_x(lay, view_x(view_camera[0]) * xx * i)
		lay_y(lay, view_y(view_camera[0]) * yy * i)
	}
}