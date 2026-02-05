BASH_DATA_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/bash"
BASH_PLUGINS_ROOT="$BASH_DATA_ROOT/plugins"

[[ -d "$BASH_PLUGINS_ROOT/fzf-tab-completion" ]] || git clone --depth=1 https://github.com/lincheney/fzf-tab-completion "$BASH_PLUGINS_ROOT/fzf-tab-completion"

source "$BASH_PLUGINS_ROOT/fzf-tab-completion/bash/fzf-bash-completion.sh"

# OPTIONS

PS1='\[\e[38;5;175m\]\u\[\e[90m\]@\[\e[38;5;147m\]\H\[\e[0m\] \[\e[90m\]in\[\e[0m\] \[\e[38;5;148;1m\]\w\[\e[0m\] \[\e[90;1m\]\[\e[0m\] '
HISTFILE="$HOME/.bash_history"
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT="%d/%m/%Y %H:%M "
shopt -s histappend # appendhistory
shopt -s cmdhist    # save multi-line as one
shopt -s lithist    # preserve line breaks
shopt -s histverify
shopt -s histreedit

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# EXPORT

export KUBECONFIG="$HOME/.kube/config"
export GPG_TTY="$(tty)"
export MANPAGER='nvim +Man!'
export EDITOR="$(command -v nvim)"
export HISTCONTROL=ignoredups:erasedups:ignorespace
export FZF_DEFAULT_OPTS="
  --layout=reverse
  --ansi
  --extended
  --preview-window='right:50%'
  --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom
"

# PATH
[[ -d $HOME/.local/bin ]] && PATH="$HOME/.local/bin:$PATH"
export PATH

eval "$(zoxide init bash --cmd j)"
eval "$(fzf --bash)"

# KEYBINDS

bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'
bind '"\e[1;5C": forward-word'  # CTRL+Right
bind '"\e[1;5D": backward-word' # CTRL+Left
bind -x '"\t": fzf_bash_completion'

# FUNCTIONS

sd() {
  [ -d "$1" ] || {
    printf "Directory '%s' does not exist. Create it? (Y/n): " "$1"
    read -r c
    case "${c:-y}" in [Yy]*) mkdir -p -- "$1" ;; *) return 1 ;; esac
  }
  builtin cd -- "$1"
}

imagetags() {
  [ "$1" ] || {
    echo "Usage: imagetags IMAGE"
    return 1
  }
  regctl tag ls "$1" | sort -V -r
}

what() {
  [ "$1" ] || {
    echo "Usage: what TOOL"
    return 1
  }
  curl "https://cheat.sh/$1"
}

batf() {
  command -v bat >/dev/null && command -v tail >/dev/null || {
    echo "bat or tail not installed"
    return 1
  }
  [ "$1" ] || {
    echo "Usage: batf FILE"
    return 1
  }
  tail -f -- "$1" | bat -l "${1##*.}" --paging=never
}

ff() {
  command -v nvim >/dev/null && command -v fd >/dev/null && command -v fzf >/dev/null || {
    echo "nvim, fd or fzf not installed"
    return 1
  }
  fd --type f --hidden . --exclude .git \
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
    --exclude .local/share 2>/dev/null | fzf --preview='bat --style=numbers --color=always --line-range :500 {}' --prompt="nvim> " | xargs -r nvim
}

jj() {
  command -v zoxide >/dev/null && command -v fzf >/dev/null || {
    echo "zoxide or fzf not installed"
    return 1
  }
  local dir
  dir=$(zoxide query -l | fzf --preview-window=hidden) || return
  builtin cd -- "$dir"
}

dr() {
  [[ "$1" == "-h" || "$1" == "--help" ]] && {
    echo "Usage: dr [SERVICE...]  Restart docker compose services."
    return
  }
  d compose down "$@" && d compose up -d "$@"
}

# Custom version of the "__fzf_history__()" generated from "fzf --bash", with no preview-window
# Override the default function
__fzf_history__() {
  fzf_history
}

fzf_history() {
  local output script
  script='BEGIN { getc; $/ = "\n\t"; $HISTCOUNT = $ENV{last_hist} + 1 }
          s/^[ *]//; s/\n/\n\t/gm;
          print $HISTCOUNT - $. . "\t$_" if !$seen{$_}++'

  output=$(
    set +o pipefail
    builtin fc -lnr -2147483648 |
      last_hist=$(HISTTIMEFORMAT='' builtin history 1) perl -n -l0 -e "$script" |
      FZF_DEFAULT_OPTS= \
        fzf --no-preview --height=40% --reverse --scheme=history \
        --bind=ctrl-r:toggle-sort,alt-r:toggle-raw \
        --wrap-sign=$'\t↳ ' \
        --highlight-line \
        +m --read0
  ) || return

  READLINE_LINE=$(perl -pe 's/^\d*\t//' <<<"$output")
  READLINE_POINT=${#READLINE_LINE}
}

# ALIASES

alias exc="exec bash"
alias ..='cd ..'
alias ...='cd ../..'
alias md='mkdir -p'
alias lf="yazi"
alias slf="sudo -E yazi"
alias tx="tmux"
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
alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}\t{{if .Ports}}{{.Ports}}{{else}}-{{end}}"'
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
