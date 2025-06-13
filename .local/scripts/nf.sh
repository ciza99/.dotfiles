#!/bin/bash

# Default: search files and directories
FD_TYPE=""

# Open file or folder with cwd correctly set in Neovim
open_in_nvim() {
  local target="$1"

  if [ -d "$target" ]; then
    nvim --cmd "cd $target"
  elif [ -f "$target" ]; then
    local dir
    dir="$(dirname "$target")"
    nvim --cmd "cd $dir" "$target"
  else
    echo "Error: Target does not exist: $target"
    exit 1
  fi
}

# Parse optional -f (files) and -d (directories)
while getopts "fd" opt; do
  case "$opt" in
    f) FD_TYPE="f" ;;
    d) FD_TYPE="d" ;;
    *) echo "Usage: nzo [-f | -d]"; exit 1 ;;
  esac
done

# Build fd command
FD_CMD=(fd)
[ -n "$FD_TYPE" ] && FD_CMD+=(--type "$FD_TYPE")

# fzf with preview: use bat for files, ls for dirs
selected=$("${FD_CMD[@]}" | fzf \
  --preview='[[ -f {} ]] && bat --style=numbers --color=always --line-range :100 {} || ls -lah {}' \
  --preview-window=right:60%)

# Open selection in neovim
[ -n "$selected" ] && open_in_nvim "$selected" 
