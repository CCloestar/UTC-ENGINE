function box_amt(dark = 0){
	b_amt = 0
	
	for (var i = 0;i < 10;i++) {
		if global.box[i,dark] != "" {b_amt = i + 1}
	}
	
	return b_amt
}