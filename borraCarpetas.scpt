--Este script borra una carpeta de forma recursiva (con todo el contenido dentro). Incluso si alguín item esta bloqueado.
--Este escript NO envía los archivos a la papelera, los elimina directamente. Tenga precaución. 

set folderOrigen to (choose folder with prompt "Selecciona la carpeta a borrar" with multiple selections allowed)
set rutaFolder to quoted form of POSIX path of folderOrigen

delay 0.2
do shell script "rm -rf" & space & rutaFolder

delay 0.2
display notification with title "Se ha borrado con exito la carpeta"
delay 1
