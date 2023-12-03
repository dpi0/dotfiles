plugins=(git zsh-autosuggestions dirhistory history docker you-should-use copypath copyfile)

export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"

source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/.zsh_aliases

export CONFIG="$HOME/.config"
export PATH="$PATH:/home/dpi0/.local/bin"
# export EDITOR="subl"
# export PATH=$(pwd)/bin:$PATH

# --- fzf ---
export FZF_DEFAULT_COMMAND="fd --type f"

# --- vim & nvim ---
export EDITOR="vim"

# --- golang ----
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/dpi0/go/bin
export PATH=$PATH:/home/dpi0/go/pkg/
export PATH=$PATH:/home/dpi0/go/pkg/mod

# --- pipenv ---
export PIPENV_VENV_IN_PROJECT=0

# --- atuin ---
export ATUIN_NOBIND="true"
bindkey '^r' _atuin_search_widget
eval "$(atuin init zsh)"

# --- starship ---
eval "$(starship init zsh)"

# --- zoxide ---
eval "$(zoxide init zsh --cmd j)"

# --- pyenv ---
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# --- zsh config ---
HIST_STAMPS="%d/%m/%Y — %H:%M"

#ENABLE_CORRECTION="true"
#COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# --- source ---

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
