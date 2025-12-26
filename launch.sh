#!/usr/bin/env bash

# Mata barras antigas
killall -q polybar

# Aguarda encerrar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Inicia a barra
polybar example &

