###
#  .zshrc
##
# zshall(1)
# github.com/robbyrussell/oh-my-zsh
###

# History
HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.history/zshhistory

# Various PATHs
# Don't _ever_ do this: path=($path .)
cdpath=(~)
fpath=($fpath ~/.zsh/functions)
path=()
for PDIR in ~/bin \
  /opt/local/bin  /bin  /usr/bin  /usr/local/bin     \
  /opt/local/sbin /sbin /usr/sbin /usr/local/sbin    \
  /usr/games /usr/games/bin /stand                   \
  /usr/bin/X11 /usr/X11R6/bin /usr/X11R6/sbin        \
  /usr/local/sde/bin                                 \
  /Applications/Xcode.app/Contents/Developer/usr/bin
do
  [ -d $PDIR ] && path=($path $PDIR)
done

# Additional files
. ~/.zsh/colors
. ~/.zsh/alenv
. ~/.zsh/keybind
. ~/.zsh/compdef
. ~/.zsh/prompt
[ -f ~/.zsh/private ] && . ~/.zsh/private

# Options
setopt auto_cd              # cd even if 'cd' is omitted
setopt auto_pushd           # push directories onto a stack
setopt bad_pattern          # complain when pattern is incorrectly written
setopt cdable_vars          # cd if dir exists with var name provided
setopt extended_glob        # extended patterns
setopt extended_history     # put more info into history file
setopt hist_ignore_all_dups # don't put dups into history
setopt hist_ignore_space    # ignore history items starting with ' '
setopt hist_no_store        # don't store "history" and "fc"
setopt multios              # output can be redirected multiple times
setopt no__correct          # don't correct command spelling errors
setopt no__nomatch          # don't complain about no match (e.g. *)
setopt no__beep             # don't beep
setopt prompt_sp            # output with no <CR> correctly displayed
setopt prompt_subst         # substitute variables inside prompt
setopt pushd_ignore_dups    # don't put dups onto the dir stack
setopt rm_star_silent       # don't complain at rm *

# Locale & umask
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
umask 002

# Return
return 0
