function mmm-order
  find $argv -maxdepth 1 -type d ! -name '.*' -exec basename {} \;
end
