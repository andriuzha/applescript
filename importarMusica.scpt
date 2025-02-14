--Este Script importa los archivos a iTunes
--Los archivos son convertidos a formato ALAC "Apple Lossless audio file"
--Este Script respeta los metadatos de los archivos de origen

--Obteniendo archivos de origen
set archivosOrigen to choose file with prompt "Elija la carpeta que contiene los archivos de origen" default location (path to desktop folder) with multiple selections allowed

--Espera de un segundo para que la ventana de selección se pueda cerrar
delay 1

tell application "Music"
	--Estableciendo el codec (puedes cambiarlo según tus preferencias
	set current encoder to encoder "Lossless Encoder"
	--Límite de espera de 1 hora para todos los archivos
	with timeout of 3600 seconds
		set nuevasPistas to convert archivosOrigen
	end timeout
	
	--Repitiendo el proceso con cada archivo seleccionado
	repeat with cadaPista in nuevasPistas
		tell cadaPista
		end tell
	end repeat
end tell

delay 0.2
display notification "El proceso finalizo con éxito " with title "Importación finalizada"
delay 1
