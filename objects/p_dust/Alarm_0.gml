friction = 0.8
<<<<<<< HEAD
direction = rnd(36)
=======
direction = random(36)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

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