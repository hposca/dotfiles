# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="philips"

# Installation instructions:
# First the fonts: https://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation
# Then the theme: https://github.com/bhilburn/powerlevel9k
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(longstatus time)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# To activate the zsh-syntax-highlighting plugin:
# cd ~/.oh-my-zsh/custom/plugins
# git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

plugins=(git vagrant aws colored-man-pages tmux colorize terraform zsh-syntax-highlighting docker zsh-autosuggestions)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

source $ZSH/oh-my-zsh.sh

# User configuration

export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

export EDITOR='nvim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# # Open tmux on every shell login
# # If not running interactively, do not do anything
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux -2

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# EDITOR='vim'

##############
# My aliases #
##############
alias lsd='ls -p | grep /$'
alias lr='ls -lahrt'
alias hist='history'
alias isotoday='date +%Y%m%d'
alias today='date +%d/%m/%Y'
alias hour='date +%H:%M:%S'
alias ff='find . -type f'
alias fd='find . -type d'
alias sl='ls'
alias kaw='ps aux | grep wine | awk '"'"'{print $2}'"'"' | xargs kill'
alias ccat='pygmentize -g -O style=monokai -f console256 -g'
alias ag='ag --hidden'

###############
# Git aliases #
###############

# 'Git Branch Hierarchy'
alias gbh="git log --graph --simplify-by-decoration --pretty=format:'%d' --all"
alias gbt="git log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gdv="git difftool --tool=vimdiff"
alias gs='gss'
alias gstsa="git stash save --all --include-untracked"
alias gmnff="git merge --no-ff --log"
alias gblame="git log -p -M --follow --stat --" # http://blog.andrewray.me/a-better-git-blame/
alias grhm="git reset --hard origin/master" # Useful to move the pointer to the newest master after fetching

###################
# Vagrant aliases #
###################
alias vup='vagrant up'
alias vst='vagrant status'
alias vdf='vagrant destroy -f'
alias vh='vagrant halt'
alias vsh='vagrant ssh'

###################
# Ansible aliases #
###################
alias ap="ansible-playbook"
alias ad="ansible-doc"

##################
# Docker aliases #
##################
alias d="docker"
alias di="docker image ls"
alias dps="docker container ls -a"
alias drm="docker container rm"
alias drma="docker container ls -aq | xargs docker container stop; docker container ls -aq | xargs docker rm"
alias drmi="docker image rm"
alias dclean="docker container prune --force; docker image prune --force"
alias dlv="docker volume ls"
alias dcv="docker volume prune --force"

alias dc="docker-compose"
alias dcbu="docker-compose build"
alias dcki="docker-compose kill"
alias dcps="docker-compose ps"
alias dcrm="docker-compose rm -f"
alias dcup="docker-compose up"
alias dcupd="docker-compose up -d"
alias dcrwb="docker-compose run --service-ports web /bin/sh"
alias dewb="docker exec -ti \$(docker-compose ps -q web) /bin/sh"
alias dclw="docker-compose logs web"

#################
# jq/yq aliases #
#################
# Alias to show all possible jq paths/hierarchy of a file
# Extracted from https://github.com/stedolan/jq/issues/243#issuecomment-45460474 and https://github.com/stedolan/jq/issues/243#issuecomment-48470943
alias jqh="jq -c 'path(..)|[.[]|tostring]|join(\"/\")'"
alias jquh="jq '[path(..)|map(if type==\"number\" then \"[]\" else tostring end)|join(\".\")|split(\".[]\")|join(\"[]\")]|unique|map(\".\"+.)|.[]'"
alias yqh="yq -c 'path(..)|[.[]|tostring]|join(\"/\")'"
alias yquh="yq '[path(..)|map(if type==\"number\" then \"[]\" else tostring end)|join(\".\")|split(\".[]\")|join(\"[]\")]|unique|map(\".\"+.)|.[]'"

# Directory stack configuration
DIRSTACKSIZE=7
setopt autopushd pushdminus pushdsilent pushdtohome
alias dirs='dirs -v'

# History

HISTFILE=~/.zhistfile
HISTSIZE=1000000
SAVEHIST=1000000

setopt INC_APPEND_HISTORY # append history as command are entered
setopt SHARE_HISTORY # share history between open shells
setopt APPEND_HISTORY # each zsh session, upon exiting, append to the history file
setopt EXTENDED_HISTORY # saves timestamps on history

######################################
# Application specific configuration #
######################################
export ANSIBLE_NOCOWS=1

# No password window for gpg
alias gpg='gpg --no-use-agent'

alias tmux='tmux -2'

export FZF_DEFAULT_COMMAND='ag -g ""'

###############
# Some tweaks #
###############
#
# Update prompt with current time when a command is started
# http://stackoverflow.com/questions/13125825/zsh-update-prompt-with-current-time-when-a-command-is-started
#
strlen () {
    FOO=$1
    local zero='%([BSUbfksu]|([FB]|){*})'
    LEN=${#${(S%%)FOO//$~zero/}}
    echo $LEN
}

# show right prompt with date ONLY when command is executed
preexec () {
    DATE=$( date +"[%H:%M:%S]" )
    local len_right=$( strlen "$DATE" )
    len_right=$(( $len_right+1 ))
    local right_start=$(($COLUMNS - $len_right))

    local len_cmd=$( strlen "$@" )
    local len_prompt=$(strlen "$PROMPT" )
    local len_left=$(($len_cmd+$len_prompt))

    RDATE="\033[${right_start}C ${DATE}"

    if [ $len_left -lt $right_start ]; then
        # command does not overwrite right prompt
        # ok to move up one line
        echo -e "\033[1A${RDATE}"
    else
        echo -e "${RDATE}"
    fi
}

vim() {
  [ -t 1 ] || { echo "Not starting vim without stdout to TTY!" >&2; return 1; }
  command vim "$@"
}

# Ctrl-Space to expand aliases
# Based on http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
  zle _expand_alias
  zle expand-word
}

zle -N globalias

bindkey "^ " globalias             # Ctrl-space to activate expansion
bindkey " " magic-space            # normal space
bindkey -M isearch " " magic-space # normal space during searches

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! -f ~/.awless_completion ]]; then
  awless completion zsh > ~/.awless_completion
fi
source ~/.awless_completion

