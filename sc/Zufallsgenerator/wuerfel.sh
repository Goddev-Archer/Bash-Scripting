#!/bin/bash
# ==============================================================================
# Skript: wuerfel.sh
# Thema:  Würfelwurf-Simulation mit Bash-Bordmitteln
# Logik:  $RANDOM % 6 + 1
# ==============================================================================

# 1. Würfellogik:
# - $RANDOM liefert eine ganzzahlige Pseudozufallszahl (0 bis 32767).
# - % 6 (Modulo) teilt durch 6 und nimmt den Rest (mögliche Reste: 0, 1, 2, 3, 4, 5).
# - + 1 verschiebt das Ganze um 1 nach oben (mögliche Werte: 1, 2, 3, 4, 5, 6).
# - $(( ... )) ist die "arithmetische Expansion" in Bash, damit Bash rechnet
#   und nicht nur Text aneinanderhängt.

wuerfel=$(( $RANDOM % 6 + 1 ))

# 2. Ausgabe
echo "Du hast eine $wuerfel gewürfelt!"
