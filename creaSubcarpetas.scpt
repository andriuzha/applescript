--Este Script genera un listado de carpetas numeradas del 01 al 12
--Dentro genera 3 subcarpetas - Puedes agregar o retirarlas según necesites
--Especialmente útil para estructuras cosntantes y repetitivas, como años, alumnos, clientes etc.

tell application "Finder"
	-- Estableciendo la carpeta de estino
	set carpetaDestino to (choose folder with prompt "Selecciona la carpeta de destino")
	-- Estableciendo el año (o nombre de la carpeta)
	set carpetaFecha to text returned of (display dialog "Ingresa el año:" default answer "Año a listar")
	
	--Estableciendo la estructura de las carpetas // Aquí puedes comentar o agregar las que necesites
	set subFolder1 to text returned of (display dialog "Ingresa la subcarpeta:" default answer "subCarpeta 1")
	set subFolder2 to text returned of (display dialog "Ingresa la subcarpeta:" default answer "subCarpeta 2")
	set subFolder3 to text returned of (display dialog "Ingresa la subcarpeta:" default answer "subCarpeta 3")
	
	--Estableciendo la carpeta y donde se guardará
	set carpetaListar to (make new folder at carpetaDestino with properties {name:carpetaFecha})
	
	--Generando las carpetas del 01 al 12
	--Si quieres ampliar o reducir el número de carpetas cambia aquí los valores
	repeat with i from 1 to 12
		set mesesListado to text -2 thru -1 of ("0" & i)
		set carpetaMeses to (make new folder at carpetaListar with properties {name:mesesListado})
		--Generando las subcarpetas 
		--//Si agregaste más subcarpetas en la parte de arriba aquí debes de colocar las siguientes//
		repeat with anItem in {subFolder1, subFolder2, subFolder3}
			make new folder at carpetaMeses with properties {name:anItem}
		end repeat
	end repeat
end tell

--Mostrando la notificación
display notification "Ha finalizado la compresión del archivo" with title "Proceso completado"
