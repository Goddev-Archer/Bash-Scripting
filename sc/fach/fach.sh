bezeichnung=$1
    case "$bezeichnung" in
        BS|Bes)     echo "Betriebssysteme";;
        NT|NWT|NW)  echo "Netzwerktechnik";;
        An|AnE|AP)  echo "Anwendungsentwicklung";;
        CS)         echo "Computer-Systeme";;
        E)          echo "Englisch";;
        M|Math)     echo "Mathematik";;
        PuG|Soz|SK) echo "Politik und Gesellschaft";;
        R|Rel)      echo "Religion";;
        S|Sp)       echo "Sport";;
        *)          echo "Kürzel unbekannt";;
    esac
