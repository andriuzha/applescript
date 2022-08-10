--Este escript crea una carpeta oculta en el escritorio con el nombre Folder
--En caso que la carpeta ya exista se borrará todo el contenido dentro de ella (No será enviada a la papelera)

set carpetaOculta to quoted form of (POSIX path of (path to desktop) & "Folder")

do shell script "/bin/rm -rf " & carpetaOculta & ";/bin/mkdir " & carpetaOculta & ";/usr/bin/chflags hidden " & carpetaOculta
