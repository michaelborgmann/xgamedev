#!/bin/bash
xrandr --newmode 1440x900_59.90 106.29 1440 1520 1672 1904 900 901 904 932 -HSync +VSync
xrandr --addmode VBOX0 1440x900_59.90
xrandr --output VBOX0 --mode 1440x900_59.90

sudo apt-get install vim tmux
sudo apt-get install git cmake build-essential mercurial
sudo apt-get install automake libtool
sudo apt-get install mesa-common-dev libgl1-mesa-dev # libglu1-mesa-dev
sudo apt-get install libreadline-dev
#sudo apt-get ia32-libs-sdl
