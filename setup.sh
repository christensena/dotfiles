# ht @jeef3


# Git submodules
git submodule init
git submodule update

# Homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)

./.brew

# Link dotfiles
./link.sh


# Zsh
chsh -s /bin/zsh