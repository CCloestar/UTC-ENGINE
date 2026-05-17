function c_rm_gardens1_1(){
	if !global.story[9] {
		if o_lever.trigger and !o_spikes.trigger {
			o_spikes.trigger = 1
			audio_play(press,,,0.6)
			end_cuts(9)
		}
	}
	else {o_spikes.trigger = 1}
}