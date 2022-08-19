--Este Script genera una serie de carpetas de acuerdo a una jerarquia establecida por mi flujo de trabajo en fotografía
--Estan 4 carpetas principales 1. Originales / 2. Selección / 3. Photoshop / 4. Finales la última carpeta contiene otras dos 1. Impresión / 2. Redes


tell application "Finder"
	
	set nombreSesion to text returned of (display dialog "Ingresa el nombre de la Sesión:" default answer "")
	set carpetaDestino to choose folder with prompt "Selecciona la carpeta de destino"
	set carpetaSesion to nombreSesion
	set nuevaCarpeta to make new folder at carpetaDestino with properties {name:carpetaSesion}
	
	--Edita los nombres de las carpetas de acuerdo a tus nececidades. Agrega o elimina tantas carpetas como necesites	
	make new folder at nuevaCarpeta with properties {name:"1. Originales"}
	make new folder at nuevaCarpeta with properties {name:"2. Selección"}
	make new folder at nuevaCarpeta with properties {name:"3. Photoshop"}
	set carpetaDestino2 to make new folder at nuevaCarpeta with properties {name:"4. Finales"}
	--Estas son las subcarpetas que se crearan solo dentro de la carpeta 4
	make new folder at carpetaDestino2 with properties {name:"1. Impresión"}
	make new folder at carpetaDestino2 with properties {name:"2. Redes"}
end tell
