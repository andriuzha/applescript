--Este script crea un calendario mensual en formato de texto abirendo textEdit
--La semana inicia en domingo

set mm to do shell script "/bin/date +%m"
set aaaa to do shell script "/bin/date +%Y"

set comandoCal to "cal -HmM" & " " & mm & " " & aaaa
set textEdit to "| open -f -a \"TextEdit\""

do shell script comandoCal & " " & textEdit
