function vbox_run
  vboxheadless -s $argv &
  cat
  VBoxManage controlvm $argv savestate
end
