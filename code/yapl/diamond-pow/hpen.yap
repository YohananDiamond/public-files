# Hologram Pen (hpen)
# It can be transformed into multiple things, for example, a sword or a blaster wand, or just be used for drawing.

init() {
	print('### Hologram Pen System started.')
	hologram::('Enable receiving power from the power slot.') # The power slot is a place on the end of the pen where a diamond or other power stone is placed to give the pen energy.
}

func log(arg, mode:str='full') { # Log something on the pen's display.
	string = str(arg)
	if (mode == 'full') { # Show the string in a full screen format, filling the entire screen.
		hologram::('Set the hpen screen text to "{}"'.format(string))
	} elif (mode == 'list') { # Show the string on a "terminal" format, with a'd
		hologram::('Add "{}" to the bottom of the hpen screen and move the other text up.'.format(string))
	} else {
		print('Invalid log mode; operation cancelled.')
	}
}

#! Touchpad Interface

func receive_touchpad_input() {
	if (hologram::('hpen/touchpad_input') != '') { # If the input is not empty
		return hologram::('hpen/touchpad_input')
	}
}

func touchpad_iterate() { # Get the touchpad input from the hpen and send it to the hologram interface, then get it back to understand if a command was executed by that input.
	list neoInput = hologram::('Interpret input "{}"'.format(receive_touchpad_input()))
	# neoInput[0] is always the command.
	# neoInput[1+] are the command args.
	if (neoInput == []) {
		break # No need to execute the function if the input is empty.
	} elif (neoInput[0] == 'change_mode') {
		if (neoInput[1] == 0) { # Default mode (pen)
			hologram::('Change hpen mode to "pen"')
			print('Hologram Pen mode changed to "pen".')
		} elif (neoInput[1] == 1) { # Wand mode (blaster wand)
			hologram::('Change hpen mode to "blaster wand"')
			print('Hologram Pen mode changed to "blaster wand" (Wand).')
		} elif (neoInput[1] == 2) { # Sword mode (elemental blade)
			hologram::('Change hpen mode to "elemental blade"')
			print('Hologram Pen mode changed to "elemental blade" (Sword).')
		} else {
			print('Change Mode: Invalid Mode; operation cancelled.')
			break
		}
	} elif (neoInput[0] == 'interact') {
		int cmode = hologram::('hpen/current_mode')
		if (cmode == 0) { # The only action of the normal pen is draw holograms.
			hologram::('hpen/draw holograms')
		} elif (cmode == 1) { # I'm extremely lazy, so I'm making something small with the blaster wand, even though it could be more detailed.
			hologram::('Absorb power from air, kinectic energy and the power slot.')
			magic::('Charge the hpen/blaster_wand/power_orb with magical power.')
			(hologram,magic)::('Combine the power of both to receive energy or use energy.') # With this energy, it's possible to create bigger and more powerful holograms, shields or shoot magical power in form of, for example, bullets, laser or fire orbs.
		} elif (cmode == 2) { # Elemental Blade, change sword material.
			(hologram,magic)::('Change sword material to one of these:',
				['diamond','sound','electrical','darkness','wind','fire'],
				'or new ones, if the power slot has a stone that makes it able to do so.')
		} else { # Imaginary situation where the current hpen mode has no special action.
			print('Interact: the current mode has no actions; operation cancelled.')
		}
	} else {
		print('Invalid input; operation cancelled.')
	}
}