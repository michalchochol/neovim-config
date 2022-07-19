brew install neovim

brew tap homebrew/cask-fonts
brew install ripgrep
brew install lazygit
brew install --cask font-hack-nerd-font

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
