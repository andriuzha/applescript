--Este script muestra una barra de progreso.
--La barra no hace nada, pero mientras termina puedes ir por un café ...
--Exporta este Script como una aplicación.
--Cambia el nombre de la aplicación guardada para que la muestre como título de la barra.

set progress description to " Actualizando el sistema"
set progress additional description to "Inciando el proceso de actualización…"
set progress total steps to -1

--El tiempo de espera (en segundos) para mostrar la barra de progreso
delay 6

set progress total steps to 100
repeat with i from 1 to 100
	try
		set progress additional description to "Porcentaje completado... " & i
		set progress completed steps to i
		--El tiempo de espera (en segundos) para incrementar 
		delay 1
	on error thisErr
		display alert thisErr
		exit repeat
	end try
end repeat
