# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="../custom/themes/candy-custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git git-flow npm web-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Environment Variables
export EDITOR='vi'
export LESS='-R'
#export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESSOPEN='| ~/.oh-my-zsh/custom/lib/lessfilter.sh %s'

export LANG="ja_JP.UTF-8"
export LLC_COLLATE="ja_JP.UTF-8"
export LLC_CTYPE="ja_JP.UTF-8"
export LLC_MESSAGES="ja_JP.UTF-8"
export LLC_MONETARY="ja_JP.UTF-8"
export LLC_NUMERIC="ja_JP.UTF-8"
export LLC_TIME="ja_JP.UTF-8"

# Path
export PATH=/usr/local/opt/ruby/bin:$PATH

# Alias
alias ls="ls -aGpv"
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias tree="nocorrect tree"
alias ccat='pygmentize -O style=monokai -f console256 -g'
alias grunt='nocorrect grunt'

# Node.js
if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
    nvm use v0.10.22
    export NODE_PATH=${NVM_PATH}_modules
fi

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
autoload -U compinit; compinit
