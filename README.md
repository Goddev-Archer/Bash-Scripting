# 🐧 Bash-Scripting – Lern- und Übungsmaterial

> **Lernmaterial für den Linux-Betriebssystemunterricht (Abschlussklasse)**  
> Eine strukturierte Sammlung von Bash-Skripten, Praxisbeispielen und Erläuterungen zur Vorbereitung auf Prüfungen und Klassenarbeiten.

---

## 📂 Verzeichnis- und Themenübersicht

| Pfad / Datei | Thema | Beschreibung |
| :--- | :--- | :--- |
| **`sc/Arrays/`** | **Arrays (Indizierte Felder)** | Erstellung, Manipulation, Abfrage und Löschen von Arrays. |
| ├── [`array.sh`](sc/Arrays/array.sh) | *Array-Operationen* | Zuweisung per Index, Anhängen (`+=`), Gesamtanzahl (`${#array[*]}`), Elementlänge, Kopieren und `unset`. |
| └── [`test.sh`](sc/Arrays/test.sh) | *Array-Grundlagen* | Kompaktes Beispiel für Deklaration und Ausgabe eines Arrays (`test=(...)`). |
| **`sc/Eingabeverarbeitung/`** | **String- & Argumentverarbeitung** | Zerlegen, Durchlaufen und Manipulieren von Texten und Parametern. |
| ├── [`reverse.sh`](sc/Eingabeverarbeitung/reverse.sh) | *String umkehren* | Liest Argumente (`$*`) ein und gibt sie über eine dekrementierende `for`-Schleife und `echo -n` zeichenweise rückwärts aus. |
| └── [`script.sh`](sc/Eingabeverarbeitung/script.sh) | *Zeichenweise Iteration* | Durchläuft Argument `$1` von Index 0 bis zur Länge und gibt jedes Zeichen mit Index aus (`${str:$i:1}`). |
| **`sc/variablen/`** | **Variablen & Parameter Expansion** | Grundlagen zu Variablen, Stringlängen und Substring-Extraktion. |
| └── [`vartest.sh`](sc/variablen/vartest.sh) | *Variablen-Demo* | Variablenzuweisung ohne Leerzeichen, Zeichenkettenlänge (`${#var}`), Substrings (`${var:i:1}`) und Schleifendurchlauf. |
| **`sc/zahlen/`** | **Auswertungsreihenfolge & `case`** | Fallunterscheidungen, Mehrfachmuster und Logik. |
| └── [`script.sh`](sc/zahlen/script.sh) | *Mustervergleich* | Demonstration von ODER-Mustern (`|`), `while read` und der Auswertungsreihenfolge von oben nach unten (Würfelzahlen-Falle). |
| **`sc/fach/`** | **Projekt: Fachumwandlung** | Umwandlung von Schul- und Berufsschulkürzeln in Zeugnis-Vollbezeichnungen. |
| ├── [`fach.sh`](sc/fach/fach.sh) | *Parameterverarbeitung* | Einzelabfrage über `$1` (Kommandozeilenargument). |
| ├── [`fach-rek.sh`](sc/fach/fach-rek.sh) | *Streamverarbeitung* | Zeilenweise Stapelverarbeitung über `stdin` (`while read`). |
| ├── [`input`](sc/fach/input) | *Testdatensatz* | Beispieldaten mit gültigen und ungültigen Testfällen. |
| └── [`doc.md`](sc/fach/doc.md) | *Projektdokumentation* | Detaillierte Dokumentation, Tabellen und Testfallanalysen. |

---

## 🚀 Schnellanleitung: Repository klonen & Skripte ausführen

### 1. Repository klonen (WICHTIG für Git-Nutzung!)
> [!IMPORTANT]
> **Nicht als ZIP herunterladen**, wenn Git verwendet werden soll! Ein ZIP-Download enthält absichtlich **keinen `.git`-Ordner**, wodurch Versionskontrolle und spätere Updates (`git pull`) nicht möglich sind.
> 
> **Richtig vorgehen:**
> ```bash
> git clone <REPO-URL>
> cd Bash-Scripting
> ```

### 2. Ausführungsrechte vergeben (unter Linux / WSL)
Bevor ein Skript direkt mit `./skriptname.sh` aufgerufen werden kann, muss das Ausführungsbit gesetzt werden:
```bash
chmod +x sc/Arrays/*.sh
chmod +x sc/Eingabeverarbeitung/*.sh
chmod +x sc/variablen/*.sh
chmod +x sc/zahlen/*.sh
chmod +x sc/fach/*.sh
```

### 3. Skripte ausführen
```bash
# Aufruf direkt (benötigt gesetztes Ausführungsrecht und korrekte Shebang):
./sc/fach/fach.sh D
./sc/Eingabeverarbeitung/reverse.sh Hallo Welt
./sc/Arrays/array.sh

# Oder explizit über den Bash-Interpreter:
bash sc/fach/fach.sh D
```

---

## 📚 Prüfungsrelevantes Bash-Grundwissen (Spickzettel)

### 1. Die Shebang (`#!/bin/bash`)
* Steht in der **allersten Zeile** eines Skripts.
* Teilt dem Betriebssystem mit, welcher Interpreter zur Ausführung des Codes geladen werden soll (hier `/bin/bash`).

### 2. Variablen & Parameter Expansion
* **Zuweisung:** `name="Wert"` (Wichtig: **Keine Leerzeichen** vor oder nach dem `=`!).
* **Zugriff:** `$name` oder `${name}`.
* **String-Länge:** `${#variable}` gibt die Anzahl der Zeichen zurück.
* **Teilzeichenkette (Substring):** `${variable:offset:laenge}` extrahiert einen Teilstring (z. B. `${text:0:1}` für das erste Zeichen).

