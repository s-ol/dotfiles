function mmm-resize
  pushd $argv[1]
  if [ -f 'hq: image$jpeg.jpg' ]
    convert 'hq: image$jpeg.jpg' -resize 1000x1000\> -quality 80 'image$jpeg.jpg'
    jpegoptim -s -S $argv[2] 'image$jpeg.jpg'
  else
    echo "no JPEG found in $argv[1]"
  end
  popd
end
