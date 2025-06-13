eval "$(/opt/homebrew/bin/brew shellenv)"

# lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

bindkey -v # use vi for editing prompt
bindkey -M viins 'jk' vi-cmd-mode # map jk to escape

# set default editor to nvim
export EDITOR=nvim
export KEYTIMEOUT=20

# dotfiles git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# custom aliases
alias f="fzf"
alias nof="~/.local/scripts/fzf-list-old-files.sh"
alias nf="~/.local/scripts/nf.sh"
alias fman="compgen -c | fzf | xargs man"
alias nzo="~/.local/scripts/nvim-zoxide.sh"

# python
PYENV_ROOT="$HOME/.pyenv"

# ocaml
# eval "$(opam env)"

# prevent highlight after paste
zle_highlight=("paste:none")

# nvm paths
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$(yarn global bin)"

export PATH="$PATH:~/.local/bin"

export PATH="$PATH:$(pyenv root)/shims"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

# prompt
eval "$(starship init zsh)"

# Load and initialise completion system
autoload -Uz compinit
compinit

# pnpm
export PNPM_HOME="/Users/michalcizek/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# fzf layout
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "  

# better ls
# options :  --no-filesize --no-time --no-permissions 
alias ls="eza --no-filesize --long --color=always --icons=always --no-user" 

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
