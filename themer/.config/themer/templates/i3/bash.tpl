#!/bin/bash

background="{% if background %}{{ background }}{% else %}{{ black }}{% endif %}"
foreground="{% if foreground %}{{ foreground }}{% else %}{{ white }}{% endif %}"

color0="{{ black }}"
color8="{{ alt_black }}"
color1="{{ red }}"
color9="{{ alt_red }}"
color2="{{ green }}"
color10="{{ alt_green }}"
color3="{{ yellow }}"
color11="{{ alt_yellow }}"
color4="{{ blue }}"
color12="{{ alt_blue }}"
color5="{{ magenta }}"
color13="{{ alt_magenta }}"
color6="{{ cyan }}"
color14="{{ alt_cyan }}"
color7="{{ white }}"
color15="{{ alt_white }}"
