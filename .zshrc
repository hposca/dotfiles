# Path to your oh-my-zsh installation.
#
export ZSH=$HOME/.oh-my-zsh

# if [[ $(uname -s) == "Linux" ]]; then
#   # source /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh
#   fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
# fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# https://github.com/spaceship-prompt/spaceship-prompt/issues/1193
# SPACESHIP_PROMPT_ASYNC=false
# Or add an sleep in `async.zsh`'s `_async_job()` as suggested in
# https://github.com/spaceship-prompt/spaceship-prompt/issues/1193#issuecomment-1722579999
# In my case, adding `sleep 0.03` was enough
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE=true

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

# NOTE Install the nix-shell plugin with:
# git clone https://github.com/chisui/zsh-nix-shell.git $ZSH_CUSTOM/plugins/nix-shell
plugins=(1password aws colored-man-pages colorize direnv docker gh git golang helm kind kube-ps1 kubectl nix-shell tailscale terraform tmux tmuxinator vagrant zoxide zsh-autosuggestions zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# NOTE: mise's activation needs to happen before loading oh-my-zsh or else its plugins will not be able to find the executables.
# As an example, kubectl plugin wasn't being activated because it couldn't find the kubectl binary.
eval "$(/usr/bin/mise activate zsh)"
source $ZSH/oh-my-zsh.sh

# User configuration

# Download golang tar.gz from https://golang.org/dl/
# Then `tar -xvf the.tar.gz && sudo mv go /usr/local`
# export GOROOT=/usr/local/go
export GOROOT=/usr/lib/go
export GOPATH=$HOME/src/go
export PATH=/opt/asdf-vm/bin:/opt/google-cloud-cli/bin:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$HOME/.gloo/bin:$PATH

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
alias mkt='cd $(mktemp -d)'

###############
# Git aliases #
###############

# 'Git Branch Hierarchy'
alias gbh="git log --graph --simplify-by-decoration --pretty=format:'%d' --all"
alias gbt="git log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# alias gdv="git difftool --tool=vimdiff"
alias gs='gss'
alias gstsa="git stash save --all --include-untracked"
alias gmnff="git merge --no-ff --log"
alias gblame="git log -p -M --follow --stat --" # http://blog.andrewray.me/a-better-git-blame/
alias grhm="git reset --hard origin/master" # Useful to move the pointer to the newest master after fetching
# List all files in a directory in a git repository by last commit date
alias gfbd='git ls-tree --name-only HEAD ./ | while read filename; do echo "$(git log -1 --format="%ci " -- $filename) $filename"; done | sort -r'

##################
# GitHub Aliases #
##################
gh_prs_open() {gh search prs --author '@me' --sort=created --state=open --json=url | jq -r '.[].url'}
gh_prs_open_md() {gh search prs --author '@me' --sort=created --state=open --json=title,url,repository | jq -r '.[] | "- `" + .repository.name + "`: [" + .title + "](" + .url + ")"'}
gh_prs_all() {gh search prs --author '@me' --sort=created --json=url | jq -r '.[].url'}
gh_prs_all_md() {gh search prs --author '@me' --sort=created --json=title,url,repository | jq -r '.[] | "- `" + .repository.name + "`: [" + .title + "](" + .url + ")"'}

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

######################
# Kubernetes aliases #
######################
alias kc="switch"
alias kn="switch namespace"
alias s="switch"

#################
# jq/yq aliases #
#################
# Alias to show all possible jq paths/hierarchy of a file
# Extracted from https://github.com/stedolan/jq/issues/243#issuecomment-45460474 and https://github.com/stedolan/jq/issues/243#issuecomment-48470943
alias jqh="jq -c 'path(..)|[.[]|tostring]|join(\"/\")'"
alias jquh="jq '[path(..)|map(if type==\"number\" then \"[]\" else tostring end)|join(\".\")|split(\".[]\")|join(\"[]\")]|unique|map(\".\"+.)|.[]'"
# https://github.com/jqlang/jq/issues/243#issuecomment-880152966
alias jqhi="jq 'select(objects)|=[.] | map( paths(scalars) ) | map( map(select(numbers)=\"[]\") | join(\".\")) | unique'"
alias yqh="yq -c 'path(..)|[.[]|tostring]|join(\"/\")'"
alias yquh="yq '[path(..)|map(if type==\"number\" then \"[]\" else tostring end)|join(\".\")|split(\".[]\")|join(\"[]\")]|unique|map(\".\"+.)|.[]'"

# Directory stack configuration
DIRSTACKSIZE=7
setopt autopushd pushdminus pushdsilent pushdtohome
alias dirs='dirs -v'

# History

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt INC_APPEND_HISTORY # append history as command are entered
setopt SHARE_HISTORY # share history between open shells
setopt APPEND_HISTORY # each zsh session, upon exiting, append to the history file
setopt EXTENDED_HISTORY # saves timestamps on history

######################################
# Application specific configuration #
######################################
alias tmux='tmux -2'

# Tig supports the same order flags as `git log`
# https://github.com/jonas/tig/issues/497#issuecomment-214261777
alias tiga='tig --all' # --topo-order
alias tigad='tig --all --date-order'
alias tigat='tig --all --topo-order'
alias tigaad='tig --all --author-date-order'


###############
# Some tweaks #
###############

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

# Ctrl-U as normal Ctrl-U
# https://stackoverflow.com/questions/3483604/which-shortcut-in-zsh-does-the-same-as-ctrl-u-in-bash/3483679#3483679
bindkey \^U backward-kill-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Loading autocomplete for gcloud
# [ -f /opt/google-cloud-cli/completion.zsh.inc ] && source /opt/google-cloud-cli/completion.zsh.inc

# If you want to have a cool aws profile picker
# https://gist.github.com/cm-watanabeseigo/0a103315529d502ce4a82d2a8aab6cd3
# https://dev.classmethod.jp/articles/201912-aws-profiler-selector-for-zsh/
# https://dev.classmethod.jp/articles/my-perfect-aws_profile-environment/
# if [ -f ~/.bash_profile_aws-profile ]; then
#   . ~/.bash_profile_aws-profile
# fi

# Loading NVM
#source /usr/share/nvm/init-nvm.sh

#######################
# Ancillary functions #
#######################

function copy_current_directory_path() {
  echo "$(pwd)/" | tr -d '\n' | xclip -selection clipboard
}

alias ccd="copy_current_directory_path"

function copy_file_path() {
  _file="${1}"
  readlink -f "${_file}" | tr -d '\n' | xclip -selection clipboard
}

alias cfp="copy_file_path"

function copy_file_content() {
  _file="${1}"
  cat "${_file}" | xclip -selection clipboard
}

alias cfc="copy_file_content"

function paste_to_file() {
  _file="${1}"
  if [ -z "${_file}" ]; then
    echo "You need to provide a file as an argument"
    return 1
  fi
  xclip -selection clipboard -o > "${_file}"
}

function copy() {
  xclip -selection clipboard
}

function paste() {
  xclip -o -selection clipboard
}

function open() {
  _file="${1}"
  xdg-open "${_file}" &
}

# Converts the clipboard contents to markdown
function md_from_html() {
  pandoc --from html --to markdown <(xclip -selection clipboard -t text/html -out)
}

# Copies a markdown to html, ready to be pasted as an email
function md_to_html() {
  _file="${1}"
  if [ -z "${_file}" ]; then
    echo "You need to provide a markdown file as argument"
    return 1
  fi
  pandoc --from markdown --to html <(cat "${_file}") | xclip -selection clipboard -t text/html
  echo "HTML content stored in the clipboard"
}

###################
# NeoVim Switcher #
###################
# From:
# - https://www.youtube.com/watch?v=LkHjJlSgKZY
# - https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b

# The nvim configuration names should be directories in ~/.config
# As an example, to install AstroNvim:
# git clone --depth 1 https://github.com/AstroNvim/template ~/.config/AstroNvim
# And for LazyVim:
# git clone --depth 1 https://github.com/LazyVim/starter ~/.config/LazyVim
# git clone --depth 1 https://github.com/NvChad/starter ~/.config/NvChad
# git clone --depth 1 https://github.com/nvim-lua/kickstart.nvim ~/.config/kickstart
# git clone --depth 1 https://github.com/CosmicNvim/CosmicNvim.git ~/.config/CosmicNvim
# NOTE: The default configuraiton uses ~/.config/nvim/
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-cosmic="NVIM_APPNAME=CosmicNvim nvim"
alias lavim="NVIM_APPNAME=LazyVim nvim"
alias avim="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  # items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim" "CosmicNvim")
  items=("default" "AstroNvim" "LazyVim" "NvChad" "kickstart" "CosmicNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# bindkey -s ^a "nvims\n"

function update_lazy_vim() {
  echo "Will update LazyVim..."
  NVIM_APPNAME=LazyVim nvim --headless "+Lazy! sync" +qa
  echo "LazyVim updated!"
}

function full_reinstall_lazy_vim() {
  echo "Will purge LazyVim loaded packages..."

  echo "Size of LazyVim packages:"
  du -hs "${HOME}/.local/share/LazyVim"

  rm -rf "${HOME}/.local/share/LazyVim"
  update_lazy_vim

  echo "Size of LazyVim packages:"
  du -hs "${HOME}/.local/share/LazyVim"
}

# Activate direnv
#eval "$(direnv hook zsh)"

# Shortcuts to display PRs in github ready to be copy+pasted
gh_prs_open() {gh search prs --author '@me' --sort=created --state=open --json=url | jq -r '.[].url'}
gh_prs_open_md() {gh search prs --author '@me' --sort=created --state=open --json=title,url,repository | jq -r '.[] | "- `" + .repository.name + "`: [" + .title + "](" + .url + ")"'}
gh_prs_all() {gh search prs --author '@me' --sort=created --json=url | jq -r '.[].url'}
gh_prs_all_md() {gh search prs --author '@me' --sort=created --json=title,url,repository | jq -r '.[] | "- `" + .repository.name + "`: [" + .title + "](" + .url + ")"'}

# eval "$(zoxide init zsh)"
# eval "$(direnv hook zsh)"
# source <(tailscale completion zsh)
source <(just --completions zsh)
if command -v jj >/dev/null 2>&1 ; then
  source <(jj util completion zsh)
fi

#
# Install switcher following the instructions from https://github.com/danielfoehrKn/kubeswitch/blob/master/docs/installation.md
# OS=linux                        # Pick the right os: linux, darwin (intel only)
# VERSION=0.9.3                   # Pick the current version.
#
# curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${OS}_amd64
# chmod +x /usr/local/bin/switcher
#
if command -v switcher >/dev/null 2>&1 ; then
  source <(switcher init zsh)
  source <(switcher completion zsh)
fi
