#!/bin/bash
# Cron for simple taskbar Pacman Updates script

# run pacman and dump listed pkg.tar.xz files to a log
sudo pacman -Syup --noprogressbar | grep "pkg.tar.xz" > $HOME/tmp/updates.log
