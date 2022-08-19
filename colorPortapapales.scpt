--Este Script abre el selector de color y copia los valores a hexadecimal en el portapapeles.

on convertirColor(colorRGB)
	set listaHex to {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}
	set valorHex to ""
	repeat with a from 1 to count of colorRGB
		set valorRGB to (item a of colorRGB) div 256
		if valorRGB is 256 then set valorRGB to 255
		set primerElemento to item ((valorRGB div 16) + 1) of listaHex
		set segundoElemento to item (((valorRGB / 16 mod 1) * 16) + 1) of listaHex
		set valorHex to (valorHex & primerElemento & segundoElemento) as string
	end repeat
	return ("#" & valorHex) as string
end convertirColor

set colorRGB to (choose color)
set the clipboard to convertirColor(colorRGB)
