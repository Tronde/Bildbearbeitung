#!/bin/bash
# Bildgroesse reduzieren und Seitenverhaeltnis beibehalten
# Die gewuenschte Aufloesung wird abgefragt
# oder kann als Parameter uebergeben werden.
# Author: Joerg Kastning
# Lizenz: GPLv3

# Functions ############################################################### #
usage()
{
cat << EOF
usage: $0 options
Dieses Script reduziert die Bildgröße unter Beibehaltung des Seitenverhältnisses.
Es wird in dem Verzeichnis ausgefuehrt, in dem sich die zu verkleinernden Bilder
befinden.

OPTIONS:
-h Show this message
-a Auflösung (z.B. 1600)
EOF
}

while getopts .h:a:. OPTION
do
	case $OPTION in
		h)
			usage
			exit;;
		a)
			aufloesung=$OPTARG
			;;
		?)
			usage
			exit;;
	esac
done

if [[ -z $aufloesung ]]; then
	read -p "Bitte die gewünschte Auflösung eingeben (z.B. 1600): " aufloesung
fi

# Programmbeginn
#read -p "Bitte die gewünschte Auflösung eingeben (z.B. 1600): " aufloesung
for file in *.JPG *.jpg
 do
	mogrify -resize "${aufloesung}"x"${aufloesung}" "$file"
	echo "Bild $file wird verkleinert."
done
echo "Die Bearbeitung ist beendet."
exit
