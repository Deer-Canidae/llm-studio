#!/bin/sh
# Copyright 2025 Deer_Canidae https://github.com/Deer-Canidae

pull_models() {
  while read -r MODEL_LINE ; do
    if printf '%s' "$MODEL_LINE" | grep -E '(^\s*#)|(^\s*$)' > /dev/null ; then
      continue
    fi

    echo pulling "$MODEL_LINE"
    if ollama pull "$MODEL_LINE" ; then
      echo pulled "$MODEL_LINE" sucessfully
    else
      echo pulling "$MODEL_LINE" failed
    fi
  done
}

gracefull_exit() {
  echo 'cleaning up ressources'
  kill -s TERM "$OLLAMA_SERVE_PID"
}

ollama serve &
OLLAMA_SERVE_PID="$!"

trap gracefull_exit TERM
trap gracefull_exit INT

sleep 3

pull_models < ./ensure-installed.txt

while ps "$OLLAMA_SERVE_PID" >/dev/null ; do
  wait "$OLLAMA_SERVE_PID"
done

echo exiting
