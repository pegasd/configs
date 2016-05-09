###
#  .zshrc
##
# zsh(1), zshmisc(1)
###

# ZSH-specific variables
cdpath=(~)
fpath=($fpath ~/.zsh/functions)
HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.history/zshhistory

# Set PATH
path=()
TPATH=(~/bin /loc/TWWfsw/bin /opt/ImageMagick/bin /usr/opt/csw/bin /usr/opt/csw/gcc3/bin /opt/local/pspdev/bin /opt/local/bin
  /opt/local/sbin /usr/local/bin /usr/local/sbin /bin /sbin /usr/bin /usr/sbin /usr/local/pspdev/bin
  /usr/games /usr/games/bin /usr/X11R6/bin /usr/X11R6/sbin /stand /opt/local/bin
  /usr/bin/X11 /usr/local/teTeX/bin /usr/local/sde/bin /Applications/Xcode.app/Contents/Developer/usr/bin)
for _d in $TPATH; do
  [ -d $_d ] && path=($path $_d)
done
unset _d
###
#path=($path .)
##
# This ^ is here for historical purposes only.
#
# Actually...
# It's also there as a reminder that you guys should NEVER put . in your path.
# Unless you want somebody to put a little 'rm -rf /' script in your $HOME and name it 'ls'.
###

# Additional files
. ~/.zsh/colors
. ~/.zsh/alenv
. ~/.zsh/keybind
. ~/.zsh/compdef
. ~/.zsh/prompt

# Options
setopt auto_cd				# cd even if 'cd' is omitted
setopt auto_pushd			# push directories onto a stack
setopt bad_pattern			# complain when pattern is incorrectly written
setopt cdable_vars			# cd if dir exists with var name provided
setopt extended_glob			# extended patterns
setopt extended_history			# put more info into history file
setopt hist_ignore_all_dups		# don't put dups into history
setopt hist_ignore_space		# ignore history items starting with ' '
setopt hist_no_store			# don't store "history" and "fc"
setopt multios				# output can be redirected multiple times
setopt no__correct			# don't correct command spelling errors
setopt no__nomatch			# don't complain about no match (e.g. *)
setopt no__beep				# don't beep
setopt prompt_sp			# output with no <CR> correctly displayed
setopt prompt_subst			# substitute variables inside prompt
setopt pushd_ignore_dups		# don't put dups onto the dir stack
setopt rm_star_silent			# don't complain at rm *

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
umask 002

# Return
return 0
