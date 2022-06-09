--Este script inspecciona y lista las aplicaciones y procesos están utilizando de forma activa tu conexión a internet.

set theCmd to "lsof +c 0 -i | grep -i established | cut -d \" \" -f 1 | awk '!_[$0]++'"

set theMsg to (do shell script theCmd)
display dialog "Las siguientes aplicaciones y procesos están utilizando de forma activa tu conexión a internet: " & return & return & theMsg with title "Inspector de conexión" buttons "OK" default button "OK"
