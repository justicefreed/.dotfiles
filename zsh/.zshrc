#export TERM="xterm-256color"

export SHELL=$(which zsh)
source ~/.user_profile &>/dev/null || true

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi


if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ -z "$TMUX_PROGRAM" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.dotfiles/zsh/.ohmyzsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
export ZSH_CUSTOM="$HOME/.dotfiles/zsh/.ohmyzsh-custom"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aliases
    git
    last-working-dir
    ssh
    tailscale
    tmux
    zsh-syntax-highlighting
)
command -v virtualenv && plugins=(autoswitch_virtualenv $plugins)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)

_TM_DARK_GRAY='#282a36'
_TM_LIGHT_GRAY='#44475a'
_TM_BLUE='#6272a4'
_TM_CYAN='#8be9fd'
_TM_GREEN='#50fa7b'
_TM_ORANGE='#ffb86c'
_TM_PINK='#ff79c6'
_TM_PURPLE='#bd93f9'
_TM_RED='#ff5555'
_TM_YELLOW='#f1fa8c'
_TM_WHITE='#f8f8f2'
_TM_BRIGHT_WHITE='#ffffff'
# Define default styles.
# main
ZSH_HIGHLIGHT_STYLES[default]="fg=$_TM_BRIGHT_WHITE"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$_TM_RED,bold"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$_TM_YELLOW"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=$_TM_GREEN,underline"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=$_TM_CYAN"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$_TM_GREEN,underline"
ZSH_HIGHLIGHT_STYLES[commandseparator]="none"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=$_TM_GREEN,underline"
ZSH_HIGHLIGHT_STYLES[path]="fg=$_TM_BRIGHT_WHITE,underline"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$_TM_BLUE"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=$_TM_BLUE"
ZSH_HIGHLIGHT_STYLES[command-substitution]="none"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$_TM_PINK"
ZSH_HIGHLIGHT_STYLES[process-substitution]="none"
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=$_TM_PINK"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="none"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="none"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="none"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]="fg=$_TM_PINK"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$_TM_YELLOW"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$_TM_YELLOW"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$_TM_YELLOW"
ZSH_HIGHLIGHT_STYLES[rc-quote]="fg=$_TM_CYAN"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$_TM_CYAN"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=$_TM_CYAN"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=$_TM_CYAN"
ZSH_HIGHLIGHT_STYLES[assign]="none"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=$_TM_YELLOW"
ZSH_HIGHLIGHT_STYLES[comment]="fg=$_TM_LIGHT_GRAY,bold"
ZSH_HIGHLIGHT_STYLES[named-fd]="none"
ZSH_HIGHLIGHT_STYLES[numeric-fd]="none"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=$_TM_GREEN"
# brackets
# To define styles for nested brackets up to level 4"
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=$_TM_BLUE,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=red,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=yellow,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=magenta,bold"


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
export EDITOR="nano"
alias sudo='sudo '
alias nano='nano --rcfile ~/.nanorc'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
## Colorize the ls output ##
alias ls='lsd'
alias la='ls -A'
## Use a long listing format ##
alias ll='lsd -lA'
## Show hidden files ##
alias l.='lsd -A -d .*'
alias grep='grep --colour=auto'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
