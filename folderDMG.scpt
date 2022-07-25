-- Este script genera un archivo DMG a partir de un Folder.
-- La compresión empleada es UDZO (zlib-compressed image)
-- La imagen se realiza sin encriptar.  


set entrada to choose folder with prompt "Selecciona la carpeta:"

delay 1

tell application "System Events"
	if kind of entrada is "Folder" then
		set folderOrigen to POSIX path of entrada
		set guardaTID to AppleScript's text item delimiters
		set AppleScript's text item delimiters to {"/"}
		set folderOrigen to text 1 thru text item -1 of folderOrigen
		set parentDir to text 1 thru text item -2 of folderOrigen & "/"
		set AppleScript's text item delimiters to guardaTID
		tell application "Finder" to set nombreDMG to name of (entrada as alias)
		set directorioSalida to parentDir & nombreDMG & ".dmg"
		set archivoDMG to (do shell script "hdiutil create -volname " & quoted form of nombreDMG & " -srcfolder " & quoted form of folderOrigen & " -format UDZO -ov " & quoted form of directorioSalida)
		
		delay 0.2
		display notification "En:" & directorioSalida with title "Imagen de disco creada"
		delay 1
	end if
end tell
