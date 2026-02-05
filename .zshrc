# https://github.com/romkatv/zsh-bench?tab=readme-ov-file#instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_DATA_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/zsh"
ZSH_PLUGINS_ROOT="$ZSH_DATA_ROOT/plugins"
ZPLUGINDIR=$ZSH_PLUGINS_ROOT

[[ -d "$ZSH_DATA_ROOT/powerlevel10k" ]] || git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "$ZSH_DATA_ROOT/powerlevel10k"
[[ -d "$ZSH_PLUGINS_ROOT/zsh_unplugged" ]] || git clone "https://github.com/mattmc3/zsh_unplugged" "$ZSH_PLUGINS_ROOT/zsh_unplugged"
[[ -d "$ZSH_PLUGINS_ROOT/zsh-fzf-history-search" ]] || git clone --depth=1 https://github.com/joshskidmore/zsh-fzf-history-search "$ZSH_PLUGINS_ROOT/zsh-fzf-history-search"
[[ -f "$ZSH_PLUGINS_ROOT/dirhistory/dirhistory.plugin.zsh" ]] || { mkdir -p "$ZSH_PLUGINS_ROOT/dirhistory" && curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/dirhistory/dirhistory.plugin.zsh" -o "$ZSH_PLUGINS_ROOT/dirhistory/dirhistory.plugin.zsh"; }
[[ -f "$ZSH_PLUGINS_ROOT/sudo/sudo.plugin.zsh" ]] || { mkdir -p "$ZSH_PLUGINS_ROOT/sudo" && curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh" -o "$ZSH_PLUGINS_ROOT/sudo/sudo.plugin.zsh"; }

source "$ZSH_DATA_ROOT/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZSH_PLUGINS_ROOT/zsh_unplugged/zsh_unplugged.zsh"
source "$ZSH_PLUGINS_ROOT/dirhistory/dirhistory.plugin.zsh"
source "$ZSH_PLUGINS_ROOT/sudo/sudo.plugin.zsh"
source "$ZSH_PLUGINS_ROOT/zsh-fzf-history-search/zsh-fzf-history-search.zsh"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_PLUGIN_REPOS=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zdharma-continuum/fast-syntax-highlighting
  Aloxaf/fzf-tab
  hlissner/zsh-autopair
)

# OPTIONS

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTTIMEFORMAT="%d/%m/%Y %H:%M] "
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd
autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# EXPORT

export EDITOR="$(command -v nvim)"
export LS_COLORS="$(vivid generate kanagawa)"
export KUBECONFIG="$HOME/.kube/config"
export GPG_TTY="$(tty)"
export MANPAGER='nvim +Man!'
export GOPATH="$HOME/.local/share/go"
export _ZO_MAXAGE=500
export FZF_DEFAULT_OPTS="
  --layout=reverse
  --ansi
  --extended
  --preview='bat --style=numbers --color=always --line-range :500 {}'
  --preview-window='right:50%'
  --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom
  --color=bg+:#000000,fg+:#C8C093,hl+:#FFA066
  --color=bg:#000000,fg:#89877f,hl:#938AA9
  --color=info:#727169,prompt:#957FB8
  --color=pointer:#98bb6c,marker:#d27e99,spinner:#6a9589
  --color=border:#54546d,header:#938aa9
"

# PATH

[[ -d /opt/flutter/bin ]] && path+=(/opt/flutter/bin)
[[ -d ${GOPATH:-$HOME/go}/bin ]] && path+=(${GOPATH:-$HOME/go}/bin)
[[ -d $HOME//scripts ]] && path=($HOME/scripts $path)

# EVAL

eval "$(zoxide init zsh --cmd j)"

# Load plugins after your options, and don't use quotes for this variable
plugin-load $ZSH_PLUGIN_REPOS

# FUNCTIONS

_has_wl_copy() { command -v wl-copy &>/dev/null }

_copy() {
  _has_wl_copy || { echo "wl-copy not installed"; return 1; }
  wl-copy
}

_with_wordchars() {
  local WORDCHARS=${WORDCHARS//[-\/,.:;_=]/}
  "$@"
}

copydir()              { wl-copy <<<"$PWD" }
copylastcommand()      { fc -ln -1 | tr -d '\n' | wl-copy }
copybuffer()           { wl-copy <<<"$BUFFER" }
go_forward_in_words()  { _with_wordchars zle forward-word }
go_back_in_words()     { _with_wordchars zle backward-word }
delete_word()          { _with_wordchars zle backward-delete-word }
restart-shell()        { exec zsh }
sattyf()               { satty --filename="$@" }
fdz()                  { fd "$1" | fzf --preview-window=hidden }

# Ask whether to create a new directory and cd directly into it if yes
sd() {
  [[ -d $1 ]] || {
    read "?Directory '$1' does not exist. Create it? (Y/n): " c
    [[ ${c:-y} == [Yy]* ]] || return 1
    mkdir -p -- "$1"
  }
  builtin cd -- "$1"
}

# List all docker image tags using "regctl"
imagetags() {
  [[ $1 ]] || { echo "Usage: imagetags IMAGE"; return 1 }
  regctl tag ls "$1" | sort -V -r
}

# Use "cheat.sh" to fetch info for a tool
what() {
  [[ $1 ]] || { echo "Usage: what TOOL"; return 1 }
  curl "https://cheat.sh/$1"
}

# Tail logs with bat
batf() {
  command -v bat tail >/dev/null || { echo "bat or tail not installed"; return 1 }
  [[ $1 ]] || { echo "Usage: batf FILE"; return 1 }
  tail -f -- "$1" | bat -l "${1##*.}" --paging=never
}

# Find all files recursively in $PWD
ff() {
  command -v nvim fd fzf >/dev/null || { echo "nvim, fd or fzf not installed"; return 1 }
  fd --type f --hidden . \
    --exclude .git \
    --exclude node_modules \
    --exclude target \
    --exclude dist \
    --exclude .bun \
    --exclude .kube \
    --exclude .dartServer \
    --exclude .gradle \
    --exclude .bundle \
    --exclude .cargo \
    --exclude .cache \
    --exclude .mozilla \
    --exclude .local/state \
    --exclude .local/share \
    2>/dev/null |
    fzf --prompt="nvim> " |
    xargs -r nvim
}

# List recent zoxide directories (alternative to the default: zoxide query -i)
jj() {
  command -v zoxide fzf >/dev/null || { echo "zoxide or fzf not installed"; return 1 }
  local dir
  dir=$(zoxide query -l | fzf --preview-window=hidden) || return
  builtin cd -- "$dir"
}

# KEYBINDS

zle -N go_forward_in_words
zle -N go_back_in_words
zle -N delete_word
zle -N copybuffer
zle -N copydir
zle -N copylastcommand
bindkey -e                                   # Use Emacs key bindings
bindkey '^[[1;5C' go_forward_in_words        # CTRL+right
bindkey '^[[1;5D' go_back_in_words           # CTRL+left
bindkey '^[^?' delete_word                   # ALT+backspace
bindkey '^y' copydir                         # ALT+y - copy curent directory
bindkey '^[o' copybuffer                     # ALT+o - copy current line
bindkey '^[O' copylastcommand                # ALT+SHIFT+o - copy last command
bindkey '^p' history-substring-search-up     # CTRL+p - substring search backward
bindkey '^n' history-substring-search-down   # CTRL+n - substring search forward
bindkey -s '^[v' 'nvim .^M'                  # ALT+v - open neovim in $PWD
bindkey -s '^[f' 'ff^M'                      # ALT+f - find files
bindkey -s '^[e' 'jj^M'                      # ALT+j - zoxide+fzf
bindkey -s ':' '\e[C'                        # ":" - hit forward-arrow (→)

# ALIASES

alias ..='cd ..'
alias ...='cd ../..'
alias md='mkdir -p'
alias lf="yazi"
alias slf="sudo -E yazi"
alias tx="tmux"
alias exc="exec zsh"
alias lz="lazygit"
alias fd='fd -H'
alias v="nvim"
alias vim="nvim"
alias svim="sudo -E nvim"
alias k="kubectl"
alias kx="kubectx"
alias kns="kubens"
alias fz="fzf --preview-window=hidden"
alias t='go-task'
alias task='go-task'
alias ap='ansible-playbook'
alias av='ansible-vault'
alias tf='terraform'
alias vg='vagrant'
alias c='clear'
alias oc='opencode'
alias h="helm"
alias dd='echo "Use --> caligula - https://github.com/ifd3f/caligula"'
alias cat="bat"
alias py="python3"
alias d="docker"
alias rm='echo "This is a dangerous command. Use trash - https://github.com/oberblastmeister/trashy"'
alias cp='rsync --archive --verbose --human-readable --progress --itemize-changes --stats'
alias ls="eza --icons -a -l --time-style relative --changed"
alias l="eza --icons -a -l --time-style relative --changed"
alias lg="eza --icons -a -l --time-style relative --changed -g"
alias g='git'
alias uncommit="git reset HEAD~1"             # Undo the last commit, keep changes staged
alias recommit="git commit --amend --no-edit" # Amend last commit without changing message
alias editcommit="git commit --amend"         # Amend last commit and edit message
alias undocommit="git reset --soft HEAD~1"    # Undo last commit, keep changes staged
