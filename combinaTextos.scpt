--Este Script combina multiples archivos txt en uno solo agregando una separación entre ellos
--Guarda el archivo en la carpeta inmediata superior a la seleccionada
--El archivo tiene la fecha de creación en el nombre con el formato ddmmaa

property theSeparator : return & return & "= = = = = = = = = = = = = = = =" & return & return

set currentDate to do shell script "/bin/date +%d%m%y"
set sourceFolder to (choose folder with prompt "Selecciona la carpeta de origen")
tell application "Finder" to set outputFolder to container of sourceFolder
set theseFiles to (list folder sourceFolder without invisibles)
set comboFile to open for access file ((outputFolder as string) & "textos - " & currentDate & ".txt") with write permission
set startPoint to 0.0
repeat with thisFile in theseFiles
	set thisData to read file ((sourceFolder as string) & thisFile)
	write thisData & theSeparator to comboFile starting at (startPoint + 1)
	set startPoint to get eof comboFile
end repeat
close access comboFile
