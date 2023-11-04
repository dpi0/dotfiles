# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions dirhistory history docker you-should-use copypath copyfile)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# IMP: ALIASES & FUNCTIONS

lol()
{
    if [ -t 1 ]; then
        "$@" | lolcat
    else
        "$@"
    fi
}

function zip() {
    if [ -z "$1" ]; then
        echo "Usage: tarzip <filename>"
        return 1
    fi
    tar -czvf "$1.tar.gz" "$1"
}


extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.zip) unzip "$1" ;;
      *.tar.gz) tar -xzvf "$1" ;;
      *.tar.bz2) tar -xjvf "$1" ;;
      *.tar) tar -xvf "$1" ;;
      *) echo "Unsupported format" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function cdf () { [ -f "$1" ] && { cd "$(dirname "$1")"; } || { cd "$1"; } ; pwd; }
# to cd into a file's parent dir

i() {
  local clipboard_content=$(xclip -selection clipboard -o)
  cdf "$clipboard_content"
}

alias apt="sudo apt"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new-session -s"
alias tk="t kill-session -t"
alias tr="t rename-session -t"

alias lx="eza --icons -a"
alias l="lx -l"
alias ls="lx -l"
alias lt="lx -T"

alias zshrc="code ~/.zshrc"

alias f="fd --full-path -H"

alias fhome="f . $HOME | fzf"
alias fwin="f . /mnt/c/users/divyansh/documents | fzf"
alias fpreview="fhome --preview 'bat --color=always {}' --preview-window '~3'"
alias fpreviewwin="fwin --preview 'bat --color=always {}' --preview-window '~3'"
alias fcopy="fpreview | xclip -selection clipboard"
alias fcopywin="fpreviewwin | xclip -selection clipboard"

alias s="sudo"

alias ff="cd \$(fpreview)" # will cd into the dir
alias ffw="cd \$(fpreviewwin)" # will cd into the dir
alias fv="fcopy && i" # will cd into the file


alias fff="rg"

alias re="exec zsh"

alias cat="bat"

alias xx="exit"
alias ping="gping"

alias tree="eza --tree --long"

alias jj="j -"

alias history="history | lolcat"

alias ps="ps | lolcat"
alias date="date | lolcat"

alias py="python"
alias ppf="pip freeze | lolcat"
alias install="poetry add"
alias remove="poetry remove"
alias update="poetry update"
alias init="poetry init"
alias new="poetry new"
alias list="poetry show -tlav"
alias shl="poetry shell"
alias search="poetry search"
alias lock="poetry lock"
alias ver="poetry version"
alias about="poetry about"
alias ppr="pip freeze > requirements.txt"

alias status_serv="sudo systemctl status"
alias list_serv="sudo systemctl list-unit-files"
alias start_serv="sudo systemctl start"
alias stop_serv="sudo systemctl stop"

# mark a unit as completely unstartable
alias block_serv="sudo systemctl mask"
alias unblock_serv="sudo systemctl unmask"

alias restart_serv="sudo systemctl reload-or-restart"
alias enable_serv="sudo systemctl enable"
alias disable_serv="sudo systemctl disable"


alias dw="rsync -va --delete /mnt/c/Users/divyansh/Downloads/ $HOME/dwnloads"
alias back="$HOME/wsl_backup.sh"

alias rem="rm -rfi"

alias del="trash-put"
alias dlist="trash-list"
alias drm="trash-rm"
alias dclearrem="trash-empty"
alias drest="trash-restore"

alias ex="extract"

alias open="explorer.exe ."

alias crlist="crontab -l"
alias crnew="crontab -e"
alias crstatus="sudo cat /var/log/syslog | rg CRON"


alias winback="cd /mnt/c/Users/divyansh/Documents/Backup\ Settings\ \&\ Files"
alias cdw="cd /home/dpi0/dwnloads"
alias cdd="cd /home/dpi0/documents"

alias subl="/mnt/c/Users/divyansh/scoop/apps/sublime-text/4-4152/subl.exe"

alias vim=nvim
alias vi=nvim
alias v=nvim













# IMP: EXPORTS

export PIPENV_VENV_IN_PROJECT=0
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:/home/dpi0/.local/bin"
export FZF_DEFAULT_COMMAND="fd --type f"
export ATUIN_NOBIND="true"
# export EDITOR="code --wait"
export EDITOR="vim"
export PATH=$(pwd)/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
bindkey '^r' _atuin_search_widget
export PATH=$PATH:/home/dpi0/go/bin
export PATH=$PATH:/home/dpi0/go/pkg/
export PATH=$PATH:/home/dpi0/go/pkg/mod
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# DANGER: evals at the end
eval "$(zoxide init zsh --cmd j)"
eval "$(atuin init zsh)"
eval "$(pyenv init -)"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
