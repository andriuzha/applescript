--Este script busca los archivos duplicdos y los envia a la papelera
--El criterio de búsqueda es mediante calcuclo MD5
--No es recursivo, solo funciona en una sola carpeta 

--Selecciona la carpeta donde buscara los duplicados
set carpetaOrigen to choose folder with prompt "Selecciona la carpeta:"

--Llamando al finde y numerando los archivos
tell application "Finder"
	set losArchivos to every file of carpetaOrigen as alias list
	set contarArchivos to count losArchivos
	repeat with i from 1 to contarArchivos - 1
		
		--Obteniendo la ruta de los archivos y realizando el cálculo MD5
		set elArchivo to item i of losArchivos
		set recuentroNombres to count (name of file elArchivo)
		set rutaArchivo to POSIX path of elArchivo
		set checksumMD5 to last word of (do shell script "md5 '" & rutaArchivo & "'")
		
		--Establenciendo la rutina recursiva
		repeat with j from i + 1 to contarArchivos
			set otroArchivo to item j of losArchivos
			set rutaOtroArchivo to POSIX path of otroArchivo
			if last word of (do shell script "md5 '" & rutaOtroArchivo & "'") = checksumMD5 then
				if recuentroNombres < (count (name of file otroArchivo)) then
					
					--Enviando a la papelera los duplicados
					move otroArchivo to trash
				else
					move elArchivo to trash
					exit repeat
				end if
			end if
		end repeat
		--Finalizando la rutina
	end repeat
	
	--Mostrando la notificación
	delay 0.2
	display notification "Los archivos duplicados han sido enviados a la papelera:" with title "Proceso finalizado"
	delay 1
	
	end tell
