#!/bin/sh
# Ruft tttool im Docker-Container auf, mit dem aktuellen Verzeichnis als Arbeitsordner.
# Beispiel:  ./tttool.sh assemble buch.yaml
TTY=""; [ -t 0 ] && [ -t 1 ] && TTY="-it"
exec docker run --rm $TTY \
  --platform linux/amd64 \
  --user "$(id -u):$(id -g)" \
  -v "$PWD:/work" \
  tttool:1.11 "$@"
