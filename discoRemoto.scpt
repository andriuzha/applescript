--Este script remueve (inabilita) o recupera el acceso al Disco Remoto
--Después de ejecutar el comando de remoción o recuperación el Finder se reiniciara
--(Notaras como se cierran todas las ventanas y se vuelven a abrir)

--Estableciendo la lista de opciones
set listaOpciones to {"Remover Disco Remoto", "Recuperar disco remoto"}
set discoRemoto to (choose from list listaOpciones default items {} with prompt "Selecciona una acción") as string

--Estableciendo las condicionales y asigandoles el comando a ejecutar
if discoRemoto = "Remover Disco Remoto" then
	do shell script "defaults write com.apple.NetworkBrowser EnableODiskBrowsing -bool false & killall Finder"
else if discoRemoto = "Recuperar Disco Remoto" then
	do shell script "defaults write com.apple.NetworkBrowser EnableODiskBrowsing -true false & killall Finder"
end if
