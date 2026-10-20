#!/bin/bash
# Wie oft müssen sechs Würfel geworfen werden, bis alle eine Unterschiedliche Augenzahl anzeigen?

versuche=0
while (true) do
    wuerfel1=$(( $RANDOM % 6 + 1 ))
    wuerfel2=$(( $RANDOM % 6 + 1 ))
    wuerfel3=$(( $RANDOM % 6 + 1 ))
    wuerfel4=$(( $RANDOM % 6 + 1 ))
    wuerfel5=$(( $RANDOM % 6 + 1 ))
    wuerfel6=$(( $RANDOM % 6 + 1 ))

    echo "Würfel 1: $wuerfel1, Würfel 2: $wuerfel2, Würfel 3: $wuerfel3, Würfel 4: $wuerfel4, Würfel 5: $wuerfel5, Würfel 6: $wuerfel6"
    if [ $wuerfel1 -ne $wuerfel2 ] then
        if [ $wuerfel1 -ne $wuerfel3 ] then
            if [ $wuerfel1 -ne $wuerfel4 ] then
                if [ $wuerfel1 -ne $wuerfel5 ] then
                    if [ $wuerfel1 -ne $wuerfel6 ] then
                        if [ $wuerfel2 -ne $wuerfel3 ] then
                            if [ $wuerfel2 -ne $wuerfel4 ] then
                                if [ $wuerfel2 -ne $wuerfel5 ] then
                                    if [ $wuerfel2 -ne $wuerfel6 ] then
                                        if [ $wuerfel3 -ne $wuerfel4 ] then
                                            if [ $wuerfel3 -ne $wuerfel5 ] then
                                                if [ $wuerfel3 -ne $wuerfel6 ] then
                                                    if [ $wuerfel4 -ne $wuerfel5 ] then
                                                        if [ $wuerfel4 -ne $wuerfel6 ] then
                                                            if [ $wuerfel5 -ne $wuerfel6 ] then
                                                                break
                                                            fi
                                                        fi
                                                    fi
                                                fi
                                            fi
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
    versuche=$(( versuche + 1 ))
done;
echo "Versuche: ${versuche}"