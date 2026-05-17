function add_item(name = "Toy Knife",it = item_amt(dw_check())) {
	if item_amt(dw_check()) < 8 {global.item[it,3 * dw_check()] = name}
}