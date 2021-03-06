export PATH=$HOME/opt/cross/bin/:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.cargo/bin/$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH
export PATH=$HOME/Android/Sdk/tools:$PATH
export PATH=$HOME/Android/Sdk/tools/bin:$PATH
export PATH=$HOME/Android/Sdk/emulator:$PATH

export ANDROID_HOME=~/Android/Sdk
export JAVA_HOME=/home/helge/opt/jdk8u252-b09/

# Path to your oh-my-zsh installation.
export ZSH="/home/helge/.oh-my-zsh"

export ZSH_CUSTOM="$ZSH/custom"

[ -e $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="helgefmi"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git autojump virtualenv screen zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR="nvim"

alias vim="nvim"
alias vi="nvim"
alias vimvim="vim ~/.config/nvim/init.vim"

alias sz="source ~/.zshrc"

alias grep="grep --color=auto"
alias ls="ls --color=auto -G"
alias rm="rm -i"

alias python="python3"

function pygrep() {
    grep $@ $(find -name \*.py)
}

function htmlgrep() {
    grep $@ $(find -name \*.html)
}

function jsgrep() {
    grep $@ $(find -name \*.js)
}

# See oh-my-zsh `screen` plugin
TAB_TITLE_PREFIX='"`'$_GET_PATH' | sed "s:..*/::"`$PROMPT_CHAR"'

# Aliases to company/private stuff
[ -e ~/.zshrc.secret ] && source ~/.zshrc.secret

[ -e ~/.cargo/env ] && source ~/.cargo/env
