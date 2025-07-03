# profiling tool - uncomment zprof at bottom of file too.
# zmodload zsh/zprof

# Smarter completion initialization
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/bin/gam:/usr/local/bin:$HOME/.chefdk/gem/ruby/2.4.0/bin:$HOME/goroot/bin:$HOME/go/bin:$HOME/Library/Python/3.9/lib/python/site-packages:$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ian.ta/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  you-should-use
#  aws
  zsh-autosuggestions
  kubectl
  zsh-z
  autoupdate
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias groot="cd $(git rev-parse --show-toplevel)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# Source chtf
if [[ -f /usr/local/opt/chtf/share/chtf/chtf.sh ]]; then
  source "/usr/local/opt/chtf/share/chtf/chtf.sh"
 fi

eval "$(direnv hook zsh)"

proxy_on () {
        export HTTP_PROXY=http://a-proxy-p.bc.jsplc.net:8080
        export HTTPS_PROXY=http://a-proxy-p.bc.jsplc.net:8080
        export NO_PROXY=localhost,127.0.0.1,.dev,.internal,.local,.jsplc.net,.jstest1.net,.jstest2.net,.jstest3.net,.devjsplc.net,.jhblkf.jsgrp,.blk.js.com,.ishapay.net,.iphapay.net,sts.sainsburys.co.uk,.microsoftonline.com
        export http_proxy=$HTTP_PROXY
        export https_proxy=$HTTPS_PROXY
        export no_proxy=$NO_PROXY
        networksetup -setdnsservers Wi-Fi 10.128.64.182 10.28.64.182 10.128.135.18 10.154.221.12 10.12.147.222 1.1.1.1
}

proxy_off () {
        unset HTTP_PROXY
        unset HTTPS_PROXY
        unset http_proxy
        unset https_proxy
        networksetup -setdnsservers Wi-Fi 10.12.147.222 1.1.1.1
}

groot () {
	cd $(git rev-parse --show-toplevel)
}

export KITCHEN_LOCAL_YAML=.kitchen.cloud.infratest.blackfriars.yml

#eval "$(chef shell-init zsh)"

eval `ssh-agent -s`
#ssh-add -K ~/.ssh/id_rsa

#export PATH="/usr/local/opt/openssl/bin:$PATH"
#export PATH="/usr/local/opt/libressl/bin:$PATH"

#export VIRTUALENVWRAPPER_SCRIPT=virtualenvwrapper.sh
#source $VIRTUALENVWRAPPER_SCRIPT

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

export AWS_DEFAULT_REGION=eu-west-1

aal() {
  local profile=$1
  export AWS_PROFILE=$1
  export AWS_DEFAULT_REGION=eu-west-1
  aws-azure-login --no-prompt
}

aga() {
  proxy_off
  local profile=$1
  export AWS_PROFILE=$1
  export AWS_DEFAULT_REGION=eu-west-1
  export GOOGLE_USERNAME=ian.ta@dae.mn
  export GOOGLE_SP_ID=867391054129
  export GOOGLE_IDP_ID=C011l7ud8
  aws-google-auth
}

daemon() {
  cd ~/workspace/DAEMON/
}

db_enc() {
  local env=$1
  local data_bag=$2
  local action=$3
  if [[ "$#" -ne 3 ]]; then
    echo "Require 3 arguments: environment, data bag name and action e.g. edit"
    return 1
  fi
  knife data bag "$action" "$env" "$data_bag" --secret-file ~/.chef/encrypted_data_bag_secret -z
}

db_comp() {
  ~/workspace/GOL/gol-chef-repo/tools/generate_user_report.rb > /tmp/master
  ~/workspace/GOL/gol-chef-repo/tools/generate_user_report.rb -l > /tmp/branch
  diff /tmp/master /tmp/branch
  rm /tmp/master /tmp/branch
}

workspace() {
  cd ~/workspace/$1
}

source <(fzf --zsh)

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# This speeds up pasting w/ autosuggest
# # https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
    zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
       zle -N self-insert $OLD_SELF_INSERT
       }
       zstyle :bracketed-paste-magic paste-init pasteinit
       zstyle :bracketed-paste-magic paste-finish pastefinish
 
load-tfswitch() {
  local tfswitchrc_path=".tfswitchrc"

  if [ -f "$tfswitchrc_path"  ]; then
    tfswitch
  fi
}
add-zsh-hook chpwd load-tfswitch
load-tfswitch

export AWS_SDK_JS_SUPPRESS_MAINTENANCE_MODE_MESSAGE=1

# this should be last
# zprof
