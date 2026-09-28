#!/bin/bash
# ==============================================================================
# Skript: fach-rek.sh
# Thema:  Stream- & Stapelverarbeitung (Batch) mit 'while read' und Standardeingabe
# Aufruf: ./fach-rek.sh < input
#         cat input | ./fach-rek.sh
# ==============================================================================

# 'while read kuerzel; do ... done'
# - Liest Zeile für Zeile aus der Standardeingabe (stdin) in die Variable $kuerzel.
# - Die Schleife läuft solange, bis das Dateiende (EOF) erreicht ist.
while read kuerzel; do
    case "$kuerzel" in
        BS|BeS)     echo "Betriebssysteme";;
        NT|NWT|NW)  echo "Netzwerktechnik";;
        An|AnE|AP)  echo "Anwendungsentwicklung";;
        CS)         echo "Computer-Systeme";;
        E)          echo "Englisch";;
        D)          echo "Deutsch";;
        M|Math)     echo "Mathematik";;
        PuG|Soz|SK) echo "Politik und Gesellschaft";;
        R|Rel)      echo "Religion";;
        S|Sp)       echo "Sport";;
        *)          echo "Kürzel unbekannt";;
    esac
done