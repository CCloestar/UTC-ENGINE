function remove_item(it = ((item_amt() - 1) * (item_amt() > 0)),name = "",dw = 0){
	if name = "" {global.item[it,3 * dw] = ""}
	else {
		if global.item[it,3 * dw] = name {global.item[it,3 * dw] = ""}
	}
}