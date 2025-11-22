function random_twice(range1 = 0,range2 = range1){
	return random_range(choose(random_range(range1,range2),random_range(range1,range2)),choose(random_range(range1,range2),random_range(range1,range2)))
}