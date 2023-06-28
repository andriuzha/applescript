--Este script reemplaza los nombres de los elementos de una carpeta en relación a un archivo csv
--El archivo debera contenener en la primera columna el nombre anterior y en la segunda el nombre  

set carpetaOrigen to (choose folder with prompt "Selecciona la carpeta") as text
set archivoNombres to (choose file with prompt "Selecciona el archivo csv") as text
set archivoNombres to paragraphs of (read file archivoNombres)

set ATID to AppleScript's text item delimiters -- almacena los delimitadores de elementos de texto existentes
set AppleScript's text item delimiters to {","} -- establece los delimitadores de elementos de texto en una coma

tell application "Finder"
	repeat with i from 1 to (count archivoNombres)
		set datosNombres to item i of archivoNombres
		if datosNombres > "" then -- ingora las líneas en blanco
			set archivoOrigen to carpetaOrigen & text item 1 of datosNombres
			if (exists file archivoOrigen) then
				try
					set name of file archivoOrigen to text item 2 of datosNombres
				on error
					display alert "Un archivo con el nombre " & quote & (text item 2 of datosNombres) & quote & " ya existe. Se omitirá."
				end try
			end if
		end if
	end repeat
end tell

set AppleScript's text item delimiters to ATID -- Restablece los delimitadores de elementos de texto a los almacenados previamente
