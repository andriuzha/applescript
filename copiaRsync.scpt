--Este script realiza una copia mediante Rsync actualizando los nuevos archivos.
--Permite seleccionar varios directorios al mismo tiempo, pero uno solo de destino. 
--Primero pregunta las carpetas de origen y después dónde se guardarán
--Al finalizar muestra una alerta del trabajo concluido o un error si lo hubiera. 

set folderOrigen to (choose folder with prompt "Selecciona la carpeta de origen" with multiple selections allowed)
set folderDestino to quoted form of (POSIX path of (choose folder with prompt "Selecciona la carpeta de destino"))

repeat with aFolder in folderOrigen
	set contents of aFolder to (quoted form of (text 1 thru -2 of POSIX path of aFolder)) & space
end repeat

delay 1

try
	do shell script "rsync --archive --update --exclude=" & quoted form of ".*" & space & folderOrigen & folderDestino
on error mensajeError
	display alert "Se ha producido un error" message mensajeError as critical
	error number -128
end try

display dialog " 🔄 El proceso de sincronización ha terminado con exito" with title "Finalizado " buttons "OK" default button "OK"
