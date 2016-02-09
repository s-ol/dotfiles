#!/bin/bash

current=$(pacmd info | awk '/active profile: </{print $NF}')

if [[ $current == *"hdmi"* ]]; then
  pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo
else
  pacmd set-card-profile 0 output:hdmi-stereo+input:analog-stereo
fi
