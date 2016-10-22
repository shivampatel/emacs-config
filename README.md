# Emacs customizations


### Install on a new machine

- install emacs24 `sudo apt-get install emacs`
- install prelude. Install instructions at https://github.com/bbatsov/prelude
- uncomment relevant plugins in `sample/prelude-modules.el`
- start emacs `emacs -nw`. A bunch of compilations etc. will happen.
- Remove the empty personal folder created by prelude `rm -rf personal`
- git clone this directory into ~/.emacs.d/ as `git clone https://github.com/shivampatel/emacs-config personal`
- restart `emacs -nw`, let new stuff compile
- You are all Set

### Commit updates to personal config

- whenever a change is made to the personal files, commit and push back to origin master.
- inside personal directory: `git add .; git commit -avm 'updates'; git push`
