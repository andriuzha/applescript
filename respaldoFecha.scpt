--Este Script genera una carpeta con fecha del día y la establece como destino, trasladando todos los archivos desde la carpeta de origen
--El formato de la fecha es ddmmaa

--Estableciendo el comando para la fecha
set fechaActual to do shell script "/bin/date +%d%m%y"

--Coloca la ruta de la carpeta que deseés archivar
do shell script "mkdir /Users/usuario/carpetaOrigen/" & fechaActual

--Coloca la ruta de la carpeta en la que deseas colocar los archivos
set comandoMover to do shell script "mv /Users/usuario/carpetaOrigen/* /Users/usuario/carpetaDestino/" & fechaActual

do shell script comandoMove

delay 1

display notification "Todos los archivos han sido movidos" with title "Proceso completado"
