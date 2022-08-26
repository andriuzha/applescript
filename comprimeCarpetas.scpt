--Este Script comprime todos los archivos de una carpeta a .zip mediante linea de comandos
--Especialmente últil cuando la carpeta de origen contiene muchos archivos
--El archivo se guarda en el mismo directorio de la carpeta de origen

--Asignando la carpeta de Origen
set carpetaOrigen to choose folder
set carpetaOrigen to POSIX path of carpetaOrigen

--Estblaciendo la ruta de la carpeta y el nombre del archivo.
try
	set archivoCompreso to text 1 thru -2 of carpetaOrigen
on error
	display dialog "Error en carpeta seleccionada." buttons {"Cancelar"} with icon stop
end try

--Espera de un segundo para evitar que la ventana de selección del finder pueda cerrarse
delay 1

--Comando de creación del archivo.
do shell script "cd " & (quoted form of carpetaOrigen) & "; zip -r " & (quoted form of archivoCompreso) & " *"

--Mostrando la notificación
display notification "Ha finalizado la compresión del archivo" with title "Proceso completado"
