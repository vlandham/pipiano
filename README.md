# PiPiano

Try to get a raspberry pi 3 to play midi when a keyboard is hooked up to it.

Primarily based on [Guide by Ted Felix](http://tedfelix.com/linux/linux-midi.html)

## Installation

Depends on a number of packages installed correctly on the Pi to work.

```
sudo apt-get install fluidsynth

# use aconnect to connect midi input to midi output
sudo apt-get install alsa-utils

sudo apt-get install jackd2
```
