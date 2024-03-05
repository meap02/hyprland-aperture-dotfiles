# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="refined"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
# User configuration

neofetch
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Loads ~/.zcompdump only once per day thus reducing loading time
autoload -Uz compinit
autoload zmv

if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
	compinit -d $ZSH_COMPDUMP
else
	compinit -C
fi
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.

# auto color my ls and grep command
alias ls='lsd'
alias grep='grep --color=auto'

# ll shortcut
alias ll="lsd -lh"

# e for exit shortcut
alias e='exit'
alias la='lsd -ahl'

# attempt to get gdu to ignore my onedrive
alias gdu="gdu --ignore-dirs-pattern '.*onedrive.*'"

# make df sizes human readable by default
alias df='df -h'

#make cd=z so I use z all the time
alias cd='z'

# Always use nvim
alias vim='nvim'

# add hostname command back
# alias hostname = 
# add zoxide to commands
eval "$(zoxide init zsh)"

