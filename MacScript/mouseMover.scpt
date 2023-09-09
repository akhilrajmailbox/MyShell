-- My Custom Script for Mouse Mover

-- Application name
set mouseApp to current application

-- Setting up variables
set rand1 to (random number from 1 to 500)
set rand2 to (random number from 501 to 1000)
set sleepTime to 10

use framework "Foundation"
use framework "CoreGraphics"
use scripting additions

-- Start the mouseMover
repeat -- forever
	beep
	set cursorPoint1 to current application's NSMakePoint(rand1, rand1)
	current application's CGWarpMouseCursorPosition(cursorPoint1)
	delay sleepTime
	beep
	set cursorPoint2 to current application's NSMakePoint(rand2, rand2)
	current application's CGWarpMouseCursorPosition(cursorPoint2)
	delay sleepTime
	display dialog "Wanna Kill MouseMover Process ?" buttons {"Stop"} giving up after 5
	if button returned of the result is "Stop" then exit repeat
end repeat