dotfiles.git
============

These are my configuration files for my arch setup.
I use [themer](/s-ol/themer) to manage my themes, you will need to use `themer render all` and `themer activate [sometheme]` to get the configs in the right place.

Each folder in this repository is meant 
Most of the sub-configurations in directories in this repo are meant to be put at `~`, and you can symlink them there using `stow`:

    $ stow -t ~ [config]

The others are meant to be stowed at the filesystem root, like so:

    $ stow -t / [config]
    
You can tell which by looking at the directory contents.
Configs containing `.config` etc. are for the user dir, configs containing `etc`, `usr` and so on are system-wide.
