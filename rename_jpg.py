#!/usr/bin/env python3
# -*- encoding: utf-8 -*-
#
# Beschreibung:
# Dieses Skript dient der Verarbeitung von JPEG-Dateien. Es wertet das
# Attribut 'EXIF DateTimeOriginal' aus und benennt die verbeiteten Dateien
# um, so dass diese dem Muster <YYYY-MM-DD_img_NUMBER> entsprechen.
#
# Autor:    Tronde (https://ubuntuusers.de/user/Tronde/)
# Lizenz:   GPLv3 (http://www.gnu.de/documents/gpl.de.html)

import os
import exifread
import argparse

def main():
    parser = argparse.ArgumentParser(description="Dieses Skript dient der Verarbeitung von JPEG-Dateien. Es wertet das Attribut 'EXIF DateTimeOriginal' aus und benennt die verbeiteten Dateien um, so dass diese dem Muster <YYYY-MM-DD_img_NUMBER> entsprechen.")
    parser.add_argument("-s", "--source-dir", required=False, default='.', dest="src", help="Quell-Verzeichnis mit den zu verarbeitenden JPEG-Dateien.")

    args = parser.parse_args()
    
    src = args.src

    os.chdir(src)
    for file in os.listdir(src):
        if file.endswith(".jpg") or file.endswith(".JPG"):
            f = open(file, 'rb')
            tags = exifread.process_file(f, details=False, stop_tag='EXIF DateTimeOriginal')
            str_DateTime = str(tags['EXIF DateTimeOriginal']).split()
            str_Date = str(str_DateTime[0]).split(':')
            str_Time = str(str_DateTime[1]).split(':')
            Date = str_Date[0] + "-" + str_Date[1] + "-" + str_Date[2]
            Time = str_Time[0] + str_Time[1] + str_Time[2]
            fname = Date + "T" + Time + "_img.jpg"
#            print(fname)
            os.rename(file,fname)

if __name__ == "__main__":
    main()
