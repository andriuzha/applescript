--Este script convierte los archivos .doc .docx .rft y html de una carpeta  en documentos txt
--Primero solicita la carpeta que contiene etos archivos t después donde se guardarán

set {delimitadorTexto, AppleScript's text item delimiters} to {AppleScript's text item delimiters, "."}
set directorioOrigen to choose folder with prompt "Elija la carpeta que contiene los archivos de origen" default location (path to desktop folder)
set directorioDestino to choose folder with prompt "Elija la carpeta donde se guardarán los archivos txt" default location (path to desktop folder)

tell application "Finder"
	set archivosDoc to (every document file of folder directorioOrigen whose (name extension is in {"doc", "docx", "html", "rft"})) as alias list
	set directorioDestino to (POSIX path of directorioDestino)
	repeat with unDocumento in archivosDoc
		set esteDocumento to contents of unDocumento
		set the rutaArchivo to the quoted form of the POSIX path of esteDocumento
		set the nombreArchivo to (text item 1 of text items of (get name of esteDocumento))
		set archivoSalida to quoted form of (directorioDestino & nombreArchivo & ".txt")
		try
			set resultado to do shell script "textutil -convert txt -output " & archivoSalida & " " & rutaArchivo
		on error e number n
			display dialog "Un error ha ocurrido en: " & rutaArchivo & ": " & n & e
		end try
	end repeat
end tell

set AppleScript's text item delimiters to delimitadorTexto

delay 0.2
display notification "" with title "Se ha concluido con exito la conversión"
delay 1
