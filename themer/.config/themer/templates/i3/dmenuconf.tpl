#!/bin/bash

margin=180
read width height <<<$(i3-msg -t get_workspaces | jq -r 'map(select(.focused))[0].rect["width","height"]')

echo -w `expr $width - $margin '*' 2` -h 38 -x $margin -y `expr $height / 2 - 100` -nb "{{ black }}" -nf "{{ tertiary }}" -sb "{{ secondary }}" -sf "{{ black }}"
