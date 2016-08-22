#!/bin/bash

# Launch connect midi to fluidsynth.
# Based on a script by Antonio Bonifati.

# check for a 'Connecting To' to kill this if
# midi is already connected. This is a bad hack,
# as it will kill if _any_ midi is connected...

if aconnect -l | grep "Connecting To"
then
  echo "Exiting"
  exit
fi

# Use aconnect to get the ports

# 'keystation' is a keyword for my midi device. You might need something else.
vmpkport=$(aconnect -i | grep "Keystation" | cut -d ' ' -f 2)0
synthport=$(aconnect -o | grep "FLUID Synth" | cut -d ' ' -f 2)0

echo MIDI output port: $vmpkport
echo fluidsynth input port: $synthport

# Connect the ports
aconnect $vmpkport $synthport
