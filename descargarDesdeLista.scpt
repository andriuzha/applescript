--Este Scrip descarga archivos desde una lista en txt
--La lista debe de contener la URL completa de todos los archivos
--Cada URL debe de estar en una línea del documento
--Primero solicitará el archivo de las URL y después dónde se descargarán


set laLista to (choose file with prompt ¬
	"Seleccione el archivo de texto que contiene las URL " of type {"txt"} ¬
	default location (path to desktop) ¬
	invisibles false ¬
	without multiple selections allowed) as text

set carpetaDestino to (choose folder with prompt "Selecciona la carpeta de destino")
set carpetaDestino to quoted form of POSIX path of carpetaDestino

set losArchivos to read alias laLista as list using delimiter linefeed

repeat with i from 1 to count of losArchivos
	set esteArchivo to item i of losArchivos
	do shell script "cd " & carpetaDestino & "; " & "curl -O " & quoted form of esteArchivo
end repeat


delay 0.2
display notification "En:" & carpetaDestino with title "Se ha concluido con exito la descarga"
delay 1
