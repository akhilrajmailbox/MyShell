-- My Custom Script for Mouse Mover

-- Application name
set mouseApp to current application
-- tell mouseApp to get my name

-- Setting environment variables
set scriptType to "python" -- bash or cliclick or python
set shScriptPath to "/Users/akhilraj/Documents/TerminalBin/MyShell/CliClick/mm"
set pyScriptPath to "/Users/akhilraj/Documents/TerminalBin/MyShell/bin/mouseMover.py"
set cliclickPath to "/opt/homebrew/bin/cliclick"
set python3Path to "/opt/homebrew/bin/python3"

-- User input
if scriptType is not "cliclick" then
	beep
	set userInput to choose from list {"start", "stop"} with title "Mouse Mover Execution" with prompt "Please Choose" default items "start"
	set userInputString to userInput as string
end if

-- Bash Script
if scriptType = "bash" then
	-- Close connection if mouseMover is Running ; else start the mouseMover
	if userInputString = "start" then
		do shell script " " & shScriptPath & " b"
	else if userInputString = "stop" then
		do shell script " " & shScriptPath & " k"
	end if
-- CliClick
else if scriptType = "cliclick" then
	repeat -- forever
		beep
		set sleepTime to 10
		set rand to (random number from 1 to 1000)
		do shell script " " & cliclickPath & " m:" & rand & "," & rand & " "
		delay sleepTime
		beep
		display dialog "Wanna Kill MouseMover Process ?" buttons {"Stop"} giving up after 5
		if button returned of the result is "Stop" then exit repeat
	end repeat
-- Python Script
else if scriptType = "python" then
	-- Close connection if mouseMover is Running ; else start the mouseMover
	if userInputString = "start" then
		set processNum to do shell script "ps -ef | grep -i " & pyScriptPath & " | grep -v grep | wc -l | awk '{print $1}'"
		if processNum >= 1 then
			display dialog "MouseMover Process Already Running" buttons {"OK"} default button "OK"
		else
			do shell script " " & python3Path & " " & pyScriptPath & " > /dev/null 2>&1 &"
		end if
	else if userInputString = "stop" then
		do shell script "ps -ef | grep -i " & pyScriptPath & " | grep -v grep | awk '{print $2}' | xargs -r kill -9"
	end if
end if