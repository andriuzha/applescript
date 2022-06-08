--Este script borra las carpetas vacías de un directorio.
--Si la carpeta contiene archivos ocultos, no se considera vacía.
--Si la carpeta contiene unicamente archivos .DS_Store, se considera como vacía.

tell application "Finder"
	set packageFolder to choose folder with prompt "Selecciona la carpeta"
	set posixPath to quoted form of POSIX path of packageFolder
	do shell script "find " & posixPath & " -name '.DS_Store' -type f -delete && find " & posixPath & " -empty -type d -delete"
end tell

display dialog "Se ha conluido con exito el borrado de carpetas vacías en: " & return & return & posixPath with title "Finalizado" buttons "OK" default button "OK"
