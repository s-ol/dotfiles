dotfiles.git
============

These are my configuration files for my arch setup.
I use [themer](/s-ol/themer) to manage my themes, you will need to use `themer render all` and `themer activate [sometheme]` to get the configs in the right place.

Each folder in this repository is meant 
Most of the sub-configurations in directories in this repo are meant to be put at `"`, and you can symlink them there using `stow`:

    $ stow -t [dirname]
