--Este Script mueve todos los archivos de una carpeta a otra
--Especialmente últil cuando la carpeta de origen contiene muchos archivos

--Estableciendo la carpeta de origen
set folderOrigen to (choose folder with prompt "Selecciona la carpeta de origen") as alias
--Estableciendo la carpeta destino
set folderDestino to (choose folder with prompt "Selecciona la carpeta de destino") as alias

--Cambiando las rutas a POSIX
set folderOrigenPOSIXPath to (the POSIX path of folderOrigen)
set folderDestinoPOSIXPath to (the POSIX path of folderDestino)

--Estableciendo la estructura del comando
set comandoMover to "mv " & folderOrigenPOSIXPath & "* " & folderDestinoPOSIXPath

--Esperando un segundo para dar tiempo a la ventana del finder a cerrarse
delay 1

--Ejecutando el comando
do shell script comandoMover

--Mostrando la notificación
display notification "Todos los archivos han sido movidos" with title "Proceso completado"
