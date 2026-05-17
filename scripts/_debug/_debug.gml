#macro print show_debug_message
function in_debug() {return (global.debug and display.d)}

function reload_memory() {
	if i_exists(display) {display.r_m = 1}
}