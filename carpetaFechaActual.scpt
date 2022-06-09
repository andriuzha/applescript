--Este script crea una nueva carpeta en el escritorio con la fecha actual
--El formato de la fecha es ddmmaa


set folderDate to do shell script "/bin/date +%d%m%y"
set carpetaDestino to path to desktop as text

tell application "Finder"
	make new folder in folder (carpetaDestino) with properties {name:folderDate}
end tell
