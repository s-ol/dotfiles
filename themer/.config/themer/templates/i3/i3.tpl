set $mod Mod4

set $background {{ black }}
set $foreground {{ white }}
set $gray       {{ alt_black }}
set $primary    {{ primary }}
set $secondary  {{ secondary }}
set $tertiary   {{ tertiary }}
set $warning    {{ special }}

set $ws1  "1: ⚛ www"
set $ws2  "2: ☢ term"
set $ws3  "3: ☣ work"
set $ws4  "4: ✉ comm"
set $ws5  "5: stm"
set $ws6  "6: game"
set $ws7  "7: 7"
set $ws8  "8: music"
set $ws9  "9: media"
set $ws10 "10:10"

workspace $ws1 output HDMI1
workspace $ws2 output HDMI1
workspace $ws3 output HDMI1
workspace $ws6 output HDMI1
workspace $ws4 output DVI-I-1
workspace $ws5 output DVI-I-1
workspace $ws8 output LVDS1
workspace $ws9 output LVDS1

focus_follows_mouse yes

set     $gaps_inner 30
set     $gaps_outer 40
set $alt_gaps_inner 20
set $alt_gaps_outer 0

gaps inner $gaps_inner
gaps outer $gaps_outer

workspace $ws8 gaps outer $alt_gaps_outer
workspace $ws9 gaps outer $alt_gaps_outer
workspace $ws8 gaps inner $alt_gaps_inner
workspace $ws9 gaps inner $alt_gaps_inner

mode "gaps" {
  bindsym plus gaps inner current plus 5
  bindsym minus gaps inner current minus 5
  bindsym Shift+plus gaps outer current plus 5
  bindsym Shift+minus gaps outer current minus 5

  bindsym 0 gaps inner current set 0; gaps outer current set  0
  bindsym Shift+0 gaps inner current set $gaps_inner; gaps outer current set $gaps_outer
  bindsym $mod+Shift+0 gaps inner current set $alt_gaps_inner; gaps outer current set $alt_gaps_outer

  bindsym Return mode "default"
  bindsym Escape mode "default"
}


font pango:DejaVu Sans Mono 8

exec --no-startup-id /usr/gnome-settings-daemon/gnome-settings-daemon
exec --no-startup-id urxvtd -q -f -o
exec_always --no-startup-id hsetroot -tile ~/.config/themer/current/resized.png

exec_always --no-startup-id pkill -f 'python .*powerline-lemonbar\.py'
exec_always --no-startup-id sleep 1 && ~/.config/i3/powerline-lemonbar.py --i3 --height 16 -- -f "{{ fontName }}-9" -f Icon-9
exec_always --no-startup-id killall compton; compton

# exec_always --no-startup-id xset m 10/10 9999 r rate 200 27
# exec_always --no-startup-id setxkbmap de nodeadkeys -option compose:caps

floating_modifier $mod

bindsym $mod+Shift+q kill

bindsym $mod+Return exec urxvtc
bindsym $mod+Shift+Return exec urxvtc -name float -geometry 200x45
bindsym $mod+p exec chromium
bindsym $mod+m exec urxvtc -name float -geometry 200x45 -e ncmpcpp
bindsym $mod+o exec urxvtc -name float -geometry 200x45 -depth 0 -e ranger
bindsym $mod+d exec --no-startup-id dmenu_run -p "Launch:" $(~/.config/i3/dmenuconf)
bindsym $mod+Shift+d exec --no-startup-id gksudo $(dmenu -p "Sudo:" $(~/.config/i3/dmenuconf))
bindsym $mod+i exec --no-startup-id keepmenu

