-- My Custom Script for Mouse Mover

-- Application name
set mouseApp to current application
-- tell mouseApp to get my name

-- Setting environment variables
set scriptPath to "/Users/akhilraj/Applications/mouseMover.py"
set python3Path to "/opt/homebrew/bin/python3"

-- User input
beep
set userInput to choose from list {"start", "stop"} with title "Mouse Mover Execution" with prompt "Please Choose" default items "start"
set userInputString to userInput as string

-- Close connection if mouseMover is Running ; else start the mouseMover
if userInputString = "start" then
	set processNum to do shell script "ps -ef | grep -i " & scriptPath & " | grep -v grep | wc -l | awk '{print $1}'"
	if processNum >= 1 then
		display dialog "MouseMover Process Already Running" buttons {"OK"} default button "OK"
	else
		do shell script " " & python3Path & " " & scriptPath & " > /dev/null 2>&1 &"
	end if
else if userInputString = "stop" then
	do shell script "ps -ef | grep -i " & scriptPath & " | grep -v grep | awk '{print $2}' | xargs -r kill -9"
end if