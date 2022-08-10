-- Este Script purga las Cachés del sistema y la enlazada dinámica compartida.
-- Se abrirá un ventana del terminal solictando tu contraseña de usuario, para poder ejecutar los comandos. 
-- Se recomienda correr el script una vez al mes.

set advertencia to "Por favor cierra todas las aplicaciones./n El equipo se reiniará al terminar la rutina de mantenimiento./n Se abrira una ventana del terminal para continuar el proceso."

display dialog advertencia buttons {"Cancelar", "Continuar"} default button "Continuar" cancel button "Cancelar"

tell application "Terminal"
	do script "sudo rm -rf ~/Library/Caches/&sudo rm -r /Library/Caches/&sudo update_dyld_shared_cache -debug;sudo update_dyld_shared_cache -force&sudo shutdown -r now"
end tell
