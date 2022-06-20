--Este script crea un nuevo archivo de texto plano en el escritorio con la fecha actual y luego lo abre
--El formato de la fecha es ddmmaa

set fechaArchivo to do shell script "/bin/date +%d%m%y"

tell application "Finder"
	set plainTextFile to make new file at desktop with properties {name:fechaArchivo & ".txt"}
end tell

-- Comenta el códido de abajo si solo deseas crear el archivo pero no abrirlo

tell application "TextEdit"
	activate
	open file (plainTextFile as text)
	set plainTextDocument to front document
end tell
