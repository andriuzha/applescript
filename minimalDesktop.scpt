--Este Script muestra u oculta todos los elementos del escritorio.
--Especialemnet util para presentaciones o juntas online donde debas de mostrar toda la pantalla

display dialog "Que deseas realizar" buttons {"Mostrar iconos", "Ocultar iconos"} with title "Dock " with icon POSIX file "/System/Library/CoreServices/Dock.app/Contents/Resources/Dock.icns" default button 2
set HideSet to button returned of result
if HideSet is "Ocultar iconos" then
	do shell script "defaults write com.apple.finder CreateDesktop -bool FALSE;killall Finder"
else
	do shell script "defaults delete com.apple.finder CreateDesktop;killall Finder"
end if
