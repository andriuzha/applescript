--Este script abre la carpeta donde se encuentran los iconos de macOS

tell application "Finder" to open ("/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources" as POSIX file)
