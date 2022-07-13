sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get -y update
sudo apt-get -y install neovim

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip
mkdir ~/.local/share/fonts
mkdir ~/.local/share/fonts/hack
sudo mv ./ttf/* ~/.local/share/fonts/hack

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
