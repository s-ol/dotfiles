powerline-daemon -q
set -gx POWERLINE /usr/lib/python3.5/site-packages/powerline/
set fish_function_path $fish_function_path $POWERLINE"bindings/fish"
powerline-setup

#thefuck --alias | .

#set -gx TERM xterm-256color
set -gx EDITOR vim
set -gx PAGER less
#set -gx PATH ~/.bin $PATH

set fish_color_autosuggestion "{{ alt_blue }}"
set fish_color_comment        "{{ alt_green }}"
set fish_color_command        "{{ blue }}"
set fish_color_valid_path     "{{ green }}"
set fish_color_cwd            "{{ alt_black }}"
set fish_color_error          "{{ alt_red }}"

gnome-keyring-daemon -sc ssh,secrets,pkcs11 | sed "s|^\(\w*\)=\(.*\)|set -gx \1 \2|" | source

set -gx WECHALLUSER S0lll0s
set -gx WECHALLTOKEN

function fish_greeting
  command echo ------
  set_color "{{ alt_red }}"
  fortune
  set_color normal
  command echo ------
  if [ -f ~/.note ]
    cat ~/.note | toilet
  end
end

# function vim; command vim -p $argv; end
function git; command hub $argv; end
function more; command less $argv; end
function toilet; command toilet -tffuture --metal $argv; end

function note; echo -e $argv > ~/.note; end
function done; rm ~/.note; end

function tunzip -d "unzip in a temporary directory"
  set -l dir (mktemp -d)
  command unzip $argv -d $dir
  cd $dir
end

function wallvid -d "loop a video as wallpaper" -w "mplayer"
  xwinwrap -ov -fs -- mplayer -nogui -nomouseinput -nosound -loop 0 -wid WID $argv
end

function timesum -d "sum time in format HHhMM"
  command awk -Fh '{ s+= ($1 * 60) + $2 } END {print s/60 "h"}'
end

function vulkan_dbg -d "set vulkan debugging layers"
  command env VK_INSTANCE_LAYERS=VK_LAYER_LUNARG_standard_validation VK_DEVICE_LAYERS=VK_LAYER_LUNARG_standard_validation $argv
end

function -e fish_preexec _run_fasd
  fasd --proc (echo $argv | tr -s ' ' \n)
end

function j
  set -l dir (fasd -de "printf %s" "$argv")
  if test "$dir" = ""
    echo "no matching directory"
    return 1
  end
  cd $dir
end

function e; fasd -fe vim "$argv"; end
function ve -w "vim"; vim --remote-silent $argv; end
function ves -w "vim"; vim --servername $argv[1] --remote-silent $argv[2..1-1]; end
function noblank -d "disable X blanking"; command xset s off -dpms; end
