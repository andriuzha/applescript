--Este script abre una ventana de Google Chrome en modo Incognito.scpt

if application "Google Chrome" is running then
	tell application "Google Chrome" to make new window with properties {mode:"incognito"}
else
	do shell script "open -a /Applications/Google\\ Chrome.app --args --incognito" -- Fallback command
end if

tell application "Google Chrome" to activate 
