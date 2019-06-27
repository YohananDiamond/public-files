# DiamondPOW System
Yes, again it doesn't work. I don't know why I do this. And, as I'm lazy, most of the things will just use the magic or hologram command. I don't care. This is more of a "show what functions exist".

Anyways, ``yap`` = "Yet Another Program". It's a programming language test I wanted to make.

## Included Parts
- [x] Tail (``tail.yap``)
- [x] Antenna (``antenna.yap``)
- [x] Bracelet (``bracelet.yap``)
- [x] Hologram Pen (``hpen.yap``)
- [x] Goggles (``goggles.yap``)

## Other Components (not coded)
- Magic (``std/magic.yap``) - Responsible for magic.
- Hologram (``std/hologram.yap``) - Doesn't only represent holograms, but the entire electrical part of the system.

## Code Example
I'm using SQL syntax because its highlighting is interesting for this situation.

```sql
# comment
init() {
	# Initial Code
	execf <filename.yap> (arg1,arg2)
}
```

- ``#`` = Start a Comment
- ``init(arg1, arg2) {}`` = Initial Code (executed when imported via ``execf``)
- ``execf <filename.yap> (arg1,arg2)`` = Imports the file ``filename.yap`` with the arguments ``(arg1,arg2)`` on the file's ``init()`` function.
	- To import a standard library (from the default set), use ``execf <std/filename.yap``.

## List of Functions
Most of the functions I made on these ``.yap`` files I made.

```python
tail.glow()
tail.dash()
tail.hover()
tail.triangle_action()
tail.triangle_spawn()
antenna.lantern()
antenna.sound()
antenna.receive_signal()
antenna.send_signal()
bracelet.spawn_gloves()
bracelet.rem_gloves()
hpen.log()
hpen.receive_touchpad_input()
hpen.touchpad_iterate()
goggles.toggle()
goggles.display()
```