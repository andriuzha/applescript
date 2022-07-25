-- Este pequeño script elimina las aplicaciones de la cuarentena.
-- Guarda este script como una aplicación y arrastra sobre ella la aplicación deseada.

on open paths
	set xattr to "xattr -dr com.apple.quarantine"
	repeat with path in paths
		set xattr to xattr & space & quote & POSIX path of path & quote
	end repeat
	do shell script xattr
	delay 0.2
	display notification "Aplicación removida de la cuarentena"
	delay 1
end open
