# Goggles
init() {
	print('### Googgles System started.')
}

func toggle() {
	if (hologram::('goggles/is_on')) {
		hologram::('Turn the goggles off')
		print('Goggles turned off.')
	} else {
		hologram::('Turn the goggles on')
		print('Goggles turned on.')
	}
}

func display(info:str) { # I'm, again, too lazy to think on this one.
	hologram::('Display "{}" on the screen'.format(info))
	print('Displayed information on the screen ("{}").'.format(info))
}