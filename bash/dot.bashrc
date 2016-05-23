###
#  .bashrc
##
# by PegaS
###

# Colors
E=$(printf "\e")
reset="$E[0m"
bold="$E[1m"
black="$E[30m"
red="$E[31m"
green="$E[32m"
yellow="$E[33m"
blue="$E[34m"
magenta="$E[35m"
cyan="$E[36m"
white="$E[37m"

# deploy: ssh -A && ssh-agent && (tmux || screen)
deploy() {
  if [[ -n "$SSH_AUTH_SOCK" ]]; then
    [[ -z "`pgrep -u $(whoami) ssh-agent | tail -n 1`" ]] && ssh-agent
    # @kshcherban \/
    ln -sf $(find /tmp -maxdepth 2 -type s -name "agent*" -user $USER -printf '%T@ %p\n' 2>/dev/null |sort -n|tail -1|cut -d' ' -f2) ~/.ssh/ssh_auth_sock
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

    cd /usr/local/share/deploy

    if [[ -x "`which tmux`" ]]; then
      tmux show 2> /dev/null && tmux attach || tmux
    else
      screen -r 2> /dev/null || screen -S deploy
    fi
  else
    echo 'SSH_AUTH_SOCK is not set. Did you forget to -A?'
  fi
}

# Options
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

# Completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
elif [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# VCS prompt
vcs_prompt() {
  # staged; unstaged; untracked colors
  ST_CLR="${green}"
  UNST_CLR="${bold}${yellow}"
  UNTR_CLR="${bold}${red}"

  hg_prompt
  git_prompt
  cvs_prompt

  if [[ -n "$VCS_NAME" ]]; then
    PR="${cyan}$VCS_NAME>${reset}"
    PR_LHS="${cyan}[${reset}"
    PR_RHS="${cyan}]${reset}"
    [[ -n "$VCS_STATE" ]] && PR_STATUS=" ${PR_LHS} ${VCS_STATE} ${PR_RHS}"
    PR_INFO="${PR_LHS}${VCS_INFO}${PR_RHS}"
    echo "$PR ${PR_INFO}${PR_STATUS} "
  fi
}

hg_prompt() {
  HG_BRANCH="`hg branch 2> /dev/null`"
  [ -z "$HG_BRANCH" ] && return

  HGST="`hg status 2> /dev/null`"
  [ -n "`echo "$HGST" | grep '^A'`" ] && PR_ST="${ST_CLR}A${reset}"
  [ -n "`echo "$HGST" | grep '^M'`" ] && PR_UNST="${UNST_CLR}M${reset}"
  [ -n "`echo "$HGST" | grep '^?'`" ] && PR_UNTR="${UNTR_CLR}C${reset}"
  VCS_NAME='hg'
  VCS_STATE="${PR_ST}${PR_UNST}${PR_UNTR}"
  VCS_INFO="${HG_BRANCH}"
}

git_prompt() {
  [ -z "`git rev-parse --is-inside-work-tree 2> /dev/null`" ] && return

  GIT_BRANCH="`git branch 2> /dev/null | grep '^*' | awk '{print $2}'`"

  GST="`git status --porcelain 2> /dev/null`"
  [ "`echo "$GST" | grep '^A'`" != "" ] && PR_ST="${ST_CLR}A${reset}"
  [ "`echo "$GST" | grep '^ M'`" != "" ] && PR_UNST="${UNST_CLR}M${reset}"
  [ "`echo "$GST" | grep '^??'`" != "" ] && PR_UNTR="${UNTR_CLR}C${reset}"
  VCS_NAME='git'
  VCS_STATE="${PR_ST}${PR_UNST}${PR_UNTR}"
  VCS_INFO="${GIT_BRANCH}"
}

cvs_prompt() {
  [ ! -d CVS ] && return

  VCS_NAME='cvs'
  VCS_INFO="`cat CVS/Repository`"
}

exit_status() {
  RC="$?"
  [ $RC != 0 ] && echo "< ${bold}${red}${RC}${reset} > "
}

whereami() {
  HOST="`hostname -f`"
  HOSTSHORT="`hostname -s`"
  if [[ "$HOST" =~ iponweb.net$ ]]; then
    echo "${cyan}$(echo $HOST | cut -d. -f1)${reset} [ ${bold}${yellow}$(echo $HOST | cut -d. -f2 | tr '[:lower:]' '[:upper:]')${reset} ]"
  else
    echo "${green}${HOSTSHORT}${reset}"
  fi
}

# Let's put it all together
export PS1='$(exit_status)${reset}${green}\u${reset} @ ${cyan}$(whereami)${reset} ${yellow}\w${reset}\n $(vcs_prompt)\$ '
export PS2='> '

# Aliases
case `uname 2> /dev/null` in
  Darwin|*BSD)
    alias ls="ls -FG"
    alias la="ls -FGA"
    alias l1="ls -FG1"
    alias ll="ls -FGAl"
    export LSCOLORS='dxfxexexcxexexbxhxhxdx'
    ;;
  Linux)
    alias ls="ls --color=always -F"
    alias la="ls --color=always -FA"
    alias l1="ls --color=always -F1"
    alias ll="ls --color=always -Fal"
    export LS_COLORS='no=00:fi=00:di=33:ln=35:pi=34:so=35:do=35:bd=35:cd=35:or=31:ex=32'
    ;;
esac

[ "`which vim 2> /dev/null`" = "" ] && alias v='vi' || alias v='vim'
alias ..='cd ..'
