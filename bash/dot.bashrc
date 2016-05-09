###
#  .bashrc
##
# by PegaS
###

# Colors
E=$(printf "\e")
bold="$E[1m"
reset="$E[0m"
black="$E[30m"
red="$E[31m"
green="$E[32m"
yellow="$E[33m"
blue="$E[34m"
magenta="$E[35m"
cyan="$E[36m"
white="$E[37m"

# VCS prompt
vcs_prompt() {
  echo "$(git_prompt)"
}

git_prompt() {

  # Quit right away if not inside working directory
  [ -z "`git rev-parse --is-inside-work-tree 2> /dev/null`" ] && return

  PR="${cyan}git>${reset}"
  PR_LHS="${cyan}[${reset}"
  PR_RHS="${cyan}]${reset}"

  GIT_BRANCH="`git branch 2> /dev/null | grep '^*' | awk '{print $2}'`"
  PR_BRANCH="${white}${GIT_BRANCH}${reset}"

  GST="`git status --porcelain 2> /dev/null`"
  [ "`echo "$GST" | grep '^A'`" != "" ] && PR_ST=" ${green}*${reset}"
  [ "`echo "$GST" | grep '^ M'`" != "" ] && PR_UNST=" ${yellow}*${reset}"
  [ "`echo "$GST" | grep '^??'`" != "" ] && PR_UNTR=" ${red}*${reset}"

  GIT_PROMPT="$PR ${PR_LHS}${PR_BRANCH}${PR_ST}${PR_UNST}${PR_UNTR}${PR_RHS} "
  echo "$GIT_PROMPT"
}

exit_status() {
  RC="$?"
  [ $RC != 0 ] && echo "${bold}${red}${RC}${reset} "
}

# Let's get it all together
export PS1='\n${green}\u${reset}@${green}\h${reset} ${yellow}\w${reset}\n $(exit_status)$(vcs_prompt)\$ '
export PS2='> '

# Aliases
case `uname 2> /dev/null` in
  Darwin)
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
