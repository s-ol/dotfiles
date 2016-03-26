import sys
from glob import glob
import re
from math import floor
from PIL import Image
from subprocess import check_output
from themer import ThemeActivator

class XrandrFix(ThemeActivator):
    def activate(self):
        output = check_output(['xrandr', '-q']).decode()

        size = tuple(int(x) for x in re.search(r'current (\d+) x (\d+)', output).group(1, 2))
        outputs = re.findall(r'^[0-9A-Za-z-]+ connected( primary)? (\d+)x(\d+)\+(\d+)\+(\d+)', output, re.MULTILINE)

        img = Image.open(glob(self.theme_dir + "/wallpaper.*")[0])
        out = Image.new(img.mode, size)

        for output in outputs:
          w, h, x, y = tuple(int(x) for x in output[1:])
          scale = max(w / img.width, h / img.height)
          tmp = img.resize((floor(img.width * scale), floor(img.height * scale),))
          box = ( (tmp.width - w)//2, (tmp.height - h)//2, w, h )
          box = (0, 0, box[2], box[3])
          out.paste(tmp.crop(box), (x, y))

        out.save(self.theme_dir + "/resized.png")
