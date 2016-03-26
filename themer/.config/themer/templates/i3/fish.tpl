powerline-daemon -q
set -gx POWERLINE /usr/lib/python3.5/site-packages/powerline_status-(pip freeze 2>/dev/null | grep powerline | cut -c 20- | tr - _)-py3.5.egg/
set fish_function_path $fish_function_path $POWERLINE"powerline/bindings/fish"
powerline-setup

thefuck --alias | .

set -gx TERM xterm-256color
set -gx EDITOR vim
set -gx PAGER less
set -gx PATH ~/.bin $PATH

set fish_color_autosuggestion "{{ alt_blue }}"
set fish_color_comment        "{{ alt_green }}"
set fish_color_command        "{{ blue }}"
set fish_color_valid_path     "{{ green }}"
set fish_color_cwd            "{{ alt_black }}"
set fish_color_error          "{{ alt_red }}"

if status --is-interactive
  eval (keychain --agents ssh --eval -Q --quiet ~/.ssh/id_rsa ~/.ssh/id_rsa-aur | sed "s/ and//g")
else
  eval (keychain --agents ssh --eval -Q --quiet --noask ~/.ssh/id_rsa ~/.ssh/id_rsa-aur | sed "s/ and//g")
end
set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK[1]
# gnome-keyring-daemon | sed "s|^\(\w*\)=\(.*\)|set \1 \2|" | source 

#set -l envfile "$HOME/.cache/gnome-keyring.env"
#if not pgrep -f 'gnome-keyring-daemon.*components.*gpg,ssh,secrets' > /dev/null
#  killall gnome-keyring-daemon
#  gnome-keyring-daemon --start --components=gpg,ssh,secrets > $envfile
#end
#set var_set (cat "$envfile" |  sed -e 's/^\(.*\)/set -x \\1/' -e 's/=/ /' -e 's/\(.*\)$/\1;/')
#eval $var_set

set -gx WECHALLUSER S0lll0s
set -gx WECHALLTOKEN

function fish_greeting
  command echo ------
  set_color "{{ alt_red }}"
  fortune -a 4% clockwork all
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

function wallvid -d "loop a video as wallpaper"
  xwinwrap -ov -fs -- mplayer -nogui -nomouseinput -nosound -loop 0 -wid WID $argv
end


function noblank -d "disable X blanking"; command xset s off -dpms; end

function timesum -d "sum time in format HHhMM"; command awk -Fh '{ s+= ($1 * 60) + $2 } END {print s/60 "h"}'; end

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

function e
  fasd -fe vim "$argv"
end

function ve
  vim --remote-silent $argv
end

function ves
  vim --servername $argv[1] --remote-silent $argv[2..1-1]
end
