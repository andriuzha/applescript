--Este script genera una serie de carpetas a patir de una lista.
--La lista debe de estar en texto plano (txt)
--Primero debes de seleccionar la ubicación donde se crearán de las carpetas, después la ubicación de la lista.

set carpetaDestino to (choose folder with prompt "Selecciona donde se crearán las carpetas ")
set archivoLista to (choose file with prompt "Selecciona el archivo que contiene la lista")
set nombreCarpetas to paragraphs of (read archivoLista)
repeat with cadaNombre in nombreCarpetas
	tell application "Finder" to make new folder at carpetaDestino with properties {name:cadaNombre}
end repeat
display dialog "Tus carpetas fueron creadas con éxito" buttons {"OK"}
