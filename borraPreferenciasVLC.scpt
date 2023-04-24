-- Este script borra las preferencias de VLC Media Player
-- @andriuzha 

display dialog "¿Está seguro de que desea eliminar las preferencias de VLC?" buttons {"No", "Si"} default button "Si" cancel button "No"

try
	set rutaPreferencias1 to ((path to "pref" as text) & "org.videolan.vlc.plist")
	set rutaPreferencias2 to ((path to "pref" as text) & "VLC")
	set rutaPreferencias3 to (((path to library folder as text) & "Caches") & "VLC")
	set cambioRuta to false
	tell application "Finder"
		if exists file rutaPreferencias1 then
			set cambioRuta to true
			delete file rutaPreferencias1 -- moves it to the trash
		end if
		if exists folder rutaPreferencias2 then
			set cambioRuta to true
			delete folder rutaPreferencias2 -- moves it to the trash	
		end if
		if exists folder rutaPreferencias3 then
			set cambioRuta to true
			delete folder rutaPreferencias3 -- moves it to the trash	
		end if
		if cambioRuta then
			display dialog "Los archivos de preferencias se han trasladado a la Papelera." buttons {"OK"} default button {"OK"}
		else
			display dialog "No se encontraron archivos de preferencias." buttons {"OK"} default button {"OK"}
		end if
	end tell
	
on error errorMsg
	display dialog errorMsg
end try
