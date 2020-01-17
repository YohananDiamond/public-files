# Antenna System. Uses mostly the hologram system, but can also include magic.
int sound_mode = 0 # 0 = Speakers; 1 = Headphones (only who wears the antenna can hear)

init() {
	print('### Antenna System started.')
}

func lantern(side:int=0, mode:int=0) {
	print('Lantern iteration started.')
	if (mode == 0) {
		# Toggle Mode
		if (hologram.lantern(side).('on') == false) {
			mode = -1
		} else {
			mode = 1
		}
	}
	if (mode == 1) {
		hologram.lantern(side).('on') = true
	} elif (mode == -1) {
		hologram.lantern(side).('on') = false
	} else {
		print('Invalid mode; operation cancelled')
	}
}

func sound(s:wave, volume:int=100) {
	if (s != none) {
		print('Sound emission failed, no waves to emit.')
	} else {
		hologram::('Emit sound {} with volume {}/100 on sound mode {}'.format(str(s), volume, sound_mode))
		print('Sound emission successful.')
	}
}

func receive_signal(passw:string) { # Receive signals from other machines.
	print('Allowing to receive signals with the password {}...'.format(passw))
	hologram::('Allow to receive signals and filter only the ones that has passw={};'.format(passw),
		'These signals are received in a list.')
}

func send_signal(signal:list, where:list) { # Send signal to other systems.
	print('Sending signal {} to {}...'.format(signal, where))
	if (signal == []) {
		print('There is no signal to be sent; operation cancelled.')
	} elif (where == []) {
		print('Unable to send a signal to nowhere; operation cancelled.')
		break
	} else {
		for s in signal {
			if (type(s) != bool) and (type(s) != list) and (type(s) != dict) {
				for w in where {
					if (type(w) != bool) and (type(w) != list) and (type(w) != dict) {
						hologram::('Send signal {} to {}'.format(s, w)) # This is supposed to work with every type of value, except booleans and 
						print('Signal {} sent for {}'.format(s, w))
					} else {
						print('Invalid destination ({}); operation cancelled.'.format(w))
					}
				} else {
					print('Invalid signal ({}); operation cancelled.'.format(s))
				}
			}
		}
	}
}