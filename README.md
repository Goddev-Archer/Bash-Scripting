# 🐧 Bash-Scripting – Lern- und Übungsmaterial

> **Lernmaterial für den Linux-Betriebssystemunterricht (Abschlussklasse)**  
> Eine strukturierte Sammlung von Bash-Skripten, Praxisbeispielen und Erläuterungen zur Vorbereitung auf Prüfungen und Klassenarbeiten.

---

## 📂 Verzeichnis- und Themenübersicht

| Pfad / Datei | Thema | Beschreibung |
| :--- | :--- | :--- |
| [`sc/zahlen/script.sh`](sc/zahlen/script.sh) | **Auswertungsreihenfolge & `case`** | Demonstration von Mehrfachmustern, Auswertungsreihenfolge und typischen Logik-Fallstricken bei `case`. |
| [`sc/variablen/vartest.sh`](sc/variablen/vartest.sh) | **Variablen & Parameter Expansion** | Demonstration von Zuweisungen, Stringlänge (`${#var}`), Substrings (`${var:start:len}`) und `for`-Schleifen. |
| [`sc/fach/`](sc/fach/) | **Projekt: Fachumwandlung** | Umwandlung von Schul- und Berufsschulkürzeln in Zeugnis-Vollbezeichnungen. |
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
chmod +x sc/zahlen/script.sh
chmod +x sc/variablen/vartest.sh
chmod +x sc/fach/fach.sh
chmod +x sc/fach/fach-rek.sh
```

### 3. Skripte ausführen
```bash
# Aufruf direkt (benötigt gesetztes Ausführungsrecht und korrekte Shebang):
./sc/fach/fach.sh D
./sc/variablen/vartest.sh

# Oder explizit über den Bash-Interpreter:
bash sc/fach/fach.sh D
```

---

## 📚 Prüfungsrelevantes Bash-Grundwissen (Spickzettel)

### 1. Die Shebang (`#!/bin/bash`)
* Steht in der **allersten Zeile** eines Skripts.
* Teilt dem Betriebssystem mit, welcher Interpreter zur Ausführung des Codes geladen werden soll (hier `/bin/bash`).

### 2. Variablen & Parameter Expansion
* **Zuweisung:** `name="Wert"` (Keine Leerzeichen um das `=`!).
* **Zugriff:** `$name` oder `${name}`.
* **String-Länge:** `${#variable}` gibt die Anzahl der Zeichen zurück.
* **Teilzeichenkette (Substring):** `${variable:offset:laenge}` extrahiert einen Teilstring (z. B. `${text:0:1}` für das erste Zeichen).

### 3. Spezielle Variablen & Parameter

| Variable | Bedeutung | Beispiel |
| :--- | :--- | :--- |
| `$0` | Name des ausgeführten Skripts | `./fach.sh` |
| `$1`, `$2`, ... | Das 1., 2. etc. übergebene Argument | Bei `./fach.sh D` ist `$1="D"` |
| `$#` | Anzahl der übergebenen Argumente | `1` |
| `$@` / `$*` | Liste aller übergebenen Argumente | `"D"` |
| `$?` | Rückgabewert (Exit-Code) des letzten Befehls | `0` = Erfolg, `!= 0` = Fehler |

> [!TIP]
> Variablen sollten bei Vergleichen oder in `case` immer in doppelte Anführungszeichen gesetzt werden (`"$1"`), um Fehler durch Leerzeichen oder leere Werte zu verhindern.

### 4. Fallunterscheidungen mit `case ... esac`
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

### 5. Schleifen

#### Zeilenweises Einlesen mit `while read`
Um Textdaten oder Streams zeilenweise zu verarbeiten:
```bash
while read zeile; do
    echo "Gelesene Zeile: $zeile"
done
```
* Liest solange aus der Standardeingabe (`stdin`), bis das Dateiende (**EOF** / *End of File*) erreicht wird.

#### C-Style `for`-Schleife
```bash
for ((i=0; i<10; i++)); do
    echo "Index: $i"
done
```

### 6. I/O-Umleitungen & Pipes

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
