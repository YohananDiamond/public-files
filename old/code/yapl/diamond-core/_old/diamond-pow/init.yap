# This is the first file executed on the system, as it is called init.yap
bool shutdown = false

init() { # A slight reference for "int main()" from C++
	print('## DiamondPOW System')
	print('# Setting up the system...')
	# Standard Libraries
	execf <std/physics.yap>
	execf <std/body.yap> # Health, emotions etc.
	execf <std/magic.yap>
	execf <std/hologram.yap>
	# Set up the other systems.
	execf <tail.yap>
	execf <antenna.yap>
	execf <bracelet.yap>
	execf <hpen.yap>
	execf <goggles.yap>
	# Protect the system from executing 'execf' from other codes. This means that, if the command execf is run here, the files opened will be ran, but they themselves won't be able to import more code. It's a temporary protection measure, as there isn't any security system yet.
	prevent(execf) on *.* # (AllImportedFiles).(AllCases)
}	

main() { # The main part of the program.
	while (true) { # Always run the code below:
		multirun(2048) { # Run the same code multiple times at the same time. On that way, the system can run multiple functions at the same time.
			run_function(return(neural)) # Run the function that is returned from the neural connector. I'm too lazy to program this one.
			antenna.receive_signal('all')
			hpen.touchpad_iterate()
			if ('excitement' in body.emotions.translate()) { # Pupil Glowing
				body.eye(0).pupilGlow(true, hex('light_green')) # Enable pupil glowing to light green.
			} else {
				body.eye(0).pupilGlow(false) # Disable pupil glowing, restoring original color. 
			}
		}
		if (shutdown) {
			hologram::('Disconnect hologram system and wait for neural input to enable it again, via the init() function.')
			magic::('Disconnect magical system and wait for neural input to enable it again, via the init() function.')
		}
	}
}

# Also, china. haha I had to make this joke sorry.