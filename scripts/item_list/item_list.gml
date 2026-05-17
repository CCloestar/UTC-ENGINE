function item_list() {
	can[0] = 1
	can[2] = 1
	
	switch global.item[curIt,3 * dw] {
		case "Not Toy Knife": //for testing
			can[0] = 0
			can[2] = 0
		break
	}
}