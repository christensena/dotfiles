#!/bin/sh
source lib/colors.sh

symlinks=(
  .gitconfig
  .gitignore-global
  .oh-my-zsh
  .gemrc
  .private
  .exports
  .functions
  .zshrc
  .vimrc
  .vim
)

info () {
  printf "\r\033[2K  [ ${BLUE}..${RESET} ] ${WHITE}${BOLD}$1${RESET}\n"
}

warn () {
  printf "\r\033[2K  [${YELLOW}WARN${RESET}] $1\n"
}

success () {
  printf "\r\033[2K  [ ${GREEN}OK${RESET} ] $1\n"
}

fail () {
  printf "\r\033[2K  [${RED}FAIL${RESET}] $1\n"
  echo ''
  exit
}

link_file () {
  local symlink="$1"
  local target="$HOME/$symlink"
  local source="$(pwd)/$symlink"

  if [ -n "$2" ]; then
    source="$(pwd)/$2"
  fi

  if [ -e "$target" ] && ! [ -h "$target" ]; then
    fail "$target exists. Please backup and/or remove this first"
  elif [ -h "$target" ]; then
    success "Re-linking $symlink"
    rm $target
    ln -s "$source" "$target"
  else
    success "Linking $symlink"
    ln -s "$source" "$target"
  fi
}

info "Linking dotfiles"

for symlink in ${symlinks[*]}
do
  link_file $symlink
done

link_file Library/Application\ Support/Code/User/settings.json vscode-settings.json
