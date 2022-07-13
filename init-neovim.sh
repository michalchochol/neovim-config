
sudo apt-get install neovim

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
sudo mv ./ttf/* ~/.local/share/fonts/hack

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
