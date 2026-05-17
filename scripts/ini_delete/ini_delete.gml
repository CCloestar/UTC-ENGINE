function ini_delete(section,key) {
	if ini_key_exists(section,key) {return ini_key_delete(section,key)}
}