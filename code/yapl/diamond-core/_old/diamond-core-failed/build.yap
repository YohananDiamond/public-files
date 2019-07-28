# BUILD PROGRAM
# This program builds the entire operating system into a file.
# The logic here is kinda flawled... sorry. I may improve this a little bit more someday.

call <<std/api/files.yap>>
call <<std/api/compress.yap>>
call <<std/api/yapl_analyzer.yap>>
call <<std/class/rawf.yap>>

func _call(mode = 0): # Initial Function for when the command is called.
	bin = rawf.raw_file() # Creates a new raw file variable.
	call_list = list() # A list with things to call.
	for file in files.filelist('*.*', '%relative-path %include-subdir'): # Gets a file list from the current path and their subdirs.
		call_list.extend(yapl_analyzer.pop(file, 'call %keep-path %keep-args')) # Remove the call lines from the file and get the path and args from that call command to call later.
		bin.add(file) # Add the remains of the file to the bin variable.
	final_file = rawf.raw_file()
	for i in call_list:
		final_file.add(rawf.raw_file('call {}', '\n'))
	final_file.add(bin)
	files.export(final_file, 'sys.bin')
	print('File Succesfully Built into "sys.bin"!')