brew install neovim

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
