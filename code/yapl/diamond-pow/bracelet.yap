# Bracelet and Gloves
# This bracelet is only used to "spawn" the gloves. They don't do anything more than that for now.

init() {
	print('### Bracelet & Gloves System started.')	
}

func spawn_gloves(side:int=0) {
	if (side == 0) {
		hologram::('Enable both gloves.')
		print('Both gloves enabled.')
	} elif (side == -1) {
		hologram::('Enable left glove.')
		print('Left glove enabled.')
	} elif (side == 1) {
		hologram::('Enable right glove.')
		print('Right glove enabled.')
	} else {
		print('Invalid glove value; operation cancelled.')
		break
	}
}

func rem_gloves(side:int=0) {
	if (side == 0) {
		hologram::('Disable both gloves.')
		print('Both gloves disabled.')
	} elif (side == -1) {
		hologram::('Disable left glove.')
		print('Left glove disabled.')
	} elif (side == 1) {
		hologram::('Disable right glove.')
		print('Right glove disabled.')
	} else {
		print('Invalid glove value; operation cancelled.')
	}	
}