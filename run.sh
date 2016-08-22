#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting up PiPiano"

sleep 10
$DIR/fluidsynth.sh
sleep 5
$DIR/connect_midi.sh

while true
do
  $DIR/connect_midi.sh
  sleep 20
done