### 3. Spezielle Variablen & Parameter

| Variable | Bedeutung | Beispiel |
| :--- | :--- | :--- |
| `$0` | Name des ausgeführten Skripts | `./fach.sh` |
| `$1`, `$2`, ... | Das 1., 2. etc. übergebene Argument | Bei `./fach.sh D` ist `$1="D"` |
| `$#` | Anzahl der übergebenen Argumente | `1` |
| `$*` | Alle Argumente als **ein einziger String** | `"Arg1 Arg2"` |
| `$@` | Alle Argumente als **einzelne Wörter/Elemente** | `"Arg1" "Arg2"` |
| `$?` | Rückgabewert (Exit-Code) des letzten Befehls | `0` = Erfolg, `!= 0` = Fehler |

> [!TIP]
> Variablen sollten bei Vergleichen oder in `case` immer in doppelte Anführungszeichen gesetzt werden (`"$1"`), um Fehler durch Leerzeichen oder leere Werte zu verhindern.

### 4. Arrays (Indizierte Felder)

Arrays ermöglichen das Speichern mehrerer Werte in einer einzigen Variablen (0-basierter Index):

```bash
# 1. Deklaration / Initialisierung
tage=(Mo Di Mi Do Fr Sa So)

# 2. Zugriff auf einzelne Elemente
echo "${tage[0]}"       # Erstes Element ("Mo")
echo "${tage[2]}"       # Drittes Element ("Mi")
echo "${tage[-1]}"      # Letztes Element ("So")

# 3. Alle Elemente ausgeben
echo "${tage[*]}"       # Als eine Zeichenkette
echo "${tage[@]}"       # Als getrennte Elemente

# 4. Anzahl der Elemente (Array-Länge)
echo "${#tage[*]}"      # z. B. 7

# 5. Länge eines einzelnen Elements ermitteln
echo "${#tage[0]}"      # Länge von "Mo" -> 2

# 6. Element nachträglich zuweisen oder ändern
tage[2]="Mittwoch"

# 7. Elemente an das Array anhängen (+=)
tage+=(Wochenende Feiertag)

# 8. Array kopieren
kopie=("${tage[@]}")

# 9. Element oder ganzes Array löschen (unset)
unset tage[1]           # Löscht das Element an Index 1
unset tage              # Löscht das gesamte Array
```

### 5. Fallunterscheidungen mit `case ... esac`
Die `case`-Verzweigung eignet sich hervorragend, um eine Variable gegen viele feste Werte oder Muster zu prüfen (übersichtlicher als viele `if ... elif`-Zweige):

```bash
case "$variable" in
    Muster1)
        # Befehle
        ;;
    Muster2|Muster3)
        # Mehrere Muster mit ODER verknüpft
        ;;
    *)
        # Default-Zweig (Wildcard für alle anderen Werte)
        ;;
esac
```
* **`;;`** beendet einen Musterblock (vergleichbar mit `break` in anderen Programmiersprachen).
* **Auswertungsreihenfolge:** Bash prüft die Muster **von oben nach unten**. Sobald das erste Muster zutrifft, wird der Block ausgeführt und das `case` beendet. (Siehe Beispiel in [`sc/zahlen/script.sh`](sc/zahlen/script.sh)).

### 6. Schleifen

#### C-Style `for`-Schleife (vorwärts & rückwärts)
```bash
# Vorwärts zählen:
for ((i=0; i<10; i++)); do
    echo "Index: $i"
done

# Rückwärts zählen (z. B. zum Umkehren eines Strings):
for ((i=${#text}-1; i>=0; i--)); do
    echo -n "${text:$i:1}"
done
```

> [!NOTE]
> `echo -n` unterdrückt den automatischen Zeilenumbruch am Ende, sodass Zeichen direkt nebeneinander ausgegeben werden können.

#### Zeilenweises Einlesen mit `while read`
Um Textdaten oder Streams zeilenweise zu verarbeiten:
```bash
while read zeile; do
    echo "Gelesene Zeile: $zeile"
done
```
* Liest solange aus der Standardeingabe (`stdin`), bis das Dateiende (**EOF** / *End of File*) erreicht wird.

### 7. I/O-Umleitungen & Pipes

| Operator | Funktion | Beispiel |
| :--- | :--- | :--- |
| `<` | Eingabeumleitung (Input Redirection) | `./fach-rek.sh < input` |
| `>` | Ausgabe in Datei schreiben (überschreibt Inhalt) | `./fach.sh D > ausgabe.txt` |
| `>>` | Ausgabe an Datei anhängen | `./fach.sh M >> ausgabe.txt` |
| `2>` | Nur Fehlerausgabe (`stderr`) umleiten | `ls nicht_da 2> fehler.log` |
| `\|` | **Pipe:** Leitet die Ausgabe eines Befehls als Eingabe an den nächsten | `cat input \| ./fach-rek.sh` |

---

## ⚠️ Typische Fallstricke

1. **Windows vs. Linux Zeilenenden (`CRLF` vs. `LF`):**
   * Windows-Dateien enden mit `\r\n` (CRLF), Linux-Dateien mit `\n` (LF).
   * Wenn eine Datei unter Windows mit CRLF gespeichert wird und in Bash zeilenweise eingelesen wird (`read`), enthält die Variable das unsichtbare `\r`. Ein Vergleich wie `BS` schlägt dann fehl (`"BS\r"` != `"BS"`).
   * **Behebung:** Im Editor auf `LF` umstellen oder via `dos2unix dateiname` bzw. `tr -d '\r'` konvertieren.
2. **Fehlende Leerzeichen:**
   * In Bash sind Leerzeichen Syntaxbestandteile: `variable = wert` ist falsch, `variable=wert` ist richtig!
