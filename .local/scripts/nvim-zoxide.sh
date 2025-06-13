#!/usr/bin/env bash

# Ensure dependencies exist
for cmd in zoxide fzf nvim; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "Error: $cmd is not installed or not in PATH."
    exit 1
  }
done

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

# Zoxide mode (1 argument)
if [ "$#" -eq 1 ]; then
  query="$1"

  # Get all zoxide matches into an array
  mapfile -t matches < <(zoxide query -l | grep -i "$query")

  if [ "${#matches[@]}" -eq 0 ]; then
    echo "No match found for '$query'."
    exit 1
  elif [ "${#matches[@]}" -eq 1 ]; then
    open_in_nvim "${matches[0]}"
  else
    selected=$(printf '%s\n' "${matches[@]}" | fzf \
      --query="$query" \
      --prompt="zoxide match: "\
      --preview='[[ -f {} ]] && bat --style=numbers --color=always --line-range :100 {} || ls -lah {}' \
      --preview-window=right:60%)
    [ -n "$selected" ] && open_in_nvim "$selected"
  fi

# No argument: use fd + fzf
elif [ "$#" -eq 0 ]; then
  selected=$(fd . | fzf \
    --preview='[[ -f {} ]] && bat --style=numbers --color=always --line-range :100 {} || ls -lah {}' \
    --preview-window=right:60%)

  [ -n "$selected" ] && open_in_nvim "$selected"

else
  echo "Usage: nzo [optional search_term]"
  exit 1
fi
