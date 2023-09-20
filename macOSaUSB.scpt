-- Este script ayuda a generar una USB de instalación del sistema macOS
-- Requiere tener descargado el instalador de la actualización

--Solicita la ruta del instaldor
set archivoInstalacion to choose file with prompt "Selecciona la applicación de macOS:" default location "/Applications" without invisibles
set rutaPOSIXMac to quoted form of POSIX path of archivoInstalacion

-- Generando la ruta del USB
if the rutaPOSIXMac is not false then
	list folder "/Volumes" without invisibles
	choose from list (result) with title "Selecciona el Volumen" with prompt "Selecciona la USB"
	if the result is not false then
		set almacenameinto to item 1 of the result
		set rutaAlmacenamiento to "/Volumes/" & almacenameinto
		set rutaPOSIXAlmacenamiento to quoted form of POSIX path of rutaAlmacenamiento
		set rutaCreacion to rutaPOSIXMac & "Contents/Resources/createinstallmedia"
		
		-- Creando el comando en el terminal
		set comando to "sudo " & rutaCreacion & " --volume " & rutaPOSIXAlmacenamiento & " --applicationpath " & rutaPOSIXMac
		
		-- Abre el terminal y colocando el comando, solictará la contraseña de Administrador
		tell application "Terminal"
			set currentTab to do script (comando)
		end tell
	end if
end if
