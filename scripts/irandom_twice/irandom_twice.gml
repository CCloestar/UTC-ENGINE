function irandom_twice(range1 = 0,range2 = range1){
	return irandom_range(choose(irandom_range(range1,range2),irandom_range(range1,range2)),choose(irandom_range(range1,range2),irandom_range(range1,range2)))
}