brew install neovim

brew tap homebrew/cask-fonts
brew install ripgrep
brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker
brew install --cask font-hack-nerd-font

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
cp -r user ~/.config/nvim/lua/
nvim +PackerSync
