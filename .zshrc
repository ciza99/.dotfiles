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
plug "agkozak/zsh-z"

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
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
