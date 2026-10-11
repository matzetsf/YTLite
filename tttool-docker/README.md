# tttool im Docker

[tttool](https://github.com/entropia/tip-toi-reveng) 1.11 – eigene Inhalte für den tiptoi-Stift erstellen.
Enthalten: `tttool`, `espeak-ng` + `oggenc` (für `speak:`-Text-to-Speech), Vorlagen unter `/usr/share/tttool`.

## Bauen

```sh
docker build -t tttool:1.11 .
# oder
docker compose build
```

> Auf Apple Silicon (M1/M2/…) läuft das Image per Emulation (`--platform linux/amd64`), da tttool nur als x86-64-Binary veröffentlicht wird.

## Benutzen

```sh
cd work
../tttool.sh assemble beispiel.yaml      # -> beispiel.gme
../tttool.sh oid-codes beispiel.yaml     # -> PNG-Codes zum Drucken
../tttool.sh oid-table beispiel.yaml     # -> PDF mit allen Codes
../tttool.sh info beispiel.gme
```

Mit Compose (Ordner `work/` ist eingebunden):

```sh
docker compose run --rm tttool assemble beispiel.yaml
```

Danach die `.gme`-Datei auf den per USB angeschlossenen Stift kopieren.
Zum Drucken: OID-Codes mit 1200 dpi drucken, Druckerskalierung aus („Tatsächliche Größe“).

Handbuch (Deutsch): https://tttool.readthedocs.io/de/latest/ – auch im Image unter `/usr/share/doc/tttool/book.pdf`.
