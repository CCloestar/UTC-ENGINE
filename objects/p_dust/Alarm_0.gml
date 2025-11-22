friction = 0.8
direction = random(36)

if ws < 0.75 {direction = 180}
if ws > 1.25 {direction = 0}

if hs > 1.25 {
	if ws > 1.25 {direction = 45}
	else {
		if ws > 0.75 {direction = 90}
		if ws < 0.75 {direction = 135}
	}
}

if hs < 0.75 {
	if ws > 1.25 {direction = 315}
	else {
		if ws > 0.75 {direction = 270}
		if ws < 0.75 {direction = 235}
	}
}

direction *= -1
speed = 8