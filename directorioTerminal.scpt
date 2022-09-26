--Este script abre una terminal en el directorio donde usted se encuentre.
--Primero exporte el script como una app
--Después agregue la app a la barra superior del Finder
--Ejecute la app desde cualquier ventana del Finder


tell application "Finder"
	set directorioDestino to (quoted form of POSIX path of (folder of the front window as alias))
end tell

do shell script "open -a Terminal " & directorioDestino