bindsym $mod+Shift+t   exec --no-startup-id i3-msg mark "$(dmenu -noinput -p "Mark:" $(~/.config/i3/dmenuconf))"
bindsym $mod+Control+t exec --no-startup-id i3-msg unmark "$(i3-msg -t get_marks | jq -r .[] | dmenu -p "Unmark:" $(~/.config/i3/dmenuconf))"
#bindsym $mod+t         exec --no-startup-id i3-msg [con_mark=\"$(i3-msg -t get_marks | jq -r .[] | dmenu -p "Goto:" $(~/.config/i3/dmenuconf))\"] focus
bindsym $mod+t         exec --no-startup-id i3-msg [con_mark=\"$(i3-msg -t get_marks | jq -r .[] | dmenu -p "Goto:" $(~/.config/i3/dmenuconf))\"] scratchpad show

bindsym $mod+u sticky toggle

bindsym Print exec --no-startup-id maim ~/maim-$(date +%F_%T).png
bindsym Shift+Print exec --no-startup-id maim -sun ~/maim-$(date +%F_%T).png
bindsym $mod+Print exec --no-startup-id maim -sun | xclip -selection clipboard -t image/png

bindsym $mod+h focus left
bindsym $mod+l focus right
bindsym $mod+k focus up
bindsym $mod+j focus down

bindsym $mod+Shift+l move right
bindsym $mod+Shift+h move left
bindsym $mod+Shift+k move up
bindsym $mod+Shift+j move down

# bindsym $mod+Left focus left
# bindsym $mod+Down focus down
# bindsym $mod+Up focus up
# bindsym $mod+Right focus right

# bindsym $mod+Shift+Left move left
# bindsym $mod+Shift+Down move down
# bindsym $mod+Shift+Up move up
# bindsym $mod+Shift+Right move right

bindsym $mod+Control+l move workspace to output right
bindsym $mod+Control+h move workspace to output left
# bindsym $mod+Control+Right move workspace to output right
# bindsym $mod+Control+Left move workspace to output left

# bindsym $mod+h split h
bindsym $mod+v split v

bindsym $mod+f fullscreen

bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

bindsym $mod+space focus mode_toggle
bindsym $mod+Shift+space floating toggle

bindsym $mod+b mode "gaps"

bindsym $mod+a focus parent
#bindsym $mod+d focus child

bindsym $mod+1 workspace $ws1; [con_mark="ontop"] move workspace current;
bindsym $mod+2 workspace $ws2; [con_mark="ontop"] move workspace current;
bindsym $mod+3 workspace $ws3; [con_mark="ontop"] move workspace current;
bindsym $mod+4 workspace $ws4; [con_mark="ontop"] move workspace current;
bindsym $mod+5 workspace $ws5; [con_mark="ontop"] move workspace current;
bindsym $mod+6 workspace $ws6; [con_mark="ontop"] move workspace current;
bindsym $mod+7 workspace $ws7; [con_mark="ontop"] move workspace current;
bindsym $mod+8 workspace $ws8; [con_mark="ontop"] move workspace current;
bindsym $mod+9 workspace $ws9; [con_mark="ontop"] move workspace current;
bindsym $mod+0 workspace $ws10; [con_mark="ontop"] move workspace current;
bindsym $mod+Tab workspace back_and_forth; [con_mark="ontop"] move workspace current;

bindsym $mod+Control+Shift+Left move window to workspace prev
bindsym $mod+Control+Shift+Right move window to workspace next

bindsym $mod+Control+Shift+Prior move container to output left
bindsym $mod+Control+Shift+Next move container to output right

bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

bindsym XF86AudioLowerVolume exec --no-startup-id pulseaudio-ctl down
bindsym XF86AudioRaiseVolume exec --no-startup-id pulseaudio-ctl up
bindsym XF86AudioPause exec --no-startup-id mpc toggle
bindsym XF86AudioMute exec --no-startup-id pulseaudio-ctl mute
bindsym XF86AudioPrev exec --no-startup-id mpc prev
bindsym XF86AudioNext exec --no-startup-id mpc next
bindsym XF86HomePage exec --no-startup-id mpc volume -1
bindsym XF86Explorer exec --no-startup-id mpc volume +1

bindsym $mod+XF86AudioMute exec --no-startup-id ~/.config/i3/pa-toggleoutput.sh
bindsym $mod+XF86Explorer exec pavucontrol

#                       BORDER      BACKGROUND  TEXT        INDICATOR
client.focused          $primary    $primary    $background $primary
client.focused_inactive $background $background $foreground $background
client.unfocused        $gray       $gray       $background $secondary
client.urgent           $warning    $warning    $foreground $warning

for_window [class="^.*"] border pixel 4
#for_window [class="(?i)urxvt"] border pixel 3

assign [class="Skype"] $ws4
assign [title="^WhatsApp Web$"] $ws4
assign [title="^irssi"] $ws4
assign [class="Teamspeak"] $ws4
assign [class="Steam"] $ws5
assign [class="csgo_linux"] $ws6
assign [class="FrozenSynapse"] $ws6
assign [instance="Hearthstone.exe"] $ws6

for_window [class="Steam" title="Chat$"] floating enable
for_window [title="^lava$"] floating enable
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [instance="float"] floating enable

bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
bindsym $mod+Control+e exec ~/.config/i3/py3lock.py

mode "resize" {
  bindsym j resize grow down 10 px or 5 ppt
  bindsym l resize grow right 10 px or 5 ppt
  bindsym h resize shrink right 10 px or 5 ppt
  bindsym k resize shrink down 10 px or 5 ppt

  bindsym Shift+k resize grow up 10 px or 5 ppt
  bindsym Shift+h resize grow left 10 px or 5 ppt
  bindsym Shift+l resize shrink left 10 px or 5 ppt
  bindsym Shift+j resize shrink up 10 px or 5 ppt

  bindsym Left resize shrink width 10 px or 5 ppt
  bindsym Down resize grow height  10 px or 5 ppt
  bindsym Up resize shrink height  10 px or 5 ppt
  bindsym Right resize grow width  10 px or 5 ppt

  bindsym Return mode "default"
  bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

bindsym $mod+Shift+minus move scratchpad
bindsym $mod+minus scratchpad show
