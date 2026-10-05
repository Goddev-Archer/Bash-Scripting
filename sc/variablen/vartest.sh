#!/bin/bash

# ==============================================================================
# Skript: vartest.sh
# Thema:  Variablen & Parameter-Übergabe ($1); Parameter Expansion
# Zweck:  Lernskript zur Demonstration von Variablen in Bash.
# ==============================================================================

# Variablen in Bash werden mit dem Gleichheitszeichen '=' zugewiesen. 
# Ein Dollarzeichen '$' vor dem Variablennamen wird verwendet,
# um auf den Wert der Variablen zuzugreifen, nicht aber in der Zuweisung. 
# Variablennamen dürfen keine Leerzeichen enthalten und sollten mit einem Buchstaben oder Unterstrich beginnen (!).

# Hier wurden Variablen mit einteiligen bezeichnenden Namen erstellt.
a=4
ort="Berlin"
ort2="Lauingen"
klasse="ETA12"
name="Max Mustermann"
kuenstliche_eingabe="Heute ist Montag"

# Nun folgt eine for-schleife, die über die Länge der Zeichenkette in der Variablen 'kuenstliche_eingabe' iteriert.
for ((i=0; i<${#kuenstliche_eingabe}; i++)); do
    echo "Zeichen $i: ${kuenstliche_eingabe:$i:1}"
done
