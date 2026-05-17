function item_amt(dark = 0) {
	amt = 0

	for (var i = 0;i < 8;i++) {
		if global.item[i,3 * dark] != "" {amt = i + 1}
	}

	return amt
}