#!/bin/bash

versuche=0
sum=0

while(true) do
    wuerfel=$((RANDOM % 6 + 1))
    sum=$((sum + wuerfel))
    versuche=$((versuche + 1))
    echo "Würfel: $wuerfel, Summe: $sum"
    if [ $sum -ge 350 ]; then
        break  
    fi
done;

echo "--------------------------------"
echo "Anzahl der Versuche: $versuche"
echo "Summe: $sum"