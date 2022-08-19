--Este script genera una secuencia de capturas de pantalla en intervalos regulares.
--Les asigna un nombre y numera los archivos
--Exporta este script como una aplicación para no tener que ejecutar Script Editor

--Selecciona donde guarda las capturas
set carpetaDestino to quoted form of (POSIX path of (choose folder with prompt "Selecciona la carpeta de destino"))

--Defiendo la variable de tiempo 
set tiempo to text returned of (display dialog "Ingresa el intervalo de segundos entre las capturas:" default answer "30")

--Defiendo la variable repeticiones
set repeticiones to text returned of (display dialog "Ingresa la cantidad de capturas que desas realizar:" default answer "10")

set i to 0
repeat repeticiones times --Selecciona la cantidad de veces que desea realizar las capturas
	do shell script ("screencapture " & carpetaDestino & "captura-" & i & ".png") --Cambia "captura-" por el nombre con el que desées guardar la secuencia.
	delay tiempo -- El tiempo (en segundos) que espera entre cada captura
	set i to i + 1
end repeat

delay 0.2
display notification "Se realizaron: " & repeticiones & " capturas en " & carpetaDestino with title "Capturas guardadas"
delay 1
