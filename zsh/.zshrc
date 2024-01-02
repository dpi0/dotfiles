plugins=(git zsh-autosuggestions dirhistory history docker you-should-use copypath copyfile copybuffer)

# copybuffer: use ctrl+o to copy the current current you are about to enter to clipboard
# copyfile: copies the content of a file to clipboard, copyfile <file-name>
# copypath: same as above

setopt EXTENDED_HISTORY

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export DATA="/mnt/data/"

source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/aliases_zsh
export YDOTOOL_SOCKET="$HOME/.ydotool_socket"

export CONFIG="$HOME/.config"
export PATH="$PATH:/home/dpi0/.local/bin"
export EDITOR="/usr/bin/nvim"
# export PATH=$(pwd)/bin:$PATH

# --- fzf ---
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse'
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"


# --- vim & nvim ---
export EDITOR="vim"

# --- golang ----
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/dpi0/go/bin
export PATH=$PATH:/home/dpi0/go/pkg/
export PATH=$PATH:/home/dpi0/go/pkg/mod

# --- pipenv ---
export PIPENV_VENV_IN_PROJECT=0

# --- starship ---
eval "$(starship init zsh)"

# --- zoxide ---
eval "$(zoxide init zsh --cmd j)"

# --- mcfly ---
#eval "$(mcfly init zsh)"

# --- pyenv ---
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# --- zsh config ---
HIST_STAMPS="%d/%m/%Y %H:%M"

#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# --- source ---

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
