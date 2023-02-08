--Este Script exporta los álbumes a una carpeta seleccionda.
--Puede seleccionar varios archivos presionando command

set carpetaDestino to (choose folder with prompt "Selecciona la carpeta de destino")
set carpetaDestino to quoted form of POSIX path of carpetaDestino

tell application "Photos"
	activate
	set l to name of albums
	set nombreAlbum to choose from list l with prompt "Selecciona los álbumes" with multiple selections allowed
	if nombreAlbum is not false then
		repeat with tName in nombreAlbum
			set tFolder to carpetaDestino & tName
			my makeFolder(tFolder)
			export (get media items of album tName) to (tFolder as alias) with using originals
		end repeat
	end if
end tell

on makeFolder(tPath)
	do shell script "mkdir -p " & quoted form of POSIX path of tPath
	
end makeFolder
