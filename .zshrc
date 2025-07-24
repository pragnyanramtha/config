# --- Powerlevel10k Instant Prompt (keep at the top) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh My Zsh & Theme ---
export ZSH="$HOME/.oh-my-zsh"

# --- Plugins ---
plugins=(zsh-autosuggestions zsh-syntax-highlighting warhol)

# --- Aliases ---
alias gcl="git clone"
alias ga="git add ."
alias gs="git switch -c"
alias gc="git commit -m"
alias gp="git push origin"
alias h="micro"
alias py="python"
alias pipr="pip install -r requirements.txt"
alias pipup="pip install --upgrade pip"
alias pvenv="python -m venv"
alias dfxrun="dfx stop; dfx start --clean --background; dfx deploy"
alias plz="sudo"
alias gst="git status"
alias g="gemini"

act() {
    if [[ -f "$1/bin/activate" ]]; then
source "$1/bin/activate"
    else
        echo "No virtual environment found at $1/bin/activate"
    fi
}


# --- SSH Agent ---

eval "$(ssh-agent -s)" > /dev/null

ssh-add ~/.ssh/ram > /dev/null  2>&1

# --- Source Oh My Zsh ---
source $ZSH/oh-my-zsh.sh

# --- Custom Path Configurations ---
eval "$(starship init zsh)"
# Node.js and NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Rust (Cargo)
export PATH="$HOME/.cargo/bin:$PATH"

# --- Python (pyenv) ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"

# --- Homebrew ---
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# --- Completion & Prompt ---
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export PATH=$PATH:/usr/local/go/bin
# --- Optional/Example Configurations ---
neofetch


# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# export EDITOR="nano"
# export ARCHFLAGS="-arch $(uname -m)"

# Uncomment and edit as needed:
# if [[ -n $SSH_CONNECTION ]]; then
#    export EDITOR='vim'
# else
#    export EDITOR='nvim'
# fi

# For a full list of active aliases, run `alias`.
# Example aliases:
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

. "$HOME/.local/bin/env"

eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
