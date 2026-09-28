#!/bin/bash
# ==============================================================================
# Skript: fach.sh
# Thema:  Parameter-Übergabe ($1) & Fachkürzel-Übersetzung
# Aufruf: ./fach.sh <Kürzel>  (z. B. ./fach.sh D)
# ==============================================================================

# '$1' speichert das erste Argument, das beim Skriptaufruf übergeben wurde.
# Beispiel: './fach.sh BS' -> $1 ist "BS".
bezeichnung=$1

# 'case' vergleicht den Wert der Variablen "$bezeichnung" mit Mustern.
# Die Anführungszeichen verhindern Fehler, falls kein Argument übergeben wurde.
case "$bezeichnung" in
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
    
    # '*' fängt alle Eingaben ab, die auf keines der obigen Muster passen
    # (inklusive leerer Eingaben, wenn kein Parameter übergeben wurde).
    *)          echo "Kürzel unbekannt";;
esac