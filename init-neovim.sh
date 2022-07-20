sudo apt-get -y install ripgrep

wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo dpkg -i --force-overwrite ./nvim-linux64.deb

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
rm -rf ~/.local/share/fonts/hack
mkdir ~/.local/share/fonts
mkdir ~/.local/share/fonts/hack
unzip -d ~/.local/share/fonts/hack Hack.zip 

wget https://github.com/jesseduffield/lazygit/releases/download/v0.34/lazygit_0.34_Linux_x86_64.tar.gz
tar xf lazygit_0.34_Linux_x86_64.tar.gz
sudo mv lazygit /usr/bin/

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
cp -r user ~/.config/nvim/lua/
nvim +PackerSync
