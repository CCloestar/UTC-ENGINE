mask_lay(,1)
dw = dw_check()

trigger = 0
op = 0
p = 0

function box_amt(dw = dw_check()) {
	var amt = 0

	for (var i = 0;i < 10;i++) {
		if global.box[i,dw] != "" {amt = i + 1}
	}

	return amt
}

function box_check(){
	for (var i = 0;i < 10;i++) {
		if global.box[i,dw] = "" {
			for (var o = i;o < 10;o++) {global.box[o,dw] = global.box[o + 1,dw]} 		
		}
	}
}