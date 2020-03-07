function xrandr-mirror
  set -l res $argv[1]
  if not count $argv >/dev/null
    set res 1920x1080
  end

  echo "setting up xrandr mirroring at $res"
  xrandr --fb $res \
    --output HDMI1 --mode $res --scale 1x1 \
    --output LVDS1 --scale-from $res --same-as HDMI1
end
