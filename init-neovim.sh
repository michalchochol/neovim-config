#sudo add-apt-repository -y ppa:neovim-ppa/unstable
#sudo apt-get -y update
#sudo apt-get -y install neovim

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
rm -rf ~/.local/share/fonts/hack
mkdir ~/.local/share/fonts
mkdir ~/.local/share/fonts/hack
unzip -d ~/.local/share/fonts/hack Hack.zip 

#mv ~/.config/nvim ~/.config/nvim.bak
#mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak

#git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
#nvim +PackerSync
