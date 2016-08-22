#!/bin/bash

# weird hack to get Jack to run headless.
export DISPLAY=':0'
eval dbus-launch --auto-syntax
export DBUS_SESSION_BUS_PID DBUS_SESSION_BUS_ADDRESS

# only setting found that doesn't sound terrible. Still has some delay
jackd -P70 -p16 -t2000 -d alsa --device hw:0 --rate 44100 -n 4 &

# others experimented with:
#jackd -P70 -p16 -t2000 -d alsa --device hw:0 -p 128 -n 3 -r 44100 -s &
#jackd -d alsa --device hw:0 --rate 44100 &

fluidsynth --server --no-shell --audio-driver=jack --connect-jack-outputs --reverb=0 --chorus=0 --gain=0.8 /usr/share/sounds/sf2/FluidR3_GM.sf2 &

if pgrep jackd && pgrep fluidsynth
then
	echo Audio Servers Running!!!
else
	echo !!!!!!!!!!! PROBLEM WITH SYNTH !!!!!!!!!!!!
fi
