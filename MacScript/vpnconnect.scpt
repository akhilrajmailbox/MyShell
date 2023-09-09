-- My Custom Script for Cisco AnyConnect VPN

-- Keychain name for VPN Server, User and Password of Cisco AnyConnect VPN
set SecurekeyChain to "VPN.keychain-db"
set vpnServerAccName to "VPNServer"
set vpnUserAccName to "VPNUser"
set vpnPasswdAccName to "VPNPasswd"

-- AnyConnect now refered to as vpnApp
set vpnApp to "Cisco AnyConnect Secure Mobility Client"

-- Determine if AnyConnect is currently running
tell application "System Events"
	set processExists to exists process vpnApp
end tell

-- Close connection if Cisco AnyConnect VPN is Running ; else start the Cisco AnyConnect VPN
if processExists is true then
	tell application vpnApp
		quit
	end tell
else
	tell application vpnApp to activate
	tell application "System Events" to keystroke return

	set isConnectionEstablished to false
	repeat while isConnectionEstablished = false
		tell application "System Events"

			-- Fetching the data from KeyChain
			set vpnServerText to do shell script "/usr/bin/security find-generic-password -a " & quoted form of vpnServerAccName & " -w " & quoted form of SecurekeyChain
			set vpnUserText to do shell script "/usr/bin/security find-generic-password -a " & quoted form of vpnUserAccName & " -w " & quoted form of SecurekeyChain
			set vpnPasswdText to do shell script "/usr/bin/security find-generic-password -a " & quoted form of vpnPasswdAccName & " -w " & quoted form of SecurekeyChain

			-- Wait for 2 window to open. Do nothing.
			repeat until (window 2 of process vpnApp exists)
				delay 0.2
			end repeat

			-- Pass the VPN Server name
			tell process vpnApp
				keystroke vpnServerText
				keystroke return
			end tell

			-- Wait for 3 window to open. Do nothing.
			repeat until (window 3 of process vpnApp exists)
				delay 0.2
			end repeat

			-- Passing the Credentials
			if exists (window 3 of process vpnApp) then
				set isConnectionEstablished to true

				-- Wait for sometime to choose the VPN Group
				delay 5

				-- Pass the VPN password
				tell process vpnApp
					keystroke tab
					keystroke tab
					keystroke vpnUserText as text
					keystroke tab
					keystroke vpnPasswdText as text
					keystroke tab
				end tell
			end if
		end tell
	end repeat
end if