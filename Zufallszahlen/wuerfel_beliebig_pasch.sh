#!/bin/bash

bremse=0
versuche=0

while (true) do
    wuerfel=$(( $RANDOM % 6 + 1 ))
    wuerfel2=$(( $RANDOM % 6 + 1 ))
    echo "Würfel 1: $wuerfel, Würfel 2: $wuerfel2"
    if [ $wuerfel -eq $wuerfel2 ]; then
        bremse=$(( bremse + 1 ))
    fi
    versuche=$(( versuche + 1 ))
    if [ $bremse -eq 1 ]; then
        break
    fi
done;

echo "Versuche: ${versuche}" 