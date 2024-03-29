# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ `uname` == 'Linux' ]]
then
  export LINUX=1
  export GNU_USERLAND=1
else
  export LINUX=
fi

if [[ `uname` == 'Darwin' ]]
then
  export OSX=1
else
  export OSX=
fi

# Detect Macports GNU userland installation
if [[ "$OSX" == "1" ]]
then
  if [[ -e /opt/local/libexec/gnubin ]]
  then
    export GNU_USERLAND=1
  fi
fi




# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode archlinux common-aliases dircycle sudo web-search last-working-dir)

# User configuration
KEYTIMEOUT=1
export PATH="/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/opt/android-ndk:/opt/android-sdk/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt RM_STAR_SILENT
setopt no_bang_hist
unalias rm

# in case there's a gross system default VI (LOOKING AT YOU macOS)
alias vi="vim"

# put dirs first like god intended
alias ls="ls --group-directories-first --color=auto" 
alias tree="tree --dirsfirst"

#alias to go to the root of a git repo
alias cdg='cd `git rev-parse --show-toplevel`'

# command to fix merge conflicts
alias git-fix='git diff --name-only | uniq | xargs vim'

# apstra-specific
alias slicercli_update='docker pull docker-registry:5000/slicercli:latest'
alias slicercli='docker run --rm -i -t -v $HOME:/root  -v $PWD:/project docker-registry:5000/slicercli /usr/local/bin/slicercli -i'

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
ulimit -n 2000

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export EDITOR=vim
export PATH=$HOME/.binctl:$PATH
[ -s "/Users/a6002095/.nvm/nvm.sh" ] && . "/Users/a6002095/.nvm/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$PATH"

export CARP_DIR=~/development/Carp

# plugins
source ~/.zplug/init.zsh
zplug 'wfxr/forgit', defer:1
zplug "b4b4r07/enhancd", use:init.sh
zplug "popstas/zsh-command-time"
zplug "zlsun/solarized-man"
zplug "zsh-users/zsh-autosuggestions"
zplug "csurfer/tmuxrepl"
zplug "romkatv/powerlevel10k", as:theme, depth:1

zplug load

# autosuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
