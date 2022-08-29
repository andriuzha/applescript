--Este script abre QuickTime y reproduce una estación en línea que se le indique y esconde la ventana

--Invocando QuickTime
tell application "QuickTime Player"
--Abriendo el stream, y ocultando la ventana
	open URL "https://urldelstream"
  delay 2
	tell application "System Events"
		keystroke "h" using command down
	end tell
end tell
