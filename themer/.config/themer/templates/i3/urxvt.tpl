URxvt*.faceName: {{ fontName.title() }}
URxvt*.faceSize: {{ fontSize }}
URxvt*.font: xft:{{ fontName.title() }}:pixelsize={{ fontSize }}
URxvt*.letterSpace: 0

URxvt*.clipboard.copycmd:  xsel -ib
URxvt*.clipboard.pastecmd: xsel -ob
URxvt*.cursorColor: {{ white }}
URxvt*.intensityStyles: false
URxvt*.depth: 32
URxvt*.urgentOnBell: true

URxvt*.scrollstyle: plain
URxvt*.scrollColor: #826d57
URxvt*.scrollBar_floating: true
URxvt*.scrollBar_right: true
URxvt*.internalBorder:

URxvt*.perl-ext-common:  default,custom_url,selection-to-clipboard,reload-colors

URxvt*.keysym.M-x: perl:reload-colors

URxvt*.dynamicColors: on

! URxvt*.background: {% if transparency %}[{{ transparency }}]{% endif %}{% if background %}{{ background }}{% else %}{{ black }}{% endif %}
URxvt*.background: [95]{% if background %}{{ background }}{% else %}{{ black }}{% endif %}
URxvt*.foreground: {% if foreground %}{{ foreground }}{% else %}{{ white }}{% endif %}
! black
URxvt*.color0: {{ black }}
URxvt*.color8: {{ alt_black }}
! red
URxvt*.color1: {{ red }}
URxvt*.color9: {{ alt_red }}
! green
URxvt*.color2: {{ green }}
URxvt*.color10: {{ alt_green }}
! yellow
URxvt*.color3: {{ yellow }}
URxvt*.color11: {{ alt_yellow }}
! blue
URxvt*.color4: {{ blue }}
URxvt*.color12: {{ alt_blue }}
! magenta
URxvt*.color5: {{ magenta }}
URxvt*.color13: {{ alt_magenta }}
! cyan
URxvt*.color6: {{ cyan }}
URxvt*.color14: {{ alt_cyan }}
! white
URxvt*.color7: {{ white }}
URxvt*.color15: {{ alt_white }}
! underline when default
URxvt*.colorUL: {% if underline %}{{ underline }}{% else %}{{ white }}{% endif %}
