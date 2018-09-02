# zmodload zsh/zprof

# Aliases
alias p='ping 8.8.8.8'
function diff { git diff --no-index $1 $2 }
## cd git repo root directory
alias rr='cd $(git rev-parse --show-toplevel)'
function gopkg {
    cd $GOPATH/src/$1
}

function repo {
    cd $HOME/repos/$1
}

function whoseport {
    lsof -nPi:$1
}

# VIM
if which gvim > /dev/null; then
    VIM_SERVER_NAME='myserver'
    alias vim='gvim --servername $VIM_SERVER_NAME'
    alias v='gvim --servername $VIM_SERVER_NAME --remote'
else
    alias v='vim'
fi
alias vdiff='vim -d'

# Git
function watchrepo {
  while :; do
    clear
    date
    git lg --color | head -n $((LINES - 2))
    if [ $(date "+%S") -eq 0 ]; then
      git fetch
    fi
    sleep 1
  done;
}

# Suffix aliases are supported in zsh since version 4.2.0.
TEXT_FILES_SUFFIXES=(c cpp h go txt conf cfg ini md html css json yml yaml toml)
for suffix in ${TEXT_FILES_SUFFIXES[@]}; do
    alias -s "$suffix"=vim
done

ARCHIVE_FILES_SUFFIXES=(tar gz zip)
for suffix in ${ARCHIVE_FILES_SUFFIXES[@]}; do
    alias -s "$suffix"=file-roller
done

# Global aliases.
# Substituted anywhere on a line.
alias -g G='|grep'
alias -g W='while :; do'

# Youtube-dl
alias yd='youtube-dl \
  --write-sub \
  --write-description \
  --write-thumbnail \
  --sub-format srt \
  --sub-lang en \
  -o "%(uploader)s/%(title)s/%(title)s-%(id)s.%(ext)s"'
alias yd_mp3='yd -x --audio-format mp3'
alias yd_wav='yd -x --audio-format wav'

# Power
alias lock='gnome-screensaver-command -l'
alias safe-suspend='lock && sudo pm-suspend-hybrid'
alias hibernate='lock && sudo pm-hibernate'

# Docker
alias composer='docker run --rm -u $UID:$GID -v $(pwd):/app composer/composer'
alias php='docker run --rm -ti php:7'
alias cleanup_docker='docker ps -aq | xargs docker rm'
alias cleanup_docker_images='docker rmi $(docker images --quiet --filter "dangling=true")'
alias container-ip='docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'

# Epitech
alias blih='blih -u baudra_a'
alias ns_auth='ns_auth -u baudra_a'
alias emacs='emacs -nw'

# ls
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -alh'

# temp dir
alias tmp='cd $(mktemp -d)'


# Watch
# -d Highlight the differences between successive updates.
# -c Interpret ANSI color and style sequences.
alias watch='watch -dc'

# Stop noisy hard drive
alias ftg='sudo hdparm -Y /dev/sda && sudo hdparm -C /dev/sda'

# Use Vim as default editor
export EDITOR=vim

# Use vim as man pager: http://vim.wikia.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
export MANPAGER="/bin/sh -c \"col -b -x | \
  vim  -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
  -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
  -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export MANWIDTH=90

export BROWSER="firefox"

# Node.js
export NODE_ENV=development

# NVM Lazyload
# https://www.reddit.com/r/node/comments/4tg5jg/lazy_load_nvm_for_faster_shell_start/d5ib9fs/
export NVM_DIR="$HOME/.nvm"

if [ -d "$NVM_DIR" ]; then
  declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
  NODE_GLOBALS+=("node" "nvm")

  load_nvm () {
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  }
  for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
  done
else
    echo "Warning: nvm not installed! (not found in $NVM_DIR)"
fi

# Opam OCaml package manager
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

alias json='jq'

function loop {
  echo "→ while :; do $@; done"
  while :; do eval $@; done
}

# robbyrussell/oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_CUSTOM="$HOME/dotfiles/zsh_custom"

# Hide username in prompt
DEFAULT_USER="$USER"

plugins=(httpie gitfast git-extras rsync golang kubectl docker docker-compose helm man terraform)

source $ZSH/oh-my-zsh.sh

# Termbin
alias termbin='ncat termbin.com 9999'

# Use Ctrl-U Remove everything before cursor
bindkey \^U backward-kill-line

# Java
export PATH="/usr/lib/jvm/jdk1.8.0/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

# Golang
export GOPATH=$HOME/repos/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
alias gosrc='cd $GOPATH/src'


# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# https://github.com/dvorka/hstr
export HISTFILE=$HOME/.zsh_history
export HH_CONFIG=hicolor
bindkey -s "\C-r" "\eqhh\n"

alias kubectl='http_proxy="" kubectl'
alias k='kubectl'

# zprof
