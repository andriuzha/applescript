--Est Script abre las ventanas de Chrome bajo un perfil especifico
--Para saber que perfil corresponde a la cuenta que desea abrir navegue hasta:
-- ~/Library/Application Support/Google/

--Estableciendo las ventanas qye se van a abir
set ventanasTrabajo to {"https://mail.google.com", "https://calendar.google.com", "https://drive.google.com/"}

--Estableciendo el perfil  
set perfilTrabajo to {"Default"}

--Estableciendo el comando con el perfil seleccionado
do shell script "open -na 'Google Chrome' --args --profile-directory=" & perfilTrabajo
delay 1

--Invocando en Chrome las ventanas 
tell application "Google Chrome"
	activate
	tell front window
		set URL of active tab to first item of ventanasTrabajo
		delay 0.5
		repeat with i from 2 to count of ventanasTrabajo
			make new tab at after (get active tab) with properties {URL:item i of ventanasTrabajo}
			delay 0.5
		end repeat
		set active tab index to 1
	end tell
end tell
delay 1
