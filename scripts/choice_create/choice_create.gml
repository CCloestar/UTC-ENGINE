function choice_create(c_id = 0,dep = "D",d = dialogue){
	if dial_exists() {
		if dep = "D" {dep = dialogue.depth - 5}
		
		_choice = i_create(,,dep,choicer)
		_choice._id = c_id
		_choice.d = d
	 
		return _choice
	}
}