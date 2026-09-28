while read ziffer; do
    case "$ziffer" in
        0|2|4|6|8) echo "gerade zahl";;
        1|3|5|7|9) echo "ungerade zahl";;
        1|2|3|4|5|6) echo "zahl auf einem Würfel";;
        *) echo "keine zahl";;
    esac
done
