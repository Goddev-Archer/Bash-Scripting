#!/bin/bash
# ==============================================================================
# Skript: script.sh
# Thema:  Eingabeverarbeitung & Fallunterscheidungen mit 'case'
# Zweck:  Lernskript zur Demonstration von Auswertungsreihenfolgen in Bash.
# ==============================================================================

# 'while read ...' liest zeilenweise von der Standardeingabe (stdin) ein.
# Die Schleife endet automatisch, wenn kein Input mehr kommt (EOF / Strg+D).
while read ziffer; do
    # Fallunterscheidung mit case
    # WICHTIG: Die Muster werden strikt von oben nach unten ausgewertet!
    # Sobald das erste Muster zutrifft, wird dessen Zweig ausgeführt und
    # die case-Anweisung verlassen (kein Fall-Through zu darunterliegenden Mustern).
    case "$ziffer" in
        # Mehrere Muster können mit '|' (ODER) verknüpft werden
        0|2|4|6|8) 
            echo "gerade zahl"
            ;;
        1|3|5|7|9) 
            echo "ungerade zahl"
            ;;
        # LERNEFFEKT / FALLSTRICK:
        # Dieser Block wird NIEMALS für die Ziffern 0-9 ausgeführt:
        # - Die Zahlen 1, 3, 5 wurden bereits von 'ungerade zahl' abgefangen.
        # - Die Zahlen 2, 4, 6 wurden bereits von 'gerade zahl' abgefangen.
        1|2|3|4|5|6) 
            echo "zahl auf einem Würfel"
            ;;
        # Der Stern '*' ist das Auffang-Muster (Wildcard / Default-Zweig)
        *) 
            echo "keine zahl"
            ;;
    esac
done
