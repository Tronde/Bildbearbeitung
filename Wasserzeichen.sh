#!/bin/bash
# Wasserzeichentext in alle JPEG Bilder aus diesen Verzeichnis einfuegen
# Der Wasserzeichentext wird unten links ins Bild eingebracht
# Sie koennen folgende Parameter anpassen:
Textabstandvonlinks=10
Textabstandvonunten=10
Schriftgroesse=10
PfadFonts="/usr/share/fonts/truetype/freefont"
# Pfad ist je nach Distribution unterschiedlich!
Schriftart="FreeSans.ttf"
Schriftfarbe="white"
# Moegliche Farben koennen aufgelistet werden mit dem Befehl: convert -list color
Wasserzeichentext="Copyright 2015 by Joerg und Barbara Kastning"

# Programmbeginn
echo "Textabstand von links: $Textabstandvonlinks"
echo "Textabstand von unten: $Textabstandvonunten"
echo "Schriftgoesse: $Schriftgroesse"
echo "Schriftart: $Schriftart"
echo "Schriftfarbe: $Schriftfarbe"
echo "Wasserzeichentext: $Wasserzeichentext"
echo " "
ls -1 *.JPG *.jpg | while read file;
 do {
horizontal=`identify -verbose $file | grep Geometry: | awk {'print $2'} |cut -d"x" -f 1`
vertikal=`identify -verbose $file | grep Geometry: | awk {'print $2'} |cut -d"x" -f 2`
X=$Textabstandvonlinks
Y=$(($vertikal - $Textabstandvonunten))
convert -font $PfadFonts/$Schriftart -pointsize $Schriftgroesse -fill $Schriftfarbe -draw "text $X, $Y '$Wasserzeichentext'" "$file" "`basename Wz_"$file"`";
echo "Bearbeite Datei $file"
}
done
echo "Wasserzeichen wurden erfolgreich eingearbeitet"
exit
# Programmende
