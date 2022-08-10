--Este Script Genera un nuevo Escritorio vacío.
--Es necesario darles permisos de accesibilidad.

tell application "System Events"
	do shell script "/Applications/Mission\\ Control.app/Contents/MacOS/Mission\\ Control"
	click button 1 of group "Spaces Bar" of group 1 of group "Mission Control" of process "Dock"
	do shell script "/Applications/Mission\\ Control.app/Contents/MacOS/Mission\\ Control"
end tell
