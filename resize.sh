#!/bin/bash
# Bildgroesse reduzieren und Seitenverhaeltnis beibehalten
# Die gewuenschte Aufloesung wird abgefragt
# Author: Joerg Kastning
# Lizenz: GPLv3

# Programmbeginn
read -p "Bitte die gewünschte Auflösung eingeben (z.B. 1600): " aufloesung
ls -1 *.JPG *.jpg | while read file;
 do {
	mogrify -resize "$aufloesung"x"$aufloesung" "$file"
	echo "Bild $file wird verkleinert."
 }
done
echo "Die Bearbeitung ist beendet."
exit
