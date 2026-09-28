# Fachumwandlung (`sc/fach`)

Dieses Verzeichnis enthält Bash-Skripte zur automatisierten Übersetzung von Schulfach-Kürzeln in deren vollständige Fachbezeichnungen (z. B. zur Generierung von Zeugnissen aus Stundenplandaten einer Berufsschule).

---

## Inhaltsverzeichnis

- [Überblick](#überblick)
- [Dateien im Verzeichnis](#dateien-im-verzeichnis)
- [Zuordnungstabelle der Fächer](#zuordnungstabelle-der-fächer)
- [Nutzung und Beispiele](#nutzung-und-beispiele)
  - [1. Einzelabfrage (`fach.sh`)](#1-einzelabfrage-fachsh)
  - [2. Stapelverarbeitung (`fach-rek.sh`)](#2-stapelverarbeitung-fach-reksh)
- [Testdatensatz (`input`)](#testdatensatz-input)
- [Technische Hinweise (Zeilenenden / CRLF vs. LF)](#technische-hinweise-zeilenenden--crlf-vs-lf)

---

## Überblick

Im täglichen Schul- und Stundenplanbetrieb werden Unterrichtsfächer meist durch kurze Kürzel dargestellt. Für offizielle Dokumente (wie Schülerzeugnisse) müssen diese Bezeichnungen jedoch vollständig ausgeschrieben werden.

Die Skripte in diesem Ordner werten die Kürzel mithilfe einer Bash-`case`-Verzweigung aus und geben die offizielle Langbezeichnung aus. Bei unbekannten Kürzeln greift ein Fallback.

---

## Dateien im Verzeichnis

| Datei | Typ | Beschreibung |
| :--- | :--- | :--- |
| **`fach.sh`** | Bash-Skript | Wandelt ein einzelnes Kürzel um, das als erstes Befehlszeilenargument (`$1`) übergeben wird. |
| **`fach-rek.sh`** | Bash-Skript | Liest kontinuierlich Kürzel zeilenweise aus der Standardeingabe (`stdin`) ein und gibt die Bezeichnungen aus. |
| **`input`** | Textdatei | Testdatensatz mit verschiedenen Kürzeln (Gültige Kürzel, Varianten und absichtliche Ungültigkeiten). |
| **`doc.md`** | Dokumentation | Diese Projekt- und Verzeichnisdokumentation. |

---

## Zuordnungstabelle der Fächer

Die Zuordnung basiert auf den Pattern-Matching-Regeln in den Skripten:

| Kürzel | Vollständige Fachbezeichnung | Hinweis / Varianten |
| :--- | :--- | :--- |
| `BS`, `BeS` | Betriebssysteme | Case-sensitive: `BES` wird nicht gematcht |
| `NT`, `NWT`, `NW` | Netzwerktechnik | |
| `An`, `AnE`, `AP` | Anwendungsentwicklung | |
| `CS` | Computer-Systeme | |
| `E` | Englisch | |
| `D` | Deutsch | |
| `M`, `Math` | Mathematik | |
| `PuG`, `Soz`, `SK` | Politik und Gesellschaft | |
| `R`, `Rel` | Religion | |
| `S`, `Sp` | Sport | |
| *\* (alle anderen)* | `Kürzel unbekannt` | Standard-Fallback |

---

## Nutzung und Beispiele

### 1. Einzelabfrage (`fach.sh`)

Das Skript `fach.sh` erwartet das Kürzel als erstes Argument:

```bash
# Aufruf mit gültigem Kürzel
./fach.sh D
# Ausgabe: Deutsch

./fach.sh BeS
# Ausgabe: Betriebssysteme

# Aufruf mit unbekanntem Kürzel
./fach.sh XYZ
# Ausgabe: Kürzel unbekannt
```

### 2. Stapelverarbeitung (`fach-rek.sh`)

Das Skript `fach-rek.sh` verarbeitet Eingaben zeilenweise über die Standardeingabe (`stdin`). Dadurch eignet es sich ideal für Datei-Umleitungen oder Pipes:

```bash
# Über Datei-Umleitung (Redirection)
./fach-rek.sh < input

# Über eine Pipeline
cat input | ./fach-rek.sh

# Interaktiv über ein Here-String / Echo
echo -e "D\nM\nAP" | ./fach-rek.sh
```

---

## Testdatensatz (`input`)

Die Datei `input` dient der Verifikation und demonstriert verschiedene Eingabefälle:

* **Reguläre Treffer:** `D`, `BeS`, `M`, `Math`, `E`, `AP`, `AnE`
* **Groß-/Kleinschreibung:** `BES` führt zu `Kürzel unbekannt`, da das Skript spezifisch `BS` oder `BeS` abfragt.
* **Nicht definierte Kürzel:** `AnW` (statt `An`/`AnE`/`AP`)
* **Ungültige Eingaben / Fehlerfälle:** `Joonge`, `NULL`

---

## Technische Hinweise (Zeilenenden / CRLF vs. LF)

Beim Ausführen unter Windows (z. B. via Git Bash oder WSL):
* Wenn die Datei `input` Windows-Zeilenenden (`CRLF` / `\r\n`) aufweist, liest `read kuerzel` das Carriage-Return-Zeichen (`\r`) als Teil des Strings mit ein.
* Dadurch schlägt der Vergleich fehl und alle Zeilen werden als `Kürzel unbekannt` interpretiert.
* **Lösung:** Datei mit Unix-Zeilenenden (`LF`) speichern oder vor der Übergabe bereinigen:
  ```bash
  tr -d '\r' < input | ./fach-rek.sh
  ```

