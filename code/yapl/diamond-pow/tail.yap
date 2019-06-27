# Tail System. Heavily uses the magic power and a bit of hologram too.
init() {
	print('### Tail System started.')
}

func glow(mode:str='tail_only', color:str='blue') { # The glowing effect on the tail. Can also affect the entire system.
	# Possible modes: ['tail_only', 'entire_body']
	magic::('Use magical power to glow, based on the mode {}, with color {}'.format(mode), color)
	hologram::('Use the hologram power to glow, based on the mode {}, with color {}'.format(mode), color)
	# The combination of both will make an interesting effect, I think. Like a sparkle with a hologram light or something (blue or green).
}

func dash(dir:Vector3, mode:str='normal', spd:float) { # The dash power. Can be done as many times as wanted, as long as the energy is sufficient.
	print('# Dash Function Started')
	time dur = 0.5s
	int needed_energy
	float spd
	if (mode == 'normal') {
		needed_energy = 500
		spd = 350
	} elif (mode == 'water') {
		needed_energy = 350
		spd = 450
	} else {
		print('Invalid Dash usage.')
		break
	}
	dir.normalize() # The vector will now have length = 1.
	if (magic.energy > needed_energy) {
		magic::('Dash on the direction {}, speed {}, duration {}.'.format(dir, spd, dur), # It will use the needed amount of magical energy for thes situation, be it 'normal' or 'water'.
			'While dashing, execute the function', glow('tail_only'))
		}
		print('Dashed Succesfully with direction = {}'.format(dir))
	} else {
		print('Not enough energy; unable to dash.')
	}
}

func hover(dir:Vector3, speed:float) { # The hover function, basically flying. The hover name is more interesting :v
	if (magic.onAir) {
		magic::('Accelerate {} on the direction {}'.format(),
			'While accelerating', glow())
		print('Hovering started.')
	} else {
		print('Not on ground; unable to hover.')
	}
}

func triangle_action(triangle='oldest', dir:Vector3) { # Act for the triangles.
	print('Triangle Action Started')
	bool continue = false
	int triangleIndex
	if (triangle == 'oldest') {
		triangleIndex = len(hologram.objList('triangle')) - 1 # This will return a list.
		if (len(hologram.objList('triangle')) == 0) {
			print('Failed to find any triangle; operation cancelled.')
		} else {
			triangleIndex = 0
			print('Grabbed triangle by ID = 0.')
			continue = true
		}
	} elif (type(triangle) == 'int') {
		if (triangleIndex + 1 > len(hologram.objList('triangle'))) or (triangleIndex < 0) {
			print('There isn{}t any triangle with that ID; operation cancelled.'.format("'"))
		} else {
			continue = true
		}
	} else {
		print('The specified triangle wasn{0}t recognized. Please specify with an integer or just don{0}t specify anything to send the oldest one.'.format("'"))
		break
	}
	if (continue) {
		str triangleType = hologram.objList('triangle')[triangleIndex].('utility')
		float missleDmg = 5.0
		if (triangleType == 'wrHook') {
			# Wireless Hook Launch Code
			hologram::('Launch the triangle on the direction {}'.format(dir),
				'When the triangle touches something, it will create a Wireless Hook between the user and the place the triangle touched.')
		} elif (triangleType == 'missle') {
			hologram::('Launch the triangle on the direction {}'.format(dir),
				'When the triangle touches something, it will explode and deal {} damage.'.format(missleDmg))
		}
	}
}

func triangle_spawn(utility) { # Spawn flying triangles for multiple utilities.
	hologram.createObject('triangle') {
		'utility': utility
	}
	if (utility == 'wrHook') {
		print('Missle triangle spawned; the color will be green.')
		hologram.lastObject() {
			'color': hex('green')
		}
	} elif (utility == 'missle') {
		print('Missle triangle spawned; the color will be red.')
		hologram.lastObject() {
			'color': hex('red')
		}
	} else {
		print('Unknown type of triangle; the color will be blue.')
		hologram.lastObject() {
			'color': hex('blue')
		}
	glow('tail_only', hologram.lastObject.('color'))
	}
}